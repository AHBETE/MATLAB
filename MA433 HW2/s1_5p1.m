%Section 1.5
%Problem 1

% Initialization
f = @(x) 5*x^7+2*x-1;
x = 0.5;
temp = 0;
nitr = 0;

% h = 0.1
h = 0.1;
while (f(x) > 1e-6 & abs(temp-x) > 1e-6)
    a = (f(x+h)-f(x))/h;
    temp = x;
    x = x - f(x)/a;
    nitr = nitr + 1;
end
fprintf('h = 0.1\nItr:%d, x:%f\n\n',nitr, x)

% Initialization2
x = 0.5;
temp = 0;
nitr = 0;

% h = 0.01
h = 0.01;
while (f(x) > 1e-6 & abs(temp-x) > 1e-6)
    a = (f(x+h)-f(x))/h;
    temp = x;
    x = x - f(x)/a;
    nitr = nitr + 1;
end
fprintf('h = 0.01\nItr:%d, x:%f\n\n',nitr, x)