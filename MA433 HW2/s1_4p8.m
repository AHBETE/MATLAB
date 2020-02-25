%Section 1.4
%Problem 8

% Initialization
f = @(x) 5*x^7+2*x-1;
fp = @(x) 35*x^6+2;
fpp = @(x) 210*x^5;
g = @(x) 1/x^3-10;
gp = @(x) -3/x^4;
gpp = @(x) 12/x^5;

% Newton
tic
[xbest,~,nitr,~]=Newton(f,fp,0.5,1e-6,100,0);
toc
fprintf('Newttons method for f:\n')
fprintf('Itr:%d, x:%f\n\n',nitr, xbest)

tic
[xbest,~,nitr,~]=Newton(g,gp,0.4,1e-6,100,0);
toc
fprintf('Newttons method for g:\n')
fprintf('Itr:%d, x:%f\n\n',nitr, xbest)

% Householder
tic
[xbest,~,nitr,~] = Householder(f,fp,fpp,0.5,1e-6,100,0);
toc
fprintf('Householders method for f:\n')
fprintf('Itr:%d, x:%f\n\n',nitr, xbest)

tic
[xbest,~,nitr,~] = Householder(g,gp,gpp,0.4,1e-6,100,0);
toc
fprintf('Householders method for g:\n')
fprintf('Itr:%d, x:%f\n',nitr, xbest)