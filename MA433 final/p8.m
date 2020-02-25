%%problem 8

clear all
clc
format short

%a
fprintf('a)\n')
f=@(t,y) t*y;
y0=1;
trange=[0,1];
method=0;
y1=exp(0.5);

for i=0:4  
    dt(i+1)=0.5/2^i;
    [t,y,~]=Euler(f,y0,trange,dt(i+1),method);
    ysol(i+1)=y(1,size(y,2));
    error(i+1)=abs(ysol(i+1)-y1);
    fprintf('Stepsize = %f, y(1) = %f, error = %f;\n',dt(i+1),ysol(i+1),error(i+1))
end

%b
fprintf('\nb)\n')
ye1=LagrangePoly(dt,ysol,0);
error=abs(ye1-y1);
fprintf('Extrapolated value: %f, error = %f;\n',ye1,error)

%c
fprintf('\nc)\n')
method=2;

for i=0:4  
    [t,y,~]=Euler(f,y0,trange,dt(i+1),method);
    ysol2(i+1)=y(1,size(y,2));
    error(i+1)=abs(ysol2(i+1)-y1);
    fprintf('Stepsize = %f, y(1) = %f, error = %f;\n',dt(i+1),ysol2(i+1),error(i+1))
end

ye12=LagrangePoly(dt.^2,ysol2,0);
error=abs(ye12-y1);
fprintf('\nExtrapolated value: %f, error = %f;\n',ye12,error)