function I = int_gausslegendre(f,N)
%%INT_ Perform a numerical integration for a function from -1 to 1 via the
%N-point Gauss-Legendre quadrature method.
%
%input argument:
% f                     The function whose root is being approximated.
% n                     Order of Legendre polynomial.
%
%output argument:
% I                     Result of the numerical integration.
%
%example: 
% int_gausslegendre('cos',10) calculate int(cos(x)) in the range -1 to 1
% using 100 points.

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

%
[x,w] = gausslegendre(N);
I=sum(w.*f(x));