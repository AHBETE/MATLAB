%%Section 3.1
%Problem 8

clear all
clc
format short

%Suppose we are solving Ax=[1,1,1]'
A=[11/36 -7/36 -1/36;-1/12 5/12 -1/12;-1/18 -1/18 5/18];
b=ones(3,1);
%inital guess
x0=[0,0,0]';

%Using Gauss-Seidel(spectral range ~0.3
D=diag(diag(A));L=tril(A,-1);U=triu(A,1);
xgs(1,:)=x0';
for i=2:10
    xgs(i,:)=(L+D)\(-U*xgs(i-1,:)'+b);
end

%Using Jacobi(spectral range ~0.5
xj(1,:)=x0';
for i=2:10
    xj(i,:)=D\(-(U+L)*xj(i-1,:)'+b);
end

%Actual solution
x=A\b;

fprintf("Iteration:\n")
disp(table(xgs,xj))
fprintf("Actual solution:\n")
disp([x',x'])