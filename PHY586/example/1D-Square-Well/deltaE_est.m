function [delta] = deltaE_est(psi_l, phi_l, xvecl, psi_r, phi_r, xvecr, xm)

psi_lxm = interp1(xvecl, psi_l, xm);
psi_rxm = interp1(xvecr, psi_r, xm);
phi_lxm = interp1(xvecl, phi_l, xm);
phi_rxm = interp1(xvecr, phi_r, xm);

% psi_lxm = psi_l(end-1);
% psi_rxm = psi_r(end-1);
% phi_lxm = phi_l(end-1);
% phi_rxm = phi_r(end-1);

delta = phi_rxm./psi_rxm - phi_lxm./psi_lxm;
delta = delta./(abs(phi_rxm./psi_rxm) + abs(phi_lxm./psi_lxm));

