function [x,fx] = Newtsys3(f,x0,tol)
%NEWTSYS3 TBD

%ini
%f=f(:);
n=size(x0,1);
x0=x0(:);
x=x0;
dx=Inf(n,1);

%
while norm(dx)>tol
    J=zeros(n,n);
    for i=1:n
        J(:,i)=(f(x)-f(x+10*10^-6*x))./(10^-6*x);
    end

    dx=-inv(J)*f(x);
    x=x+dx;
end

fx=f(x);