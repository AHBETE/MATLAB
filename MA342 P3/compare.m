clear all
clc

% 6 months simulation and compare with real

M(1) = 1000;
Me(1) = 1000; % initial money

%read adj. close price
ds = tabularTextDatastore('\','FileExtensions','.csv'); % path of csv file
T = readall(ds);
s=45; % num of stock
for i=1:s 
    P(:,i)=T((i-1)*251+1:i*251,4);
end
P=table2array(P);
Pe=P((1:125),:);


% Optimize portfolio for first month
R=(Pe(2:end,:)-Pe(1:end-1,:))./Pe(1:end-1,:);
r=mean(R);
C=cov(R);
alpha=0.7077;
[w(:,1),optVal(1)]=quadprog((1-alpha)*2*C,-alpha*r,[],[],ones(1,s),[1],zeros(s,1),0.2*ones(s,1));

S(:,1) = (M(1)*w(:,1))./(P(125,:)');
Se(:,1) = (Me(1)*w(:,1))./(Pe(125,:)'); % money spend on each stock


% simulation for following month
dt=1/125;

phi=randn(21,1);
for i=1:44
    sigma(i)=std(R(:,i));
end

for k=1:6
    for j=1:21
        Pe(125+j+21*(k-1),:)=Pe(125+j-1+21*(k-1),:)+r.*Pe(125+j-1+21*(k-1),:)*dt+sigma.*Pe(125+j-1+21*(k-1),:)*sqrt(dt)*phi(j);
    end
    R=(Pe(2+21*(k-1):end,:)-Pe(1+21*(k-1):end-1,:))./Pe(1+21*(k-1):end-1,:);
    r=mean(R);
    C=cov(R);
    [w(:,k+1),optVal(k+1)]=quadprog((1-alpha)*2*C,-alpha*r,[],[],ones(1,s),[1],zeros(s,1),0.2*ones(s,1));

    Me(k+1)=Se(:,k)'*Pe(end,:)';
    M(k+1)=Se(:,k)'*P(125+k*21,:)';
    S(:,k+1) = (M(k)*w(:,end))./(P(125+k*21,:)');
    Se(:,k+1) = (Me(k)*w(:,end))./(Pe(end,:)');    
end
