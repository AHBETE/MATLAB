function epsilon = epsfinder(num)
%EPSFINDER find approximate eps value of a given number
%
%input argument:
% num                     A real number, and its relative eps is to be
%                         evaluated.
%
%output argument:
% epsilon                 Relative eps value of num.

% PHY586 Zibo Wang 2019

% Initialization
epsilon=num/2;%set an initial value of eps

% Calculate eps

while num+epsilon/2~=num
    epsilon=epsilon/2;
end

for i=1:15
    while num+epsilon*(1-10^(-i))~=num
        epsilon=epsilon*(1-10^(-i));
    end
end
epsilon=epsilon*2;