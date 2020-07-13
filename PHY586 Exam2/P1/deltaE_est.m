function [delta] = deltaE_est(psi_l, phi_l, xvecl, psi_r, phi_r, xvecr, xm)
% DELTAE_EST finds mismatch of wavefucntions in the logarithmic derivatives.
%
% input arguments:
% wave function, its derivative, and postion from left
% wave function, its derivative, and postion from right
% xm........................matching position
%
% output arguments:
% delta.....................the logarithmic derivatives

% Based on the code solve_from_left.m by Dr. Vishwanath

psi_lxm = interp1(xvecl, psi_l, xm);
psi_rxm = interp1(xvecr, psi_r, xm);
phi_lxm = interp1(xvecl, phi_l, xm);
phi_rxm = interp1(xvecr, phi_r, xm);

delta = phi_rxm./psi_rxm - phi_lxm./psi_lxm;
delta = delta./((phi_rxm./psi_rxm) + (phi_lxm./psi_lxm));%