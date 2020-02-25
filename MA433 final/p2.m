%%problem 2
%Section 3.1 Probelm 10

A=zeros(10,10);
for i=1:10
    A(i,i)=4;
    if i~=10
        A(i,i+1)=-1;
    end
    if i~=1
        A(i,i-1)=-1;
    end
end
b=ones(10,1);
x0=zeros(10,1);
xj=x0;
xgs=x0;
xSOR1=x0;
xSOR2=x0;
nj=0;
ngs=0;
nSOR1=0;
nSOR2=0;

D=diag(diag(A));L=tril(A,-1);U=triu(A,1);

%Jacobi
while norm(A*xj-b)>1e-6
    xj=D\(-(U+L)*xj+b);
    nj=nj+1;
end

%Gauss-Seidel
while norm(A*xgs-b)>1e-6
    xgs=(L+D)\(-U*xgs+b);
    ngs=ngs+1;
end

%SOR
while norm(A*xSOR1-b)>1e-6
    w=1.05;
    xSOR1=(D+w*L)\(w*b-(w*U+(w-1)*D)*xSOR1);
    nSOR1=nSOR1+1;
end
while norm(A*xSOR2-b)>1e-6
    w=1.5;
    xSOR2=(D+w*L)\(w*b-(w*U+(w-1)*D)*xSOR2);
    nSOR2=nSOR2+1;
end

fprintf('solutions:\n')
disp(table(xj,xgs,xSOR1,xSOR2))
fprintf('number of iteration:\n')
disp(table(nj,ngs,nSOR1,nSOR2))