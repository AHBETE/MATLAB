function [ sigma, Psim ] = PriceTraj( P,r,C,R )
% Plots the simulated price trajectories for the stock portfolio.

[day,stock]=size(P);
dt=1/day;
Psim(1,:)=P(day,:);
phi=randn(day,1);


for i=1:stock
    sigma(i)=std(R(:,i));
end

for j=2:day
    Psim(j,:)=Psim(j-1,:)+r.*Psim(j-1,:)*dt+sigma.*Psim(j-1,:)*sqrt(dt)*phi(j-1);
end

plot([1:day],Psim)
xlabel('Time (days)')
ylabel('Simulated Profits')
xlim([0 251])
end