function [psi_l, phi_l, xvec] = solve_from_left_(E, V0, xl, xm, a, b, dx)
% SOLVE_FROM_LEFT_ using RK4 method to creat a wave function and its
% derivative towards right.
%
% function [psi_l] = solve_from_left(E, V0, xl, xm)
% Solve Schrodinger's equation for a finite square well using RK4
% The IVP solution is iterated from a given x=xl 
% Solution is computed till x>=xm
%
% INPUTS:
% 	E: the energy in eV (guessed; E is expected to be -ve)
% 	V0: the potential in eV (expected to be -ve)
% 	xl: the left (far) point (in fm)
% 	xm: the matching "radius" (in fm)
% 	a: the well-width (in fm) 
%   b: seperation of wells (in fm)
% 	dx: the step-size (in fm)
%
% OUTPUTS:
% 	psi_l: the iterated wavefunction (from the left)
% 	phi_l: the iterated first derivative (from the left)

% Based on the code solve_from_left.m by Dr. Vishwanath

if E>=0 
	error('Bound state energies are expected to be negative!');
end
if V0>=0
	error('A square well potential must be attractive!');
end
if a < 0
	error('Well width must be positive');
end
if xl > -a 
	error('xl must be smaller than well-width');
end
if xm < xl
	error('xm must be > xl');
end

% get "initial" values
kappa = sqrt(get_V_term(xl, V0, a, b, E));
psi_l(1) = exp(xl.*kappa);
phi_l(1) = kappa.*psi_l(1);
xvec(1) = xl;
xp = xl;

index=1;
while xp < xm
	x1 = xp;
	psi1 = psi_l(index);
	phi1 = phi_l(index);

	x2 = xp + dx./2;
	psi2 = psi1 + (dx./2).*phi1;
	phi2 = phi1 + (dx./2).*get_V_term(x1, V0, a, b, E).*psi1;

	x3 = xp + dx./2;
	psi3 = psi1 + (dx./2).*phi2;
	phi3 = phi1 + (dx./2).*get_V_term(x2, V0, a, b, E).*psi2;

	x4 = xp + dx;
	psi4 = psi1 + (dx).*phi3;
	phi4 = phi1 + (dx).*get_V_term(x3, V0, a, b, E).*psi3;
	
	psi_l(index+1) = psi1 + (dx./6).*(phi1 + 2.*phi2 + 2.*phi3 + phi4);
	phi_l(index+1) = phi1 + (dx./6).*(get_V_term(x1,V0,a,b,E).*psi1 + 2.*get_V_term(x2,V0,a,b,E).*psi2 + 2.*get_V_term(x3,V0,a,b,E).*psi3 + get_V_term(x4,V0,a,b,E).*psi4);
	xp = xp + dx;
	xvec(index+1) = xp;
	index = index+1;
end