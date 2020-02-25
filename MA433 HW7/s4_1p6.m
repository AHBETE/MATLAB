%%Section 4.1
%Problem 6
clear all
close all
clc

f = @(x) 1/(1+25*x^2);
v=linspace(-1,1,1000);
for i=1:1000
    y1(i)=f(v(i));
end
y1=y1';

%a
x = linspace(-1,1,10);
for i=1:10
    y(i)=f(x(i));
end
[y2] = LagrangePoly(x,y,v);
fprintf("n=10\nlargest difference:")
disp(max(abs(y1-y2)))

%b
x = linspace(-1,1,15);
for i=1:15
    y(i)=f(x(i));
end
[y2] = LagrangePoly(x,y,v);
fprintf("n=15\nlargest difference:")
disp(max(abs(y1-y2)))

%c
x = linspace(-1,1,20);
for i=1:20
    y(i)=f(x(i));
end
[y2] = LagrangePoly(x,y,v);
fprintf("n=20\nlargest difference:")
disp(max(abs(y1-y2)))

%d
x = linspace(-1,1,50);
for i=1:50
    y(i)=f(x(i));
end
[y2] = LagrangePoly(x,y,v);
fprintf("n=50\nlargest difference:")
disp(max(abs(y1-y2)))

%e
x = linspace(-1,1,10);
for i=1:10
    y(i)=f(x(i));
end
[y2] = LagrangePoly(x,y,v);
hold on
plot(v,y1)
plot(v,y2)
plot(v,abs(y1-y2))
legend('Runge function','Lagrange Polynomial degree=10','Error')