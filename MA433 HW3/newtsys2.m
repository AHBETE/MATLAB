function out = newtsys2(fun,jac,x0,tol)
%NEWTSYS2
d = -feval(jac,x0)\feval(fun,x0);xnew=d+x0;
while norm(x0-xnew)>tol,
    x0=xnew;
    d=feval(jac,x0)\feval(fun,x0);
    xnew=d+x0;
end
out=xnew;