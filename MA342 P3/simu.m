clear all
clc

%4 months simulation

M(1) = 1000; %money

%read adj. close price
ds = tabularTextDatastore('c:\Users\wangz10\Documents\MATLAB\MA342 P3','FileExtensions','.csv');%path of csv file
T = readall(ds);
s=44; %num of stock
for i=1:s 
    P(:,i)=T((i-1)*251+1:i*251,4);
end
P=table2array(P);

%
R=(P(2:end,:)-P(1:end-1,:))./P(1:end-1,:);
r=mean(R);
C=cov(R);
alpha=0.7077;
[w(:,1),optVal(1)]=quadprog((1-alpha)*2*C,-alpha*r,[],[],ones(1,s),[1],zeros(s,1),0.2*ones(s,1));

S(:,1) = (M(1)*w(:,1))./(P(251,:)');%money spend on each stock

%simu
dt=1/251;

phi=randn(30,1);
for i=1:44
    sigma(i)=std(R(:,i));
end

for k=1:10
    for j=1:30
        P(251+j+30*(k-1),:)=P(251+j-1+30*(k-1),:)+r.*P(251+j-1+30*(k-1),:)*dt+sigma.*P(251+j-1+30*(k-1),:)*sqrt(dt)*phi(j);
    end
    R=(P(2+30*(k-1):end,:)-P(1+30*(k-1):end-1,:))./P(1+30*(k-1):end-1,:);
    r=mean(R);
    C=cov(R);
    [w(:,k+1),optVal(k+1)]=quadprog((1-alpha)*2*C,-alpha*r,[],[],ones(1,s),[1],zeros(s,1),0.2*ones(s,1));

    M(k+1)=S(:,k)'*P(end,:)';
    S(:,k+1) = (M(k)*w(:,end))./(P(end,:)');
    
end