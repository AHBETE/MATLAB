%Section 1.3
%Problem 3

maxitr = 100;
x = 1.7;
nitr = 0;

while (abs(x^2 + 3) >= 10e-6 & nitr < maxitr)
    x = x^2 + x - 3;
    nitr = nitr + 1;
end

fprintf('Fixed point iteration 1:\n')
fprintf('Itr:%d, x:%f',nitr, x)

x = 1.7;
nitr = 0;

while (abs(x - (x + 3/x)/2) >= 10e-6 & nitr < maxitr)
    x = (x + 3/x)/2;
    nitr = nitr + 1;
end

fprintf('\nFixed point iteration 2:\n')
fprintf('Itr:%d, x:%f\n',nitr, x)