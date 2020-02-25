% 5.9
% MA332 Zibo Wang 2018


%define the derivative
f=@(t,y)(-0.004)*(y-65-20*sin(pi*t/720));


%Assume start from temperature=212F
y0=212;


%Set time range and step size
deltat = 60;
trange = [0,10080];


%
[t,y] = RK4(f,y0,trange,deltat);
plot(t,y)
title('Newtons Law of Cooling Approximated Using RK4')
xlabel('t(min)')
ylabel('temperature(F)')