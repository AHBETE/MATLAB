function [yt] = iDFT_(a,b)
% IDFT_ calculate inverse Fourier transform 
%
% Input arguments:
% an/bn.........the Fourier components
% Output arguments:
% yt............the reconstructed time-signal

% Based on the code inv_fourier_yt.m by Dr. Vishwanath
% Using vector instead of one for-loop for efficiency.

N=length(a);
yt=zeros(1,N);
n=(0:(N-1));
Z=exp((-1i*2*pi)/(N));
for k=1:N
    yt(k)=sum((a+1i*b).*(Z.^((k-1).*n)));
end

yt=yt*sqrt(2*pi)/(N);