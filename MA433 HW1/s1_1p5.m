%Section 1.1
%Problem 5

%Define function
f= @(x) 1/x^3-10;

%Linear Interpolation
fprintf('Linear Interpolation\n')
Interpolation(f,0.25,2,0.001,100,1);
fprintf('\n')

%Bisection
fprintf('Bisection\n')
Bisection(f,0.25,2,0.0001,0.001,100,1);