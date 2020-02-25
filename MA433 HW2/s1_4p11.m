%Section 1.4
%Problem 11

% Initialization
f1 = @(x) x^3 - 5.06*x^2 - 10.392*x + 46.2;
fp1 = @(x) 3*x^2 - 10.12*x - 10.392;

f2 = @(x) x^3 - 1100*x^2 + 100220*x - 20000;
fp2 = @(x) 3*x^2 -2200*x +100220;

% a 
fprintf('a\n')
[xbest,~,nitr,~] = NewtonAE(f1,fp1,2,1e-6,100,0);
fprintf('Itr:%d, x:%f\n',nitr, xbest)
[xbest,~,nitr,~] = NewtonAE(f1,fp1,5,1e-6,100,0);
fprintf('Itr:%d, x:%f\n',nitr, xbest)
[xbest,~,nitr,~] = NewtonAE(f1,fp1,-3,1e-6,100,0);
fprintf('Itr:%d, x:%f\n\n',nitr, xbest)

% b
fprintf('b\n')
[xbest,~,nitr,~] = NewtonRE(f1,fp1,2,1e-6,100,0);
fprintf('Itr:%d, x:%f\n',nitr, xbest)
[xbest,~,nitr,~] = NewtonRE(f1,fp1,5,1e-6,100,0);
fprintf('Itr:%d, x:%f\n',nitr, xbest)
[xbest,~,nitr,~] = NewtonRE(f1,fp1,-3,1e-6,100,0);
fprintf('Itr:%d, x:%f\n\n',nitr, xbest)

% c
fprintf('c\n')
[xbest,~,nitr,~] = NewtonAE(f2,fp2,0,1e-6,100,0);
fprintf('Itr:%d, x:%f\n',nitr, xbest)
[xbest,~,nitr,~] = NewtonAE(f2,fp2,100,1e-6,100,0);
fprintf('Itr:%d, x:%f\n',nitr, xbest)
[xbest,~,nitr,~] = NewtonAE(f2,fp2,1000,1e-6,100,0);
fprintf('Itr:%d, x:%f\n\n',nitr, xbest)

% d
fprintf('c\n')
[xbest,~,nitr,~] = NewtonRE(f2,fp2,0,1e-6,100,0);
fprintf('Itr:%d, x:%f\n',nitr, xbest)
[xbest,~,nitr,~] = NewtonRE(f2,fp2,100,1e-6,100,0);
fprintf('Itr:%d, x:%f\n',nitr, xbest)
[xbest,~,nitr,~] = NewtonRE(f2,fp2,1000,1e-6,100,0);
fprintf('Itr:%d, x:%f\n',nitr, xbest)