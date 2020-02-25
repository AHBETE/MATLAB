%Section 1.8
%Problem 2

f=@(x) [6*x(1)-x(2)-x(3);x(1)-5*x(2)+x(3);2*x(1)+2*x(2)-7*x(3)];
J=@(x) [6,-1,-1;1,-5,1;2,2,-7];
x0=[0.5;0.5;0.5];
tol = 1e-16;
x = x0;

%a
while norm(f(x)) >= tol
    x = x + f(x);
end
fx = f(x);
fprintf('Fixpoint iteration:\n')
x
fx

%b
fprintf('\nNewtons method:\n')
[x,fx,~,~] = Newtsys(f,J,x0,tol,100,0)