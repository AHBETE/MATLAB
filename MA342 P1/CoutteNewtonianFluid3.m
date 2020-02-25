function [y,u,c] = CoutteNewtonianFluid3(U,h,mu)
%COUTTENEWTONIANFLUID: returns horizontal velocity u and height y as
%vectors, and plots u vs. y
%
%input argument:
% U                     Velocity of top plate
% h                     Distance between top plate and bottom plate
% mu                    Sheer rate
%
%output argument:
% u                     Horizontal velocity at different height
% y                     Height
%
% MA342 Zibo Wang 2019

close all
clc
figure('DefaultAxesFontSize',18)

%based on Example code 9.1
c1=1e-5;c2=10; %two initial guesses
tol=1e-6; %tolerance of c
err=inf;
while err>tol
    [y1,u1]=ode45(@der,[0,h],[0],[],c1,mu);
    [y2,u2]=ode45(@der,[0,h],[0],[],c2,mu);
    [y3,u3]=ode45(@der,[0,h],[0],[],(c1+c2)/2,mu);
    e1=u1(length(u1))-U;
    e2=u2(length(u2))-U;
    e3=u3(length(u3))-U;
    if sign(e3)==sign(e1)
        c1=(c1+c2)/2;
    elseif sign(e3)==sign(e2)
        c2=(c1+c2)/2;
    end
    err=abs(c1-c2);
end
plot(u3,y3)
ylabel('height (y) m')
xlabel('velocity (u) m/s')

    function uPrime=der(y,u,c,mu)
        uPrime=c/mu;
    end

y=y3;u=u3;c=c1;
end
