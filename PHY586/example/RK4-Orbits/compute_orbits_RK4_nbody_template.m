function [xt,yt,vxt,vyt] = compute_orbits_RK4_nbody_template(x0, y0, vx0, vy0, ms, tvec)

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
for tcount=2:length(tvec)
	xp = xt(tcount-1,:); %previous value
	yp = yt(tcount-1,:); 
	vxp = vxt(tcount-1,:); 
	vyp = vyt(tcount-1,:); 
	
	% need the four intermediate steps for RK4 ...
	% have to compute x/y/vx/vy at intermediate points and then use those
	% values to calculate the 4 RK4 terms to iterate forward
	% xp/yp/vxp/vyp are the first terms for each variable sought
	
	x1 = xp;
	y1 = yp;
	vx1 = vxp;
	vy1 = vyp;
	[Fx1, Fy1] = nBodyGForcecalc_2D(xp,yp,ms);

	x2 = xp+vxp*0.5*deltat;
	y2 = yp+vyp*0.5*deltat;
	vx2 = vxp+(Fx1./ms)*0.5*deltat;
	vy2 = vyp+(Fy1./ms)*0.5*deltat;
	[Fx2, Fy2] = nBodyGForcecalc_2D(x2,y2,ms);

	x3 = xp+vx2*0.5*deltat;
	y3 = yp+vy1*0.5*deltat;
	vx3 = vxp+(Fx2./ms)*0.5*deltat;
	vy3 = vyp+(Fy2./ms)*0.5*deltat;
	[Fx3, Fy3] = nBodyGForcecalc_2D(x3,y3,ms);
	
	x4 = xp+vx3*deltat;
	y4 = yp+vy3*deltat;
	vx4 = vxp+(Fx3./ms)*deltat;
	vy4 = vyp+(Fy3./ms)*deltat;
	[Fx4, Fy4] = nBodyGForcecalc_2D(x4,y4,ms);
	
	% now we compute the forward steps for each variable
	xt(tcount,:) = xp + (deltat./6).*(vx1+2.*vx2+2.*vx3+vx4 );
	yt(tcount,:) = yp + (deltat./6).*(vy1+2.*vy2+2.*vy3+vy4 );
	vxt(tcount,:) = vxp + (deltat./6).*((Fx1+2.*Fx2+2.*Fx3+Fx4 )./ms); 
	vyt(tcount,:) = vyp + (deltat./6).*((Fy1+2.*Fy2+2.*Fy3+Fy4 )./ms);

    
end
