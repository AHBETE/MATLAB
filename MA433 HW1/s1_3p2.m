%Section 1.3
%Problem 2

% Initialization
x = 0.5;
nitr = 0;
f = @(x) x - 2^(-x);
df = @(x) 1 + 2^(-x)*log(2);

% Fixed pt iteration
while abs(x-2^(-x)) >= 10e-6 
    x = 2^(-x);
    nitr = nitr + 1;
end

fprintf('Fixed point iteration:\n')
fprintf('Itr:%d, x:%f',nitr, x)

% Newton
[xbest,~,nitr,~]=Newton(f,df,0.5,10e-6,100,0);

fprintf('\nNewttons method:\n')
fprintf('Itr:%d, x:%f\n',nitr, xbest)