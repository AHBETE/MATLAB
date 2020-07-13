function [y,u,c] = CoutteNewtonianFluid(U,h,mu)
%CoutteNewtonianFluid: returns horizontal velocity u and height y as
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

figure('DefaultAxesFontSize',18)

c=150; %an initial guess
delta=1e-8; %a small change in c
tol=1e-6; %tolerance of u(h)
err=inf;
while err>tol
    [y1,u1]=ode45(@der,[0,h],[0],[],c,mu);
    [y2,u2]=ode45(@der,[0,h],[0],[],c+delta,mu);
    U1=u1(length(u1));
    U2=u2(length(u2));
    err=min(err,abs(U-U1));
    dudc=(U2-U1)/delta; %estimated derivative
    c=c-(U1-U)/dudc;
end
plot(u1,y1)
ylabel('height (y) m')
xlabel('velocity (u) m/s')

    function uPrime=der(y,u,c,mu)
        uPrime=c/mu;
    end

y=y1;u=u1;
end
