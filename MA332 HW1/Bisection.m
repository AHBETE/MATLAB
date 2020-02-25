function [xbest,fxbest,nitr,status] = Bisection(f,a,b,epsilon,delta,maxitr,loud)
%BISECTION: zero finding using bisection method
%
%input argument:
% f                     The function whose root is being approximated
% a                     An endpoint of the search interval
% b                     A second endpoint of the search interval
% epsilon               A convergence criteria on |f(x_best)|
% delta                 A convergence criteria on |x*-x_best|, where x*
%                       is an exact root of f. 
%   *The code terminate when both |f(x_best)| < epsilon and |x*-x_best| <
%   delta
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
% MA332 Zibo Wang 2018


% Initialization
nitr = 0;
x1 = a;
x2 = b;


% Error
if epsilon<0, error('epsilon has to be non-negative')
end
if delta<0, error('delta has to be non-negative')
end
if a>=b, error('a has to be less than b')
end
if maxitr<=0, error('maxitr has at least be 1')
end


%
if isa(f,'char'),func = str2func(f);
elseif isa(f,'string'),func = str2func(f);
elseif isa(f,'function_handle'), func = f;
else error('function not defined');
end

for i = 0:maxitr
    x3 = (x1+x2)/2;
    nitr = i;
    if sign(func(x3)) == sign(func(x1))
        x1 = x3;
    elseif sign(func(x3)) == sign(func(x2))
        x2 = x3;
    elseif sign(func(x3)) == 0
        xbest = x3;
        fxbest = func(x3);
        if fxbest <  delta
            status = 0;
        else status = 2;
        end
        return
    end
    if (x2-x1) <= epsilon
        if func(x3) <= delta
            xbest = x3;
            fxbest = func(x3);
            status = 0;
        end
        return
    end
    if loud ~= 0
        fprintf('Itr:%d a:%f b:%f |b-a|:%f |f(a)|:%f |f(b|:%f xstar:%f \n', nitr, x1, x2, abs(x2-x1), abs(func(x1)), abs(func(x2)), x3)
    end
end    
xbest = x3;
fxbest = func(x3);
status = 1;