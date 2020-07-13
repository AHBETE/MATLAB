function [psi_r, phi_r, xvec] = solve_from_right_(E, V0, xr, xm, a, b, dx)
% SOLVE_FROM_RIGHT_ using RK4 method to creat a wave function and its
% derivative towards left.
%
% function [psi_r] = solve_from_left(E, V0, xr, xm)
% Solve Schrodinger's equation for a finite square well using RK4
% The IVP solution is iterated from a given x=xr 
% Solution is computed till x>=xm
%
% INPUTS:
% 	E: the energy in eV (guessed; E is expected to be -ve)
% 	V0: the potential in eV (expected to be -ve)
% 	xr: the left (far) point (in fm)
% 	xm: the matching "radius" (in fm)
% 	a: the well-width (in fm) 
%   b: seperation of wells (in fm)
% 	dx: the step-size (in fm) [This must be -ve here!]
%
% OUTPUTS:
% 	psi_r: the iterated wavefunction (from the left)
% 	phi_r: the iterated first derivative (from the left)

% Based on the code solve_from_right.m by Dr. Vishwanath

if E>=0 
	error('Bound state energies are expected to be negative!');
end
if V0>=0
	error('A square well potential must be attractive!');
end
if a < 0
	error('Well width must be positive');
end
if xr < a 
	error('xr must be larger than well-width');
end
if xm > xr
	error('xm must be < xr');
end
if dx > 0
	error('Need negative step size here!');
end

% get "initial" values
kappa = sqrt(get_V_term(xr, V0, a, b, E));
psi_r(1) = exp(-xr.*kappa);
phi_r(1) = -kappa.*psi_r(1);
xvec(1) = xr;
xp = xr;

index=1;
while xp > xm
	x1 = xp;
	psi1 = psi_r(index);
	phi1 = phi_r(index);

	x2 = xp + dx./2;
	psi2 = psi1 + (dx./2).*phi1;
	phi2 = phi1 + (dx./2).*get_V_term(x1, V0, a, b, E).*psi1;

	x3 = xp + dx./2;
	psi3 = psi1 + (dx./2).*phi2;
	phi3 = phi1 + (dx./2).*get_V_term(x2, V0, a, b, E).*psi2;

	x4 = xp + dx;
	psi4 = psi1 + (dx).*phi3;
	phi4 = phi1 + (dx).*get_V_term(x3, V0, a, b, E).*psi3;
	
	psi_r(index+1) = psi1 + (dx./6).*(phi1 + 2.*phi2 + 2.*phi3 + phi4);
	phi_r(index+1) = phi1 + (dx./6).*(get_V_term(x1,V0,a,b,E).*psi1 + 2.*get_V_term(x2,V0,a,b,E).*psi2 + 2.*get_V_term(x3,V0,a,b,E).*psi3 + get_V_term(x4,V0,a,b,E).*psi4);
	xp = xp + dx;
	xvec(index+1) = xp;

	index = index+1;
end