%Section 1.8
%Problem 11

f=@(x) [x(1)^2-2*x(1)*x(2)*x(3);x(1)-x(2)^2-x(3);2*x(1)-2*x(2)-2*x(3)^3];
J=@(x) [2*x(1)-2*x(2)*x(3),-2*x(1)*x(3),-2*x(1)*x(2);1,-2*x(2),-1;2,-2,-6*x(3)^2];
x0=[1;1;1];
tol = 1e-16;
x = x0;
J0 = J(x0);
J0 = @(x)J0;

%a
fprintf('\nNewtons method:\n')
for i=1:10
    fprintf('\nitr %d\n',i)
    [x,~,~,~] = Newtsys(f,J,x0,tol,i,0)
    error=norm(x-[2,1,1]')
end

%b
fprintf('\nConstant Jacobian:\n')
for i=1:10
    fprintf('\nitr %d\n',i)
    [x,~,~,~] = Newtsys(f,J0,x0,tol,i,0)
    error=norm(x-[2,1,1]')
end