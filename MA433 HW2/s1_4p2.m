%Section 1.4
%Problem 2

M = 0.5;
e = zeros(3,20)';
e(1,:) = 0.5;

for i=2:20
e(i,1) = M*e(i-1,1);
e(i,2) = M*e(i-1,2)^2;
e(i,3) = M*e(i-1,3)^3;
end