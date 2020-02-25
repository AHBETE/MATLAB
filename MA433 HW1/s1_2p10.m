%Section 1.2
%Problem 10

%Define function
f= @(x) (x-1)^2+0.1;
df= @(x) 2*x-2;

[xbest,fxbest,nitr,status] = Newton(f,df,1.1,10e-6,1000,0)
Newton(f,df,1.1,10e-6,40,1);