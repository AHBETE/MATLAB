function [x,fx,nitr,status] = Newtsys(f,J,x0,tol,maxitr,loud)
%NEWYSYS Newton's method for systems
%input argument:
% f                     functions in vector form
% J                     Jacobian matrix
% x0                    initial condition in vector form
% tol                   tolerance
% maxitr                max number of iteration
% loud                  If loud is nonzero, the code output every iteration
%
%output argument:
% x                     an approximated solution to the system of equations
% fx                    function evaluated at approximated solusion
% status                0: Success
%                       1: Max number of iteration reached
%                       2: Failure for reason such as Jacobian is not
%                          invertable
%   
% MA433 Zibo Wang 2018


% Initialization
d = -inv(J(x0))*f(x0);
temp = x0;
x = d + x0;
nitr = 0;

%
while (norm(x-temp) > tol & nitr < maxitr & norm(f(x)) > tol)
    if abs(det(J(x))) < tol
        status = 2;
        return
    end
    d = -inv(J(x))*f(x);
    temp = x;
    x = d + x;
    nitr = nitr + 1;
    fx = f(x);
    if loud ~= 0
        fprintf('Itr:%d\n',nitr)
        x
        fx
        fprintf('\n')
    end
    if nitr == maxitr
        status = 1;
        return
    end
end
status = 0;