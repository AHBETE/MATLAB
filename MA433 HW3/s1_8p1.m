%Section 1.8
%Problem 1
f=@(x) [x(2)-1/x(1);(x(1)/5)^2+(x(2)/8)^2-1];
J=@(x) [1/x(1)^2,1;2*x(1)/25,x(2)/32];
[x1,fx1,nitr1,status1] = Newtsys(f,J,[5,1]',1e-16,100,0)
[x2,fx2,nitr2,status2] = Newtsys(f,J,[-5,-1]',1e-16,100,0)