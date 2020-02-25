function [L,status] = CholeskyOuter(A)
%CHOLESKYOUTER Factor a positive definite matrix A into L*L'. 
%
%input arguments:
% A                     The matrix A to be factored
%
%output arguments:
% L                     A lower triangular matrix L satisfying L*L'= A ,
%                       where L is lower triangular.
% status                0: The function succeeded.
%                       1: The function failed because A is square but is
%                       not positive definite.
%                       2: The function failed for some other reason, such
%                       as A being non square.
%
% MA332 Zibo Wang 2018


% Initialization
M = A;
[m,n] = size(M);
L = eye(m,m);


% fail cases
if m ~= n
    status = 2;
    L = NaN;
    return
end

if A' ~= A
    status = 1;
    L = NaN;
    return
end


% find L
for i=1:m
    for j=i+1:m
        temp = eye(m,m);
        norm = -M(j,i)/M(i,i);
        temp(j,i) = norm;
        L(j,i)= -norm;
        M = temp*M*temp';
    end
end
L = L*sqrtm(M);
status = 0;