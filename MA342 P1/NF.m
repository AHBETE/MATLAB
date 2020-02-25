function [y,u]=NF(U,h,mu)

close all
clc

[y,u]=ode45(@der,[0,h],[0],[],U*mu/h,mu);
plot(y,u)


    function uPrime=der(y,u,c,mu)
    uPrime=c/mu;
    end

end