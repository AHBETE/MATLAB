function [x, status]=LinearSolver(A,b)
%LINEARSOLVER: solve Ax = b by row reducing the augmented maxtrix [A|b]
%
%input arguments:
% A                     The coeefficient matrix A of the linear system
% b                     The right-hand side vector b of the system
%
%output arguments:
% x                     A solution to Ax = b if one exist
% status                0: Ax = b is consistent with a unique solution
%                       1: Ax = b is consistent with an infinite number of
%                          solutions.
%                       2: Ax = b is inconsistent
%                       3: Failure for resaon such as inconsistent
%                       dimension of A and b
%
% MA332 Zibo Wang 2018


% wrong input arguments
if ismatrix(A)==0
    status = 3
    return
end
if iscolumn(b)==0
    status = 3
    return
end

[a1,a2]=size(A);
[b1,b2]=size(b);
if a1 ~= b1
    x = NaN;
    status = 3;
    return
end

% Initialization
M = [A,b];
[m,n]=size(M);
x = zeros(m,1);

% Get upper-triangular
for i = 1:m
    for j = i+1:m
        M(i,:) = M(i,:)/M(i,i);
        M(j,:) = M(j,:)- M(i,:)*M(j,i);
    end
end
M(m,:)= M(m,:)-M(m-1,:)*M(m,m-1);
M(m,:)= M(m,:)/M(m,m);

% 
if M(m,m)==0
    status = 1;
    return
end

for i = 1:m
    if M(i,:)==zeros(m,1)
        status = 2
        return
    end
end

% Solve for x
for i = m:-1:1
    x(i)=M(i,n);
    for j = i+1:m
        x(i)=x(i)-M(i,j)*x(j);
    end
end
status = 0;