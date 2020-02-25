fprintf('@Acklex(2)s function \n')
x=sym('x',[2 1]);
f=symfun(-20*exp(-0.2*sqrt((x(1)^2+x(2)^2)/2))-exp((cos(2*pi*x(1))+sin(2*pi*x(2)))/2)+exp(1)+20,x);
Df(x)=[diff(f,x(1)),diff(f,x(2))]';
Df2(x)=[diff(Df,x(1)),diff(Df,x(2))];

fprintf('using GradDesc \n')
tic
[xbest,fbest,itrcnt,stat] = GradDesc(f,Df,[4 4],0.01,0.01,1000,1);
itrcnt
toc

fprintf('using NewtonOpt \n')
tic
[xbest,fbest,itrcnt,stat] = NewtonOpt(f,Df,Df2,[4 4],0.00001,0.00001,1000,2);
itrcnt
toc