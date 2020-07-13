TOL = 1E-12;
x=input('Input value of x to calculate exp(-x):');

if x>0 % input checking!
	x = -x;
	disp('Flipping sign of input to ensure it is NEGATIVE!');
end

n = 1;
continue_calculation = 1;
sum_series = 1;
while continue_calculation
	nth_term = (x^n)/factorial(n);
	sum_series = sum_series + nth_term;
	if abs(nth_term/sum_series) <= TOL	
		continue_calculation = 0;
	else
		n = n+1;
	end
end

abs_error = abs(sum_series - exp(x));
rel_error = abs_error./exp(x);
fprintf('Took %d steps to converge for input x=%0.4f\n', n, x);
fprintf('Calculated value = %0.16E, MATLAB library call = %0.16E\n', sum_series, exp(x));
fprintf('\t Abs. error = %0.16E \n', abs_error);
fprintf('\t Rel. error = %0.16E \n', rel_error);
