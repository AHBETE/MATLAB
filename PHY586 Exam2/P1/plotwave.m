function plotwave(Enew, V0, xl, xr, xm, a, b, dx)
% PLOTWAVE plot wave function of a double well at given energy level; the
% result may not be physical.
%
% Input argurments:
% Enew.....................Energy level (eV)
% V0.......................Potential of wells (eV)
% xl.......................Left most point where wave function ~0 (fm)
% xr.......................Right most point where wave function ~0 (fm)
% xm.......................An arbitrary matching point inside well (fm)
% a........................Width of wells (fm)
% b........................Speration of wells (fm)
%

% Based on the code bisection_sq_well_solve.m by Dr. Vishwanath

[psi_l, phi_l, xlvec] = solve_from_left_(Enew, V0, xl, xm, a, b, dx);
[psi_r, phi_r, xrvec] = solve_from_right_(Enew, V0, xr, xm, a, b, -dx);
figure(); clf;
subplot(2,1,1); 
plot(xlvec, psi_l, '-k', xlvec, phi_l, '--k', xrvec, psi_r, '-r', xrvec, phi_r, '--r', 'Linewidth', 2);
legend('\psi_L(x)', '\phi_L(x)', '\psi_R(x)', '\phi_R(x)');
title('Even...');
subplot(2,1,2); 
plot(xlvec, psi_l, '-k', xlvec, phi_l, '--k', xrvec, -psi_r, '-r', xrvec, -phi_r, '--r', 'Linewidth', 2);
title('Odd...');