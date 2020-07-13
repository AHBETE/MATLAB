function [thetat,omegat] = nonlinearpendulum(theta,tvec)
% NONLINEARPENDULUM solves the angular displacement and velocity.
% 
% Input arguments:
% theta.........................initial angular displacement
% tvec..........................a time vector, when theta and omega to be
%                               evaled
%
% Output arguments:
% thetat........................angular displacement evaled at tvec
% omegat........................angular velocity evaled at tvec

% Zibo Wang 2019

%init
thetat = zeros(length(tvec), 1);
omegat = thetat;

thetat(1) = (theta)*pi/180;
deltat = tvec(2)-tvec(1);

g=9.81; %gravity a
L=1; %assume length of pendulum is 1m

%RK4...
for i=2:length(tvec)  

    theta1=thetat(i-1);
    omega1=omegat(i-1);
    alpha1=-g*sin(theta1)/L;
    
    theta2=theta1+deltat*omega1/2;
    omega2=omega1+deltat*alpha1/2;
    alpha2=-g*sin(theta2)/L;
    
    theta3=theta1+deltat*omega2/2;
    omega3=omega1+deltat*alpha2/2;
    alpha3=-g*sin(theta3)/L;
    
    theta4=theta1+deltat*omega3;
    omega4=omega1+deltat*alpha3/L;
    alpha4=-g*sin(theta4)/L;
    
    thetat(i)=theta1+(deltat/6)*(omega1+2*omega2+2*omega3+omega4);
    omegat(i)=omega1+(deltat/6)*(alpha1+2*alpha2+2*alpha3+alpha4);
    
end