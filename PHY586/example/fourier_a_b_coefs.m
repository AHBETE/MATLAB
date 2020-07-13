function [an, bn, fn] = fourier_a_b_coefs(yt, t)

% function [an, bn] = fourier_a_b_coefs(yt, t)
% Find the Fourier series coefficients an and bn given a signal yt
% INPUTS:
% yt: the discrete time-signal
% t: the times where yt is sampled (this is assumed uniform)
% OUTPUTS:
% an - the cos terms
% bn - the sin terms
% fn - the frequency vector

one_sqrt_2pi = sqrt(1./(2.*pi));
twopi = 2.*pi;
N = length(yt);
an = zeros(size(yt));
bn = zeros(size(yt));
fn = zeros(size(yt));
dt = t(2)-t(1);
for n=0:N-1
	Yn = 0;
	fn(n+1) = (1./dt).*n./(N);
	for k=0:N-1
		Yn = Yn+yt(k+1).*exp(-1i*twopi.*k.*n./(N));%
	end
	an(n+1) = real(Yn).*one_sqrt_2pi;
	bn(n+1) = imag(Yn).*one_sqrt_2pi;
end