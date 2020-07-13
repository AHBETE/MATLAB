
dt=0.01;
T=1;
n=10;

t = (0:dt:(T*n-dt));
yt = (square(2*pi.*t./T, 50)+1)./2;

subplot(2,1,1);plot(t,yt)

[an, bn, fn] = fourier_a_b_coefs(yt, t);

[ifyt, t] = inv_fourier_yt(an, bn, fn);

hold on;plot(t,real(ifyt))

subplot(2,1,2);plot(t,(yt-real(ifyt)));