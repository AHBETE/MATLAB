%Section 1.4
%Problem 4

%Define function
f = @(x) 5*sin(x)^2-8*cos(x)^5;

for i=1:10
%Secant
[x(i),~,~,~]=Secant(f,0.5,1.5,10e-16,i,0);
end

x = x';
e = x - x(10)';
fprintf('     x                   error\n')
disp([x,e])