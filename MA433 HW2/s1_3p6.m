%Section 1.3
%Problem 6

%a
% Initialization
x = 0.8;
nitr = 0;
g = @(x) cos(x);
f = @(x) cos(x)-x;
df = @(x)-sin(x)-1;

% Fixed pt iteration
while abs(g(x)-x) >= 1e-6 
    x = g(x);
    nitr = nitr + 1;
end

fprintf('Fixed point iteration:\n')
fprintf('Itr:%d, x:%f',nitr, x)

%b
% Newton
[xbest,~,nitr,~]=Newton(f,df,0.8,1e-6,100,0);

fprintf('\nNewttons method:\n')
fprintf('Itr:%d, x:%f\n',nitr, xbest)
