function [t,y,stat] = Euler(f,y0,trange,deltat,method)
%EULER solves dy/dt=f(t,y),y(0)=y0
%
%input arguments:
% f                     The function. If y returns vectors of length n,
%                       then f(t,y) should take scalar values for t and
%                       column vectors of length n for y, and return column
%                       vector of length n.
% y0                    The initial value of y(t0) as a column vector.
% trange                A 1*2 vector defining the range of t.
% deltat                The step size of t.
% method                An optional parameter, with default value 0, that
%                       specifies which Euler method to use.
%                       method 0: Forward Euler's method
%                       mehtod 1: Backward Euler's method
%                       method 2: Imprived Euler's method
%
%output arguments:
% t                     A vector containing all times at which approximate
%                       opproximations to y were calculated.
% y                     An n*m matrix containing the approximation to y(tj)
%                       in column 1.
% stat                  A stats variable that should be zero if termination
%                       was successful and one otherwise.

% MA332 Zibo Wang 2018


% Initialization
k = 1;
t(1) = trange(1);
y(:,1) = y0;
stat=1;


% Forward Euler's
if method == 0
    while t(k) < trange(2)
        y(:,k+1) = y(:,k)+deltat*f(t(k),y(:,k));
        t(k+1) = t(k)+deltat;
        k = k+1;
    end
end


% Backward Euler's
if method == 1
    while t(k) < trange(2)
        t(k+1) = t(k) + deltat;
        G = @(z) z-y(:,k)-deltat*f(t(k+1),z);
        [~,~,exitflag,~]=fsolve(G,y(:,k));
        if exitflag<=0
            stat=1;
        end
        y(:,k+1)=fsolve(G,y(:,k));
        k = k+1;
    end
end


% Improved Euler's
if method == 2
    while t(k) < trange(2)
        t(k+1) = t(k)+deltat;
        y(:,k+1) = y(:,k)+ (deltat/2)*(f(t(k),y(:,k))+f(t(k+1),y(:,k)+deltat*f(t(k),y(:,k))));
        k = k + 1;
    end
end