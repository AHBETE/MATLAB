function [xbest,fbest,itrcnt,stat] = NewtonOpt(f,Df,Df2,x0,gradTol,xTol,itrBound,s)
%NEWTONOPT minimizes a function with the gradient descent method
%%input arguments:
% f                     A filename or function handle that evaluates the
%                       function to be minimized.
% Df                    A filename or function handle that evaluates the
%                       gradient of f.
% Df2                   A filenmae or function handle that evaluates the
%                       Hessian of f.
% x0                    An initial iterate.
% gradTol               A termination criteria on gradient ||Df(x)||.
% xTol                  A termination criteria on x value.
% itrBound              A maximum number of iterations to be perform.
% s                     A line search parameter:
%                       s = 1: Use alpha = 1 for all iterations.
%                       s = 2: Decide alpha with Lagrange polynomial with
%                       alpha1 = 0, alpha2 = 1, and alpha3 = 2.
%                       s = 3: Decide alpha with bisection over the
%                       interval 0 <= alpha <= 1; if Df(x) and Df(x+d) have
%                       the same sign, then set alpha = 1.
%                       s = 4: Decide alpha by solving g'(s) = 0, where
%                       g(s) is the second Taylor polynomial for f(x+sd).
%
%output arguments:
% xbest                 The best calculated solusion.
% fbest                The function value at xbest.
% itrcnt                The number of iterations performed, with x0
%                       counting as iteration 0.
% stat                  A status variable:
%                       s = 0: succeeded with ||Df(x)|| < gradtol.
%                       s = 1: failed, and xbest is the best solution
%                       encountered.

% MA332 Zibo Wang 2018


% Initialization
if gradTol<0
    gradTol = abs(gradTol)
end

if xTol<0
    xTol = abs(xTol)
end

if itrBound <= 0
    itrBound = abs(itrBound)
end

if isa(f,'char'),f = str2func(f);
elseif isa(f,'string'),f = str2func(f);
elseif isa(f,'function_handle'), f = f;
end

if isa(Df,'char'),Df = str2func(Df);
elseif isa(Df,'string'),Df = str2func(Df);
elseif isa(Df,'function_handle'), Df = Df;
end

x = x0;
itrcnt = 0;

% s = 1
if s == 1
    for i = 0:itrBound
        % using LinearSolver from HW2 to determine the direction, same for
        % s=2, s=3, and s=4 cases.
        d = LinearSolver(Df2(x(1),x(2)),-Df(x(1),x(2)));
        if norm(d) > gradTol
            if norm(a*d) > xTol
                x = x + d;
                intrcnt = intrcnt + 1;
            else
                xbest = x;
                fbest = f(x(1),x(2));
                stat = 0;
            end
        end
    end
    xbest = x;
    fbest = f(x(1),x(2));
    stat = 1;
end

% s = 2
if s == 2
    for i = 0:itrBound
        d = LinearSolver(Df2(x(1),x(2)),-Df(x(1),x(2)));
        if norm(d) > gradTol
            a = (-3*f(x)+4*f(x+d)-f(x+d*2))/(-2*f(x)+4*f(x+d)-2*f(x+d*2));
            if norm(a*d) > xTol
                x = x + a*d;
                intrcnt = intrcnt + 1;
            else
                xbest = x;
                fbest = f(x(1),x(2));
                stat = 0;
            end
        end
    end
    xbest = x;
    fbest = f(x(1),x(2));
    stat = 1;
end

% s = 3
if s == 3
    for i = 0:itrBound
        d = LinearSolver(Df2(x(1),x(2)),-Df(x(1),x(2)));
        if norm(d) > gradTol
            a = Bisection(Df,a,b,0.001,0.001,100,0)
            if norm(a*d) > xTol
                % using Bisection from HW1 to determine step size
                x = x + a*d;
                intrcnt = intrcnt + 1;
            else
                xbest = x;
                fbest = f(x(1),x(2));
                stat = 0;
            end
        end
    end
    xbest = x;
    fbest = f(x(1),x(2));
    stat = 1;
end

% s = 4
if s==4
    for i = 0:itrBound
        d = LinearSolver(Df2(x(1),x(2)),-Df(x(1),x(2)));
        if norm(d) > gradTol
            a = -(Df(x(1),x(2))'*d)/(d'*Df2(x(1),x(2))*d);
            if norm(a*d) > xTol
                x = x + a*d;
                intrcnt = intrcnt + 1;
            else xbest = x; fbest = f(x(1),x(2)); stat = 0; return
            end
        end
    end
    xbest = x;
    fbest = f(x(1),x(2));
    stat = 1;
end