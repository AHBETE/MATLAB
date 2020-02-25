    function [xbest,fxbest,nitr,status] = Halley(f,fp,fpp,x0,epsilon,maxitr,loud)
%Halley: zero finding using Halley's method
%
%input argument:
% f                     The function whose root is being approximated
% fp                    The derivative of f
% fpp                   The second derivative of f
% x0                    The initial gusee at a root of f
% epsilon               A convergence criteria on |f(x_best)|
% maxitr                The maximum number of iterations that should be
%                       calculated.
% loud                  If loud is nonzero, the code output every iteration
%
%output argument:
% xbest                 An approximation of a root of f.
% fxbest                The value of f at x_best
% nitr                  The number of iterations used to computed xbest
% status                0: success, xbest meets both the convergence
%                          criteria
%                       1: Failure, the iteration limit was reached
%                       2: Some failure other than the iteration limit
%                          occurred.
%
% MA433 Zibo Wang 2018


% Initialization
nitr = 0;
x = x0;


% Error
if epsilon<0, error('epsilon has to be non-negative')
end
if maxitr<=0, error('maxitr has at least be 1')
end


%
if isa(f,'char'),func = str2func(f);
elseif isa(f,'string'),func = str2func(f);
elseif isa(f,'function_handle'), func = f;
else error('function not defined');
end
if isa(fp,'char'),dfunc = str2func(fp);
elseif isa(fp,'string'),dfunc = str2func(fp);
elseif isa(fp,'function_handle'), dfunc = fp;
else error('derivative not defined');
end
if isa(fpp,'char'),d2func = str2func(fpp);
elseif isa(fpp,'string'),d2func = str2func(fpp);
elseif isa(fpp,'function_handle'), d2func = fpp;
else error('derivative not defined');
end

for i = 0:maxitr
    nitr = i;
    if dfunc(x) == 0
        status = 2;
        xbest = x;
        fxbest = func(x);
        return
    else
        x = x-2*(func(x)*dfunc(x))/(2*(dfunc(x)^2-func(x)*d2func(x)));
    end
    if abs(func(x)) <= epsilon
        status = 0;
        xbest = x;
        fxbest = func(x);
        return
    end
    if loud ~= 0
        fprintf('Itr:%d x:%f |f(x)|:%f \n', nitr, x, abs(func(x)))
    end
end
xbest = x;
fxbest = func(x);
status = 1;