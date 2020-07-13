function [xt,yt,vxt,vyt] = compute_orbits_RK4_nbody(x0, y0, vx0, vy0, ms, tvec)
% keyboard
% Compute motion of Nbodies under mutual force of gravity. 
% Solved using the RK4 numerical approach of coupled IVPs
% 	each body has 4 coupled differential equations 
% 
% function [xt,yt,vxt,vyt] = compute_orbits_RK4_nbody(x0, y0, vx0, vy0, ms, tvec)
% 
% INPUTS:
% 		x0,y0,vx0,vy0 -> initial conditions
% 			Each of these is a Nx1 vector, specifying the IVs for N objects
% 		ms -> Nx1 vector (masses of each of the N bodies)
% 		tvec -> Mx1 vector (assumed to be linearly spaced) indicating the time
% 

if ~isvector(x0) | ~isvector(y0) | ~isvector(vx0) | ~isvector(vy0) | ~isvector(ms) | ~isvector(tvec)
	error('All inputs must be vectors!');
end

if length(ms) ~= length(x0)
	error('Mismatch in x0 input lengths');
elseif length(ms) ~= length(y0)
	error('Mismatch in y0 input lengths');
elseif length(ms) ~= length(vx0)
	error('Mismatch in vx0 input lengths');
elseif length(ms) ~= length(vy0)
	error('Mismatch in vy0 input lengths');
end

% initialize all output variables 
xt = zeros(length(tvec), length(x0)); %rows-> time, cols->object
yt = zeros(length(tvec), length(x0)); %rows-> time, cols->object
vxt = zeros(length(tvec), length(x0)); %rows-> time, cols->object
vyt = zeros(length(tvec), length(x0)); %rows-> time, cols->object

% we'll assume that x0,y0,vx0,vy0 are all row vectors (i.e. only have columns)
% set initial values first:
xt(1,:) = x0;
yt(1,:) = y0;
vxt(1,:) = vx0;
vyt(1,:) = vy0;

deltat = tvec(2)-tvec(1); %get dt step from input
for tcount=2:length(tvec);
	xp = xt(tcount-1,:); %previous value
	yp = yt(tcount-1,:); 
	vxp = vxt(tcount-1,:); 
	vyp = vyt(tcount-1,:); 
	
	% need the four intermediate steps for RK4 ...
	% have to compute x/y/vx/vy at intermediate points and then use those
	% values to calculate the 4 RK4 terms to iterate forward
	% xp/yp/vxp/vyp are the first terms for each variable sought
	
	[Fx1, Fy1] = nBodyGForcecalc_2D(xp,yp,ms);

	x2 = xp + 0.5.*deltat.*vxp;
	y2 = yp + 0.5.*deltat.*vyp;
	vx2 = vxp + 0.5.*deltat.*Fx1./ms;
	vy2 = vyp + 0.5.*deltat.*Fy1./ms;
	[Fx2, Fy2] = nBodyGForcecalc_2D(x2,y2,ms);

	x3 = xp + 0.5.*deltat.*vx2;
	y3 = yp + 0.5.*deltat.*vy2;
	vx3 = vxp + 0.5.*deltat.*Fx2./ms;
	vy3 = vyp + 0.5.*deltat.*Fy2./ms;
	[Fx3, Fy3] = nBodyGForcecalc_2D(x3,y3,ms);
	
	x4 = xp + deltat.*vx3;
	y4 = yp + deltat.*vy3;
	vx4 = vxp + deltat.*Fx3./ms;
	vy4 = vyp + deltat.*Fy3./ms;
	[Fx4, Fy4] = nBodyGForcecalc_2D(x4,y4,ms);
	
	% now we compute the forward steps for each variable
	xt(tcount,:) = xp + (deltat./6).*(vxp + 2.*vx2 + 2.*vx3 + vx4);
	yt(tcount,:) = yp + (deltat./6).*(vyp + 2.*vy2 + 2.*vy3 + vy4);
	vxt(tcount,:) = vxp + (deltat./6).*(Fx1 + 2.*Fx2 + 2.*Fx3 + Fx4)./ms;
	vyt(tcount,:) = vyp + (deltat./6).*(Fy1 + 2.*Fy2 + 2.*Fy3 + Fy4)./ms;

end
