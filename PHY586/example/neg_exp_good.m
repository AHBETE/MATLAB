TOL = 1E-12;
x=input('Input value of x to calculate exp(-x):');

if x<0 % input checking!
	warning('positive input for x ignored, calculating exp(-%0.4f)', x);
else 
	x = abs(x); %need positive values for calculation below!
end

n = 1;
continue_calculation = 1;
sum_series = 1;
while continue_calculation
	nth_term = (x^n)/factorial(n);
	sum_series = sum_series + nth_term;
	recip_sum = 1./sum_series;
	if abs(nth_term/recip_sum) <= TOL	
		continue_calculation = 0;
	else
		n = n+1;
	end
end

abs_error = abs(recip_sum - exp(-x));
rel_error = abs_error./exp(-x); % ENSURE we're calculating exp(-x) !

fprintf('Took %d steps to converge for input x=%0.4f\n', n, x);
fprintf('Calculated value = %0.16E, MATLAB library call = %0.16E\n', recip_sum, exp(-x));
fprintf('\t Abs. error = %0.16E \n', abs_error);
fprintf('\t Rel. error = %0.16E \n', rel_error);
