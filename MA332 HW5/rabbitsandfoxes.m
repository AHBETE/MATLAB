% 5.8
% MA332 Zibo Wang 2018


%define the derivative
syms k_1 k_2 k_3 k_4 k_5
f=@(t,y)[(k_1-k_2)*y(1)-k_3*y(1)*y(2); k_4*y(1)*y(2)-k_5*y(2)];


%set initial guess
syms a b
y0=[a,b]';


%set range and stepsize
deltat = 0.1;
trange = [0,10];

%
[t,y] = RK4(f,y0,trange,deltat)