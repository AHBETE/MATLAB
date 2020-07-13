function [a,b] = FFTtest(y,t)
%

if isa(y,'char'),y = str2func(f);
elseif isa(y,'string'),y = str2func(f);
elseif isa(y,'function_handle'), y = y;
else
    error('function not defined');
end

yt=y(t);
N=length(t);
Y=zeros(1,N);
n=(0:(N-1));
Z=exp((-1i*2*pi)/(N-1));
for k=1:N
    Y(k)=sum(yt.*(Z.^((k-1).*n)));
end

a=(1/sqrt(2*pi))*real(Y);
b=(1/sqrt(2*pi))*imag(Y);