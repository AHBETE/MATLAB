clear;clc;

g=9.81; %gravity a
L=1; %assume length of pendulum is 1m
m=1;%suppose m=1kg
tvec = (0:0.01:10);

figure();hold on;
for  i=1:10
    theta = 10*i;

    [thetat,omegat] = nonlinearpendulum(theta,tvec);
    E(i,:)=m.*((L.*omegat).^2)/2+m.*g.*L.*(1-cos(thetat));
    plot(tvec,E(i,:))
end
hold off
title('Energy vs time');xlabel('time (sec)');ylabel('Energy (J)');
legend('\theta=10','\theta=20','\theta=30','\theta=40','\theta=50',...
    '\theta=60','\theta=70','\theta=80','\theta=90','\theta=100');