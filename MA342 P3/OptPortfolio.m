function [ P,w,optVal,r,C,R ] = OptPortfolio( alpha )
%Creates the price matrix, matrix of daily returns, and the covariance of a
%stock in the portfolio.

%read adj. close price
ttds = tabularTextDatastore('C:\Users\wangz10\Documents\MATLAB\MA342 P3','FileExtensions','.csv');%path of csv file
T = readall(ttds);
CSVs = dir('*.csv');
numCSV = numel(CSVs);

for i=1:numCSV %number of stocks
    P(:,i)=T((i-1)*251+1:i*251,4);
end

P=table2array(P);
R=(P(2:end,:)-P(1:end-1,:))./P(1:end-1,:);
r=mean(R);
C=cov(R);

for i=1:length(alpha)

[w, optVal]=quadprog((1-alpha(i))*2*C, -alpha(i)*r, [], [], ones(1,numCSV), [1], zeros(numCSV,1), 0.2*ones(numCSV,1));

risk(i)=(w'*C)*w;
exp_return(i)=r*w;

end

plot(risk,exp_return)
xlabel('Risk')
ylabel('Expected Return')

