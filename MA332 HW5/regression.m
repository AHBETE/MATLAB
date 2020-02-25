for n=1:20
    N(n)=n+4;
    [E(n),M(n),C(n),X(n)]=Ising(2.3,n+20,2000,0);
end

A=[log(N);ones(1,20)];
alpha=(A*A')\(A*log(C)')
beta=(A*A')\(A*log(abs(M))')
gamma=(A*A')\(A*log(X)')