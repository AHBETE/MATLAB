%Section 1.1
%Problem 8

%Define function
f= @(x) cos(sin(x))-0.75;

%Linear Interpolation
fprintf('Linear Interpolation\n')
Interpolation(f,0,2,0.0000001,100,1);
fprintf('\n')

%Bisection
fprintf('Bisection\n')
Bisection(f,0,2,0.0001,0.001,100,1);