%Section 2.5
%Problem 6

%a b
fprintf('a)b)\n')
A=hilb(8);
invA=invhilb(8);
b=[1 -1 1 -1 1 -1 1 -1]';

k=cond(A);
fprintf('Condition number:\n')
disp(k)
x1=A\b;
x2=invA*b;
fprintf('\n using \\            |    using inv\n')
disp([x1,x2])
fprintf('\nRelative error:\n')
disp(norm(x1-x2)/norm(x2))
r=b-A*x1;
fprintf('\nUpper bound on relative error:\n')
disp(k*norm(r)/norm(b))

%c
fprintf('\nc)\n')
A=hilb(12);
invA=invhilb(12);
b=[1 -1 1 -1 1 -1 1 -1 1 -1 1 -1]';

k=cond(A);
fprintf('Condition number:\n')
disp(k)
x1=A\b;
x2=invA*b;
fprintf('\n using \\            |       using inv\n')
disp([x1,x2])
fprintf('\nRelative error:\n')
disp(norm(x1-x2)/norm(x2))
r=b-A*x1;
fprintf('\nUpper bound on relative error:\n')
disp(k*norm(r)/norm(b))