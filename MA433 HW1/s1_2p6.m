%Section 1.2
%Problem 6

%Define function
f= @(x) x-tan(x);
df= @(x)-tan(x)^2;

x = zeros(20,4);

for i=1:20
%Bisection
[x(i,1),~,~,~] = Bisection(f,10.85,10.95,10e-16,10e-16,i,0);

%Linear Interpolation
[x(i,2),~,~,~] = Interpolation(f,10.85,10.95,10e-16,i,0);

%Secant
[x(i,3),~,~,~] = Secant(f,10.85,10.95,10e-16,i,0);

%Newton
[x(i,4),~,~,~] = Newton(f,df,10.85,10e-16,i,0);
end