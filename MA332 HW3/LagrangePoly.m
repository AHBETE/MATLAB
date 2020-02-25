function [z] = LagrangePoly(x,y,v)
%LAGRANGEPOLY creates a Lagrange polynomial interpolating the data in x and
%y and evaluates the polynomical at the points in v.
%
%input arguments:
% x                     A vector containing the x-coordinates of the data.
% y                     A vector containing the y-coordinates of the data.
% v                     A vector containing points at which p(x) to be
%                       evaluated, where p(x) is the interpolating
%                       polynomial.
%
%output arguments:
% z                     A vector such that zi=p(vi).
%
% MA332 Zibo Wang 2018


% Initialization
x = x(:);
y = y(:);
v = v(:);
n = size(x,1);
m = size(v,1);
temp = ones(m,1);
z = zeros(m,1);


% evaluate Lagrange polynomial for different x values
for k=1:m
    for i=1:n
        for j=1:n
            if i~=j
                temp(k)=temp(k)*(v(k)-x(j))/(x(i)-x(j));
            end
        end
        z(k)= z(k)+temp(k)*y(i);
        temp(k) = 1;
    end
end