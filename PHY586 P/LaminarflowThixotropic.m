function LaminarflowThixotropic(h,t,gamma,theta)
%LaminarflowThixotropic: plots u vs. y
%
%input argument:
% U                     Velocity of top plate
% h                     Distance between top plate and bottom plate
% t                     Time when u and y are evaluated
% theta                 angle of inclination
%

c=150; %an initial guess of c
delta=1e-8; %a small change in c
tol=1e-3; %tolerance of u(h)

for j=1:length(theta)
    L=[];
    for i=1:length(t)
        [y,u]=ode45(@der,[0,h],[0],[],t(i),gamma,h,theta(j));
        figure(j),plot(u,y)
        hold on
        L=[L,{['t=' num2str(t(i))]}];
    end
    figure(j),title(['\theta=' num2str(theta(j)) 'rad']),ylabel('height (y) m'),xlabel('velocity (u) m/s'),legend(L,'Location','northwest'),set(gca,'FontSize',18)
end

    function uPrime=der(y,u,t,gamma,h,theta)
        uPrime=gamma*(h-y)*sin(theta)*(u+1)*exp(t);
    end
    
end