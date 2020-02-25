function [L,U,p]=LUfact(A)
%LUFACT: Factor the maxtrix A into LU up to a permutation.
%
%input arguments:
% A                     The matrix A to be factored
%
%output arguments:
% L                     A square lower triangular matrix with ones along
%                       the main diagonal.
% U                     An upper triangular matrix
% p                     A permutation vector.
%
% MA332 Zibo Wang 2018


% Initialization
M = A;
[m,n] = size(A);
L = eye(m,m);
U = zeros(m,n);
p = (1:m)';


%
for i=1:m
    % pivot the largest element and record the permutation vector
    [Ma,I]=max(abs(M(i:m,i)));
    I = I+i-1;
    M([i I],:) = M([I i],:);
    p([i I])= p([I i]);
    % row reduction
    for j=i+1:m
        norm = M(j,i)/M(i,i);
        M(j,:)= M(j,:)-norm*M(i,:);
        L(j,i)= norm;
    end
end
U = M;