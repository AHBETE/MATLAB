function [yt, t] = inv_fourier_yt(an, bn, fn)

% function [yt] = inv_fourier(an, bn)
% Calculate inverse Fourier transform 
% INPUTS:
% an and bn (the Fourier components)
% fn, the corresponding (linear) frequency components
% OUTPUT:
% yt: the reconstructed time-signal
% t: the time signal

sqrt_2pi = sqrt((2.*pi));
twopi = 2.*pi;
N = length(an);
yt = zeros(size(an));
t = zeros(size(yt));
df = fn(2)-fn(1);
for n=0:N-1
	ytemp = 0;
	t(n+1) = (1/df).*n./(N);
	for k=0:N-1
		ytemp = ytemp+(an(k+1)+ 1i*bn(k+1)).*exp(1i*twopi.*k.*n./(N));%
	end
	yt(n+1) = ytemp.*sqrt_2pi./(N);%
end
