%%Section 2.7
%Problem 10

for i=4:12
    b=ones(i,1);
    A=hilb(i);
    invA=invhilb(i);
    
    %solving using QR
    [Q,R]=qr(A);
    y=Q\b;
    x1=R\y;
    
    %true solution
    x2=invA*b;
    
    fprintf("\n#Hilbert matrix of order %d:\n\n   QR                  inverse\n",i)
    disp([x1,x2])
    
    re=norm(x1-x2)/norm(x2);
    fprintf("\n   relative error: %f\n",re)
    
    %condition numbers
    a=cond(A);
    q=cond(Q);
    r=cond(R);
    fprintf("\n   cond(Hilb(%d))=%g, cond(Q)=%g, cond(R)=%g\n",i,a,q,r)
end