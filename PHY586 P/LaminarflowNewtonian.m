function LaminarflowNewtonian(h,mu,gamma,theta)
%LaminarflowNewtonian: plots u vs. y at given theta
%
%input argument:
% h                     Distance between top plate and bottom plate
% mu                    Sheer rate
% gamma                 Specific weight of fluid
% theta                 A list of angles

figure('DefaultAxesFontSize',18)
hold on
L=[];

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