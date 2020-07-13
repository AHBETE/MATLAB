function [Emid] = bisection_d_well_solve(Ehi, Elo, V0, xl, xr, xm, a, b, dx)
% BISECTION_D_WELL_SOLVE solve eigen energies and wave equations of a
% double well.
%
% Input argurment:
% Ehi......................Estimated upper bound of energy (eV)
% Elo......................Estimated lower bound of energy (eV)
% V0.......................Potential of wells (eV)
% xl.......................Left most point where wave function ~0 (fm)
% xr.......................Right most point where wave function ~0 (fm)
% xm.......................An arbitrary matching point inside well (fm)
% a........................Width of wells (fm)
% b........................Speration of wells (fm)

% Based on the code bisection_sq_well_solve.m by Dr. Vishwanath

[psi_l, phi_l, xlvec] = solve_from_left_(Ehi, V0, xl, xm, a, b, dx);
[psi_r, phi_r, xrvec] = solve_from_right_(Ehi, V0, xr, xm, a, b, -dx);
delta_hi = deltaE_est(psi_l, phi_l, xlvec, psi_r, phi_r, xrvec, xm);

[psi_l, phi_l, xlvec] = solve_from_left_(Elo, V0, xl, xm, a, b, dx);
[psi_r, phi_r, xrvec] = solve_from_right_(Elo, V0, xr, xm, a, b, -dx);
delta_lo = deltaE_est(psi_l, phi_l, xlvec, psi_r, phi_r, xrvec, xm);

if delta_lo*delta_hi > 0
	fprintf('delta_hi = %f; delta_lo = %f \n', delta_hi, delta_lo);
	error('Cannot solve with bisection');
end

TOL=1E-6;
d_mid = delta_hi;
iter = 0;
% fprintf('n=%d: D(E_hi)=%f, D(E_lo)=%f, \n', iter, delta_hi, delta_lo );

while abs(d_mid) >TOL && iter < 500
	Emid = 0.5.*(Ehi+Elo);
	[psi_l, phi_l, xlvec] = solve_from_left_(Emid, V0, xl, xm, a, b, dx);
	[psi_r, phi_r, xrvec] = solve_from_right_(Emid, V0, xr, xm, a, b, -dx);
	d_mid = deltaE_est(psi_l, phi_l, xlvec, psi_r, phi_r, xrvec, xm);

	fprintf('n=%d: D(E_hi)=%f, D(E_lo)=%f, D(E_mid)=%f\n', iter, delta_hi, delta_lo, d_mid);
	fprintf('\t E_hi/V0=%f, E_lo/V0=%f, E_mid/V0=%f\n', Ehi/V0, Elo/V0, Emid/V0);
	if d_mid*delta_hi < 0
		Elo = Emid;
		delta_lo = d_mid;
	else
		Ehi = Emid;
		delta_hi = d_mid;
	end
	iter = iter+1;
end

% if iter == 500
% 	fprintf('Did not find eigenvalues \n');
% else
	fprintf('Eigenvalue = %f (MeV), (fraction E/V0 = %f) \n', Emid.*1E-6, Emid./V0);
	[psi_l, phi_l, xlvec] = solve_from_left_(Emid, V0, xl, xm, a, b, dx);
	[psi_r, phi_r, xrvec] = solve_from_right_(Emid, V0, xr, xm, a, b, -dx);
	figure(1); clf;
	subplot(2,1,1); 
	plot(xlvec, psi_l, '-k', xlvec, phi_l, '--k', xrvec, psi_r, '-r', xrvec, phi_r, '--r', 'Linewidth', 2);
	legend('\psi_L(x)', '\phi_L(x)', '\psi_R(x)', '\phi_R(x)');
	title('Even...');
	subplot(2,1,2); 
	plot(xlvec, psi_l, '-k', xlvec, phi_l, '--k', xrvec, -psi_r, '-r', xrvec, -phi_r, '--r', 'Linewidth', 2);
	title('Odd...');
% end
