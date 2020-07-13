function Vxterm = get_Vx_term(x, V0, a, E) 
% get the RHS of Schrodinger's equation ...

	hbar = 1.0546E-34; %hbar in SI units
	mp = 1.6726E-27; 	%mass of proton in SI units
	qe = 1.6022E-19; %charge on electron to convert eV -> J

	if abs(x) > a
		Vx = 0; 
	else 
		Vx = V0; 
	end 

	Vxterm = 2.*mp.*(Vx-E).*qe/(hbar.^2); %units of m^-2
	Vxterm = Vxterm.*1E-30;  %keep in fm^-2 units...

