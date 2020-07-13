function dydx=diff_(fun,x,h,method)
%DIFF_: perform numerical differentiation and evaluate at a point.
%
%input argument:
% fun                     The function to be differentiated, can be string,
%                         char or function_handle.
% x                       A number at which the derivative to be evaluated.
% h                       Step size of numerical differentiation.
% method                  1: forward-difference method;
%                         2: centered-difference method;
%                         3: extrapolated-difference method.
%
%output argument:
% dydx                    derivative evaluted at x.

% PHY586 Zibo Wang 2019

% Initialization
if isa(fun,'char'),fun = str2func(fun);
elseif isa(fun,'string'),fun = str2func(fun);
elseif isa(fun,'function_handle'), fun = fun;
end

% Evaluate the derivative
if method==1
    dydx=(fun(x+h)-fun(x))/h;
elseif method==2
    dydx=(fun(x+h/2)-fun(x-h/2))/h;
elseif method==3
    dydx=(4*(fun(x+h/2)-fun(x-h/2))/h-(fun(x+h/4)-fun(x-h/4))/(h/2))/3;
end