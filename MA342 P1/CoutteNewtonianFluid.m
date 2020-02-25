function [y,u] = CoutteNewtonianFluid(U,h,mu)
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
[y,u]=ode45(@der,[0,h],[0],[],U*mu/h,mu); %assuming c=U*mu/h
plot(u,y)
ylabel('height (y) m')
xlabel('velocity (u) m/s')

    function uPrime=der(y,u,c,mu)
        uPrime=c/mu;
    end

end