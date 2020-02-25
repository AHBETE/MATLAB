%%probelm 3
%Section 4.1 Probelm 2

close all
clear all
clc

%%a
x=linspace(1,9,1000);
%Lagrange
px=[1 3 5 7 9];
for i=1:5
    py(i)=exp(px(i)/2);
end
pl=LagrangePoly(px,py,x);

%Taylor
f1=@(x) exp(2.5)+exp(2.5)/2*(x-5)/2+exp(2.5)/4*(x-5)^2/6+exp(2.5)/8*(x-5)^3/24+exp(2.5)/16*(x-5)^5/120;
for i=1:1000
    pt(i)=f1(x(i));
end

figure
subplot(2,2,1)
hold on
plot(x,pl)
plot(x,pt)
plot(x,exp(x/2))
legend('Lagrange','Taylor','exp(x/2)')
title('(a)')
hold off

%%b
x=linspace(1,12,1000);
%Lagrange estimated error
f2=@(x) 1/32*exp(4.5)/factorial(5)*(x-1)*(x-3)*(x-5)*(x-7)*(x-9);
for i=1:1000
    eel(i)=abs(f2(x(i)));
end

%Taylor estimated error
f3=@(x) 1/32*exp(4.5)/factorial(5)*(x-5)^5;
for i=1:1000
    eet(i)=abs(f3(x(i)));
end

subplot(2,2,2)
hold on
plot(x,eel)
plot(x,eet)
legend('Lagrange estimated error','Taylor estimated error')
title('(b)')
hold off

%%c
%Lagrange actual error
pl=LagrangePoly(px,py,x);
pl=pl';
ael=abs(pl-exp(x/2));

%Taylor actual error
for i=1:1000
    pt(i)=f1(x(i));
end
aet=abs(pt-exp(x/2));

subplot(2,2,3)
hold on
plot(x,ael)
plot(x,aet)
legend('Lagrange actual error','Taylor actual error')
title('(c)')
hold off

%%de
x=[1.5 0.5 8.5 4.7 0.1 5.3];
for i=1:6
    a(i)=exp(x(i)/2);
end
le=abs((LagrangePoly(px,py,x))'-a);
for i=1:6
    t(i)=f1(x(i));
end
te=abs(t-a);
x=x';le=le';te=te';
disp(table(x,le,te))