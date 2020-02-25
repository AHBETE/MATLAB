% Initialization
% average daily temperature at Terre Haute from 1998 to 2005 from 
% https://www.ncdc.noaa.gov
T = xlsread('1503203.csv');
d = (1:2646)';
A = ones(2646,4);


% Find the 'Vandermonde matrix'
for i=1:2646
    A(i,2) = d(i);
    A(i,3) = cos(2*pi*d(i)/365.25);
    A(i,4) = sin(2*pi*d(i)/365.25);
end


% solve for alpha using LinearSover from HW2
[alpha, status]=LinearSolver(A'*A,A'*T);


% 
alpha_0 = alpha(1);
alpha_1 = alpha(2);
alpha_2 = sqrt(alpha(3)^2+alpha(4)^2);
temp = alpha(4)/alpha(3);
phi = atan(temp);


% plot
hold on
plot(d,T,'y');
d=0:10:2646;
plot(d,alpha_0+alpha_1*d+alpha_2*cos(2*pi*d/365.25+phi),'r');
title('Terre Haute temperature');
xlabel('days');
ylabel('temperature');
legend({'measured data','least squares fit'},'Location','southwest');