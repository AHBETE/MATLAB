function Laminarflow1(h,mu,gamma,theta)
%LAMINARFLOW1: plots u vs. y at given theta
%
%input argument:
% h                     Distance between top plate and bottom plate
% mu                    Sheer rate
% gamma                 Specific weight of fluid
% theta                 A list of angles
%
% MA342 Zibo Wang 2019

close all
clc
figure('DefaultAxesFontSize',18)
hold on
L=[];

%based on Example code 9.1
for i=1:length(theta)
    [y,u]=ode45(@der,[0,h],[0],[],mu,h,gamma,theta(i));
    plot(u,y)
    ylabel('height (y) m')
    xlabel('velocity (u) m/s')
    L=[L,{['\theta=' num2str(theta(i))]}];
end
legend(L,'Location','southeast')
    function uPrime=der(y,u,mu,h,gamma,theta)
        uPrime=gamma*(h-y)*sin(theta)/mu;
    end

end