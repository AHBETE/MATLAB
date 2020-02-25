clear all
clc

%read adj. close price
ds = tabularTextDatastore('c:\Users\wangz10\Documents\MATLAB\MA342 P3','FileExtensions','.csv');%path of csv file
T = readall(ds);

s=44;

for i=1:s 
    P(:,i)=T((i-1)*251+1:i*251,4);
end

P=table2array(P);

R=(P(2:end,:)-P(1:end-1,:))./P(1:end-1,:);
r=mean(R);
C=cov(R);

alpha=[0:0.01:1].^2;

for i=1:length(alpha)
    [w(:,i),optVal(i)]=quadprog((1-alpha(i))*2*C,-alpha(i)*r,[],[],ones(1,s),[1],zeros(s,1),0.2*ones(s,1));
end

for i=1:101
    wcw(i)=w(:,i)'*C*w(:,i);
end

plot(wcw,r*w)