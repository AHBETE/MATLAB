%Section 1.2
%Problem 7

%Define function
f= @(x) 2*x^5-7*x^4-3*x^3+25*x^2-23*x+6;
df= @(x) 10*x^4-28*x^3-9*x^2;+50*x-23;

%Newton
fprintf('Newton:\n')

%first solution
fprintf('first solution\n')
[xbest,~,nitr,~]=Newton(f,df,-2.1,10e-6,1000,0);
fprintf('Itr:%d x:%f \n', nitr, xbest)

%second solution
fprintf('second solution\n')
[xbest,~,nitr,~]=Newton(f,df,0.4,10e-6,1000,0);
fprintf('Itr:%d x:%f \n', nitr, xbest)

%third solution
fprintf('third solution\n')
[xbest,~,nitr,~]=Newton(f,df,1.1,10e-6,1000,0);
fprintf('Itr:%d x:%f \n', nitr, xbest)

%forth solution
fprintf('forth solution\n')
[xbest,~,nitr,~]=Newton(f,df,3.0001,10e-6,1000,0);
fprintf('Itr:%d x:%f \n', nitr, xbest)

%Secant
fprintf('\n Secent:\n')

%first solution
fprintf('first solution\n')
[xbest,~,nitr,~]=Secant(f,-2.1,-1.9,10e-6,1000,0);
fprintf('Itr:%d x:%f \n', nitr, xbest)

%second solution
fprintf('second solution\n')
[xbest,~,nitr,~]=Secant(f,0.4,0.6,10e-6,1000,0);
fprintf('Itr:%d x:%f \n', nitr, xbest)

%third solution
fprintf('third solution\n')
[xbest,~,nitr,~]=Secant(f,0.9,1.1,10e-6,1000,0);
fprintf('Itr:%d x:%f \n', nitr, xbest)

%forth solution
fprintf('forth solution\n')
[xbest,~,nitr,~]=Secant(f,2.9,3.1,10e-6,1000,0);
fprintf('Itr:%d x:%f \n', nitr, xbest)