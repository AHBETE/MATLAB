%test refer to Newtsy3
f=@(x) [3*x(1)-cos(x(1)*x(2))-1/2;x(1)^2-81*(x(2)+1/10)^2+sin(x(3))+1.06;exp(-x(1)*x(2))+20*x(3)-10*pi/3+3];
x0=[0.1,0.1,-0.1]';
tol=10^-7;

n=size(x0,1);
x0=x0(:);
x=x0;
dx=Inf(n,1);

%
while norm(dx)>tol
    J=zeros(n,n);
    for i=1:n
        J(i,:)=(f(x)-f(x+10^-5*x))./(10^-5*x);
    end

    dx=-inv(J)*f(x);
    x=x+dx;
end

fx=f(x);