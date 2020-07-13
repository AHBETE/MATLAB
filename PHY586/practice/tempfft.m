
clear;clc;

dt=0.01;
T=1;
n=10;

t = (0:dt:(T*n-dt));
yt = (square(2*pi.*t./T, 50)+1)./2;
%yt=sin(t);

subplot(2,1,1);plot(t,yt)

[an, bn, fn] = DFT_(yt, t);

[ifyt] = iDFT_(an, bn);

hold on;plot(t,real(ifyt))

subplot(2,1,2);plot(t,(yt-real(ifyt)));