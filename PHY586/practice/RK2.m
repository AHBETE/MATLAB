function [t,y] = RK2(f,y0,trange,deltat)
%RK2 solve a differential equation (dy/dt=f(t,y),y(0)=y0) using RK2 method
%
%input arguments:
% f                     The function. If y returns vectors of length n,
%                       then f(t,y) should take scalar values for t and
%                       column vectors of length n for y, and return column
%                       vector of length n.
% y0                    The initial value of y(t0) as a column vector.
% trange                A 1*2 vector defining the range of t.
% deltat                The step size of t.
%
%output arguments:
% t                     A vector containing all times at which approximate
%                       opproximations to y were calculated.
% y                     An n*m matrix containing the approximation to y(tj)
%                       in column 1.

% PHY586 Zibo Wang 2019


% Initialization
k = 1;
t(1) = trange(1);
y(:,1) = y0;


%
while t(k) < trange(2)
    dydt=f(t(k)+deltat/2,y(:,k)+deltat*f(t(k),y(:,k))/2);
    
    y(:,k+1) = y(:,k)+deltat*dydt;
    t(k+1) = t(k)+deltat;
    k = k+1;
end