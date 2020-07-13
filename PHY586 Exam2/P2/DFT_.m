function [a,b,f] = DFT_(yt,t)
% DFT_ find the Fourier series coefficients an and bn given a signal yt
%
% Input arguments:
% yt........the discrete time-signal
% t.........the times where yt is sampled (this is assumed uniform)
% Output arguments:
% a.........the cos terms
% b.........the sin terms
% f.........the frequency vector

% Based on the code fourier_a_b_coefs.m by Dr. Vishwanath
% Using vector instead of one for-loop for efficiency.

N=length(t);
Y=zeros(1,N);
n=(0:(N-1));
Z=exp((1i*2*pi)/(N));
for k=1:N
    Y(k)=sum(yt.*(Z.^((k-1).*n)));
end

a=(1/sqrt(2*pi))*real(Y);
b=(1/sqrt(2*pi))*imag(Y);

dt=t(2)-t(1);
f = (1./dt).*n./(N);