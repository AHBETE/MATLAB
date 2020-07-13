function [Fx,Fy] = nBodyGForcecalc_2D(posx, posy, masses)

% An N-body, 2d Gravitational Force calculator...
% 
% function [Fx,Fy] = nBodyGForcecalc_2D(posx, posy, masses)
%
% Calculates (in 2D) the Fx and Fy components for an N body problem
% The forces are computed by superpositions and are only due to 
% the universal force of G
% 
% INPUTS: 
% posx: Nx1 vector of x-positions (x-positions of N objects)
% posy: Nx1 vector of y-positions (y-positions of N objects)
% masses: Nx1 vector of masses 
% 
% OUTPUTS:
% Fx,Fy: the net (vector) sum of forces in the x and y directions
% 	Fx and Fy are Nx1 vectors (length of posx, posy or masses)
% 	where,
% 	Fx(1) is the x-component of force on object 1 due to all others
% 	Fx(2) is the x-component of force on object 2 due to all others
% 	Fx(N) is the x-component of force on object N due to all others
% 	...
% 	Fy(1), Fy(2) ... Fy(N) are identically the y-component of the force
%

if length(posx) ~= length(posy)
	error('x and y positions have to be equal');
elseif length(posx) ~= length(masses)
	error('need as many x locations as masses');
end

% need two loops, to compute total force on each mass
% similar to Lagrange interp polynomials

% first initialize the force vectors
Fx = zeros(size(posx));
Fy = zeros(size(posx));

for nout = 1:length(posx)
	Fxtot = 0;
	Fytot = 0;
	for nin = 1:length(posx)
		if nin ~= nout
			fxy = twoBody_2DGCalc(posx([nout nin]), posy([nout nin]), masses([nout nin]));
			Fxtot = Fxtot + fxy(1);
			Fytot = Fytot + fxy(2);
		end
	end
	Fx(nout) = Fxtot;
	Fy(nout) = Fytot;
end
