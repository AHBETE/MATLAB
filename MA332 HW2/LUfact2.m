function [Afac,p] = LUfact2(A)
%LUFACT2: Perform an LU factorization of A and return both L and U in one
%matrix Afac.
%
%input arguments:
% A                     The matrix A to be factored
%
%output arguments:
% Lfac                  A matrix with same dimensions as A, which contains
%                       both U and L.
% p                     A permutation vector.
%
% MA332 Zibo Wang 2018


% get U and L using function LUfact
[L,U,p]=LUfact(A);
Afac = L+U-eye(size(A));

