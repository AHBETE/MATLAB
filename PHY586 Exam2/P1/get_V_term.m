function Vxterm = get_V_term(x, V0, a, b, E) 
% GET_V_TERM create a double well potential.
%
% input arguments:
% x........................Postition where potential to be evaled
% V0.......................Potential of wells (eV)
% a........................Width of wells (fm)
% b........................Speration of wells (fm)
% E........................Energy at x
%
% output arguments:
% V........................Potential at x

% Based on the code solve_from_left.m by Dr. Vishwanath

hbar = 1.0546E-34; %hbar in SI units
mp = 1.6726E-27; %mass of proton in SI units
qe = 1.6022E-19; %charge on electron to convert eV -> J

if abs(x) > (a+b/2)
    Vx = 0;   
elseif abs(x) < (b/2)
    Vx = 0;   
else 
    Vx = V0; 
end 

Vxterm = 2.*mp.*(Vx-E).*qe/(hbar.^2); %units of m^-2
Vxterm = Vxterm.*1E-30; %keep in fm^-2 units...