%Section 1.4
%Problem 15

% Initialization
f = @(x) 5*x^7+2*x-1;
fp = @(x) 35*x^6+2;
fpp = @(x) 210*x^5;
g = @(x) 1/x^3-10;
gp = @(x) -3/x^4;
gpp = @(x) 12/x^5;

% Halley
[xbest,~,nitr,~] = Halley(f,fp,fpp,0.5,1e-6,100,0);
fprintf('Householders method for f:\n')
fprintf('Itr:%d, x:%f\n\n',nitr, xbest)

[xbest,~,nitr,~] = Halley(g,gp,gpp,0.4,1e-6,100,0);
fprintf('Householders method for g:\n')
fprintf('Itr:%d, x:%f\n',nitr, xbest)