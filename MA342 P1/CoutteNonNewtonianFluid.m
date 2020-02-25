function CoutteNonNewtonianFluid(U,h,t)
%COUTTENONNEWTONIANFLUID: plots u vs. y
%
%input argument:
% U                     Velocity of top plate
% h                     Distance between top plate and bottom plate
% t                     Time when u and y are evaluated
%
% MA342 Zibo Wang 2019

close all
clc

%based on Example code 9.2
c=150; %an initial guess of c
delta=1e-8; %a small change in c
tol=1e-3; %tolerance of u(h)
L=[];

for i=1:length(t)
    err=inf;
    while err>tol
        [y1,u1]=ode45(@der,[0,h],[0],[],c,t(i));
        [y2,u2]=ode45(@der,[0,h],[0],[],c+delta,t(i));
        U1=u1(length(u1));
        U2=u2(length(u2));
        err=min(err,abs(U-U1));
        dudc=(U2-U1)/delta; %estimated derivative
        c=c-(U1-U)/dudc;
    end
    figure(1),plot(u1,y1)
    hold on
    L=[L,{['t=' num2str(t(i))]}];
    for k=1:length(u1)
        taududy(k)=1/((u1(k)+1)*exp(t(i)));
    end
    figure(2),plot(taududy,y1)
    hold on
end
figure(1),ylabel('height (y) m'),xlabel('velocity (u) m/s'),legend(L,'Location','southeast')
figure(2),ylabel('height (y) m'),xlabel('\tau/(du/dy)'),legend(L,'Location','northeast')
    function uPrime=der(y,u,c,t)
        uPrime=c*(u+1)*exp(t);
    end
figure(1),set(gca,'FontSize',18)
figure(2),,set(gca,'FontSize',18)
end