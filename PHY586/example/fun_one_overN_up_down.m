function [sum_up, sum_dn] = fun_one_overN_up_down(N)

% N = input('How many terms to sum (1/N) for? ');

sum_up=0;
sum_dn=0;

for n=1:N
	sum_up = sum_up + 1/n;
end

for n=N:-1:1
	sum_dn = sum_dn + 1/n;
end

% fprintf('For %d terms: \n', N);
% fprintf('\t up-sum = %0.5E, down-sum = %0.5E', sum_up, sum_dn);
% fprintf('\t Difference (Up-Down) = %0.5E\n', sum_up-sum_dn);
