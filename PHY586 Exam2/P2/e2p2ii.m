dt=0.01;
T=1;

for i=1:4
    n=10*i;

    t = (0:dt:(T*n-dt));
    yt = (square(2*pi.*t./T, 50)+1)./2;

    [an, bn, fn] = fourier_a_b_coefs(yt, t);

    figure()
    str=strcat('n = ', num2str(n));
    subplot(2,1,1);
    plot(fn,an);title(['cosine coef.',str]);
    xlabel('Freq. (Hz)');ylabel('Amplitude');
    subplot(2,1,2);
    plot(fn,bn);title(['sine coef.',str]);
    xlabel('Freq. (Hz)');ylabel('Amplitude');
end