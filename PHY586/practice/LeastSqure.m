function a = LeastSquares2(x,y,f)
%Xi square... TBD

M=zeros(size(x),size(x))
b=zeros(size(x),1)
c=

for i=1:size(x)
    for j=1:size(x)
        c=1/(var(y(i,:)))^2;
        if c~=Inf
            ftemp=f(x)
            M(i,j)=c*f

