clc
clear all
f= @(x) sqrt(x)*cot(sqrt(10-x))-sqrt(10-x);
[bisec1,~,~,~] = Bisection(f,0,0.01,10^-10,10^-10,10^5,1);
[newton1,~,~,~] = Secant(f,0,0.01,10^-10,10^5,1);
[bisec2,~,~,~] = Bisection(f,8,9,10^-10,10^-10,10^5,1);
[newton2,~,~,~] = Secant(f,8,9,10^-10,10^5,1);