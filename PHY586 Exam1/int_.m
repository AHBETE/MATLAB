function I = int_(f,a,b,N,method)
%INT_ Perform a numerical integration for a function from a to b via the
%N-panel trapzoid or Simpson's method
%
%input argument:
% f                     The function whose root is being approximated
% a                     An endpoint of the interval.
% b                     A second endpoint of the interval.
% N                     Number of panel used for integration.
% method                1: Trapzoid method
%                       2: Simpson's method
%
%output argument:
% I                     Result of the numerical integration.
%
%example: 
% int_('sin',0,2*pi,100,1) calculate int(sin(x)) in the range 0 to 2pi
% using trapzoid method with 100 panels.

% PHY586 2019 Zibo Wang

%init
if isa(f,'char')
    f = str2func(f);
elseif isa(f,'string')
    f = str2func(f);
elseif isa(f,'function_handle')
    f = f;
else
    error('function not defined');
end

if a>=b
    error('a has to be less than b')
end

%Trapzoid
if method==1
    x=linspace(a,b,N);
    h=(b-a)/N;%step size
    I=sum(f(x))*h-(f(a)+f(b))*h/2;

%Simpson's
elseif method==2
    if mod(N,2)==0
        N=N-1;
    end
    x=linspace(a,b,N);
    x2=x(2:2:end);%for those points at which function is evaluated four times
    h=(b-a)/(N);%step size
    I=h*(2*sum(f(x(1:end)))-f(x(1))-f(x(end))+2*sum(f(x2(1:end))))/3;
end