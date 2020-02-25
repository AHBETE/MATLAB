function [t,y] = RK4(f,y0,trange,deltat)
%RK4 solve a differential equation (dy/dt=f(t,y),y(0)=y0) using RK4 method
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

% MA332 Zibo Wang 2018


% Initialization
k = 1;
t(1) = trange(1);
y(:,1) = y0;


%
while t(k) < trange(2)
    k1 = deltat*f(t(k),y(:,k));
    k2 = deltat*f(t(k)+deltat/2,y(:,k)+k1/2);
    k3 = deltat*f(t(k)+deltat/2,y(:,k)+k2/2);
    k4 = deltat*f(t(k)+deltat,y(:,k)+k3);
    
    y(:,k+1) = y(:,k)+(1/6)*(k1+2*k2+2*k3+k4);
    t(k+1) = t(k)+deltat;
    k = k+1;
end