%Section 1.1
%Problem 1

%Define function
f= @(x) cos(x)-x;

%Bisection
fprintf('Bisection\n')
Bisection(f,0.5,1,0.000001,0.0000001,4,1);
fprintf('\n')

%Linear Interpolation
fprintf('Linear Interpolation\n')
Interpolation(f,0.5,1,0.0000001,4,1);