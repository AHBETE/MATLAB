%int simpson ?
for i=1:8
    N=3^i;
    h=pi/(2*N);
    x=linspace(0,pi/2,N+1);
    x2=x(2:2:end);
    I(i)=h*(2*sum(sin(x(1:end)))-sin(x(1))-sin(x(end))+2*sum(sin(x2(1:end))))/3;
    e(i)=I(i)-1;
    h(i)=h;
end