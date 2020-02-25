function [xbest,fxbest,nitr,status] = Secant(f,x0,x1,epsilon,maxitr,loud)
%SECANT: zero finding using secant method
%
%input argument:
% f                     The function whose root is being approximated
% x0                    One guess at a root of f
% x1                    A second guess at a root of f
% epsilon               A convergence criteria on |f(x_best)|
%   *The code terminate when |f(x_best)| < epsilon
% maxitr               The maximum number of iterations that should be
%                       calculated.
%loud                   If loud is nonzero, the code output every iteration
%
%output argument:
%xbest                  An approximation of a root of f.
%fxbest                 The value of f at x_best
%nitr                   The number of iterations used to computed xbest
%status                 0: success, xbest meets both the convergence
%                          criteria
%                       1: Failure, the iteration limit was reached
%                       2: Some failure other than the iteration limit
%                          occurred.
%
% MA332 Zibo Wang 2018


% Initialization
nitr = 0;
a = x0;
b = x1;


% Error
if epsilon<0, error('epsilon has to be non-negative')
end
if x0>=x1, error('x0 has to be less than x1')
end
if maxitr<=0, error('maxitr has at least be 1')
end


%
if isa(f,'char'),func = str2func(f);
elseif isa(f,'string'),func = str2func(f);
elseif isa(f,'function_handle'), func = f;
else error('function not find');
end

for i = 0:maxitr
    nitr = i;
    if func(b) == func(a)
        xbest = b;
        fbest = func(b);
        stats = 2;
    else
        x = a-func(a)*(a-b)/(func(a)-func(b));
        a = b;
        b = x;
    end
    if abs(func(b)) <= epsilon
        xbest = b;
        fxbest = func(b);
        status = 0;
        return
    end
    if loud ~= 0
        fprintf('Itr:%d x:%f |f(x)|:%f \n', nitr, b, abs(func(b)))
    end
end
 xbest = b;
 fxbest = func(b);
 status = 1;