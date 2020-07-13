sum_series = 0;
TOL = 1E-12;
x=input('Input value of x to calculate sin(x):');
x=mod(x,2*pi);

n = 1;
continue_calculation = 1;
while continue_calculation
	nth_term = (-1)^(n-1).*(x^(2*n-1))./factorial(2*n-1);
	sum_series = sum_series + nth_term;
	if abs(nth_term/sum_series) <= TOL	
		continue_calculation = 0;
	else
		n = n+1;
	end
end

abs_error = abs(sum_series - sin(x));
rel_error = abs_error./sin(x);
fprintf('Took %d steps to converge for input x=%0.4f\n', n, x);
fprintf('Matlab sin(x) = %0.5f, computed sin(x) = %0.5f\n', sin(x),sum_series);
fprintf('\t Abs. error = %0.16E \n', abs_error);
fprintf('\t Rel. error = %0.16E \n', rel_error);
