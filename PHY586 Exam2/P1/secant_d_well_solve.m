function [Enew] = secant_d_well_solve(E1, E2, V0, xl, xr, xm, a, b, dx)
% SECANT_D_WELL_SOLVE solve eigen energies and wave equations of a
% double well.
%
% Input argurments:
% Ehi......................Estimated upper bound of energy (eV)
% Elo......................Estimated lower bound of energy (eV)
% V0.......................Potential of wells (eV)
% xl.......................Left most point where wave function ~0 (fm)
% xr.......................Right most point where wave function ~0 (fm)
% xm.......................An arbitrary matching point inside well (fm)
% a........................Width of wells (fm)
% b........................Speration of wells (fm)
%
% output arguments:
% Enew.....................The best estimated eigen energy found

% Based on the code bisection_sq_well_solve.m by Dr. Vishwanath

[psi_l, phi_l, xlvec] = solve_from_left_(E1, V0, xl, xm, a, b, dx);
[psi_r, phi_r, xrvec] = solve_from_right_(E1, V0, xr, xm, a, b, -dx);
delta_hi = deltaE_est(psi_l, phi_l, xlvec, psi_r, phi_r, xrvec, xm);

[psi_l, phi_l, xlvec] = solve_from_left_(E2, V0, xl, xm, a, b, dx);
[psi_r, phi_r, xrvec] = solve_from_right_(E2, V0, xr, xm, a, b, -dx);
delta_lo = deltaE_est(psi_l, phi_l, xlvec, psi_r, phi_r, xrvec, xm);

TOL=1E-6;
d_new = delta_lo;
iter = 0;

while abs(d_new) >TOL && iter < 500 && abs(E1-E2)>TOL
    if abs(delta_lo-delta_hi)<1E-6
        warning(['Result may not be accurate using secant method due to ',...
        'small difference in logarithmic derivatives.',...
        'Try different inital guess for E or use different match point.'])
    end
	Enew = E2-delta_lo*(E2-E1)/(delta_lo-delta_hi);
	[psi_l, phi_l, xlvec] = solve_from_left_(Enew, V0, xl, xm, a, b, dx);
	[psi_r, phi_r, xrvec] = solve_from_right_(Enew, V0, xr, xm, a, b, -dx);
	d_new = deltaE_est(psi_l, phi_l, xlvec, psi_r, phi_r, xrvec, xm);

%  	fprintf('n=%d: D(E_hi)=%f, D(E_lo)=%f, D(E_mid)=%f\n', iter, delta_hi, delta_lo, d_new);
%  	fprintf('\t E_hi/V0=%f, E_lo/V0=%f, E_mid/V0=%f\n', Ehi/V0, Elo/V0, Enew/V0);
 
    E1 = E2;
    E2 = Enew;
    delta_lo = d_new;

	iter = iter+1;
end  

fprintf('Eigenvalue = %f (MeV), (fraction E/V0 = %f), iter = %f \n', Enew.*1E-6, Enew./V0, iter);
[psi_l, phi_l, xlvec] = solve_from_left_(Enew, V0, xl, xm, a, b, dx);
[psi_r, phi_r, xrvec] = solve_from_right_(Enew, V0, xr, xm, a, b, -dx);

str=strcat('E = ',num2str(Enew/10E6), ' MeV, ');

figure(); clf;
subplot(2,1,1); 
plot(xlvec, psi_l, '-k', xlvec, phi_l, '--k', xrvec, psi_r, '-r', xrvec, phi_r, '--r', 'Linewidth', 1);
legend('\psi_L(x)', '\phi_L(x)', '\psi_R(x)', '\phi_R(x)');
title([str,'Even...']);
subplot(2,1,2); 
plot(xlvec, psi_l, '-k', xlvec, phi_l, '--k', xrvec, -psi_r, '-r', xrvec, -phi_r, '--r', 'Linewidth', 1);
title([str,'Odd...']);