%%Section 2.1
%Problem 10

for i=4:12
    H = hilb(i);
    Hi = invhilb(i);
    b = ones(i,1);
    x1 = H\b;
    x2 = Hi*b;
    dx = abs(x1-x2);
    fprintf('Hibert matrix of order %d \n',i)
    fprintf('  | solved using \\  | solved using inverse | difference \n')
    disp([x1,x2,dx])
    disp(norm(x1-x2)/norm(x2))
end    