function I=intsim(fun,x1,x2)
%int TBD
t=linspace(x1,x2,1000);
I=zeros(1,1000);
for j=1:1000
    N=3^8;
    h=1/(2*N);
    x=linspace(x1,j*(x2-x1)/1000,N+1);
    x22=x(2:2:end);
    I(j)=h*(2*sum(fun(x(1:end)))-fun(x(1))-fun(x(end))+2*sum(fun(x22(1:end))))/3;
end
plot(t,I)