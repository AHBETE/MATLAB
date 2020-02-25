function [alpha] = LeastSquares(x,y,n)
%LEASTSQUARES returns the coefficients of the least-squares polynomial of
%
%input arguments:
% x                     A vector containing the x-coordinates of the data.
% y                     A vector containing the y-coordinates of the data.
% n                     The degree of the polynomal to be returned.
%
%output arguments:
% alpha                 A vector with n+1 entries specifying the
%                       coefficients of p(x), the least-squares
%                       approximating polynomial of degree n, in order from
%                       highest to lowest degree.
%
% MA332 Zibo Wang 2018


% Initialization
x = x(:);
y = y(:);


% define the Vandermonde matrix
A = fliplr(vander(x));
A = A(:,1:n);


%solve for alpha using LinearSover from HW2
[alpha, status]=LinearSolver(A'*A,A'*y);