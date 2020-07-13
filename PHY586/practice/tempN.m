figure
t=(0:0.01:6);
yt=sin(t);
%yt = (square(2*pi.*t./T, 50)+1)./2;
[an, bn, fn] = fourier_a_b_coefs(yt, t);
[ifyt, t] = inv_fourier_yt(an, bn, fn);
subplot(2,1,1)
plot(t,yt)
hold on
plot(t,ifyt)
subplot(2,1,2)
plot(t,yt-ifyt)