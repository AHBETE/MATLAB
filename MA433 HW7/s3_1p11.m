%%Section 3.1
%Problem 11

for k=1:20
    A=rand(100,100);
    
    D=diag(diag(A));
    L=tril(A,-1);
    U=triu(A,1);
    
    J=D\-(U+L);
    G=(L+D)\-U;
    fprintf("random matrix 1\n  spectral range of Jacobi:\n")
    disp(max(abs(eig(J))))
    fprintf("  spectral range of Gauss-Seidel:\n")
    disp(max(abs(eig(G))))
end
