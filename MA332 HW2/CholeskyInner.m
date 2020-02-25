function [L,status] = CholeskyInner(A)
%CHOLESKYINNER Factor a positive definite matrix A into L*L'. 
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
for j=1:m-1
    for i=j+1:m
        L(i,j)=M(i,j)/M(j,j);
        M(i,j)=0;
        M(i,j+1:end)=M(i,j+1:end)-L(i,j)*M(j,j+1:end);
        M(j,i)=0;
        M(j+1:end,i)= M(j+1:end,i)-L(i,j)*M(j+1:end,j);
    end
end
L=L*sqrtm(M);
status=0;