%Section 1.8
%Problem 10

f=@(x) [x(1)^2-2*x(1)*x(2)*x(3);x(1)-x(2)^2-x(3);2*x(1)-2*x(2)-2*x(3)^3];
J=@(x) [2*x(1)-2*x(2)*x(3),-2*x(1)*x(3),-2*x(1)*x(2);1,-2*x(2),-1;2,-2,-6*x(3)^2];
x0=[1;1;1];
tol = 1e-16;
x = x0;
J0 = J(x0);
J0 = @(x)J0;

%a
fprintf('\nNewtons method:\n')
[x,fx,nitr,status] = Newtsys(f,J,x0,tol,100,0)


%b
fprintf('\nConstant Jacobian:\n')
[x,fx,nitr,status] = Newtsys(f,J0,x0,tol,100,0)