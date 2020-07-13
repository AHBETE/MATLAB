clear;clc;

g=9.81; %gravity a
L=1; %assume length of pendulum is 1m
m=1;%suppose m=1kg
tvec = (0:0.01:10);

for  i=1:5
    figure();
    theta = 10*i;

    [thetat(i,:),~] = nonlinearpendulum(theta,tvec);
    
    [an, bn, fn] = fourier_a_b_coefs(thetat(i,:), tvec);
    
    subplot(1,2,1);hold on;
    plot(fn(1:20),an(1:20));
    plot(fn(1:20),bn(1:20));
    xlabel('Freq. (Hz)');ylabel('Amplitude');legend('cos','sin');
    grid on;hold off;
    
    [ma,Ia]=max(an);
    [mb,Ib]=max(bn);
    
    subplot(1,2,2);hold on;
    plot(tvec,thetat(i,:));
    plot(tvec,(sqrt(2.*pi)./length(an)).*(ma.*cos(2.*pi.*fn(Ia).*tvec)+mb.*cos(2.*pi.*fn(Ib).*tvec)));
    xlabel('Time (sec)');ylabel('Angular displacement (rad)');
    legend('RK4 result','Estimation using DFT');
    str=strcat(num2str(i*10),char(176));title(str);
    hold off;
    
end