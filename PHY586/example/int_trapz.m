% Integrate exp(x) from [0,1] using the trapezoid rule 

% the number of intervals (panels) we choose, defines the width of the intervals
% Let's start with 1 interval and then progressively increase this for up to 1E6 
% panels... 

clear; %clear all variables -- goodbye workspace! 

N = 1;
b = 1;
a = 0;

analytical_val = exp(1)-1;
iter = 1;
rel_errors = []; %store rel. error
h_vals = []; % store h (bin-widths)
while N<1E6 
	h = (b-a)/N;
	x = linspace(a, b, N+1); % if N=1, then we have 2 x values...

	int_ex = (1/2)*(exp(x(1)) + exp(x(end))); % put the first and last values
% index x for "middle" elements
% and just sum the vector! 
	int_ex = int_ex + sum(exp(x(2:end-1))); 
	
	int_ex = int_ex.*h; %multiply by bin-width
	frac_error = (int_ex-analytical_val)./analytical_val;
	%fprintf('N=%0.2E, Trapz-estimate: %0.5E, Rel-error: %0.5E \n', N, int_ex, frac_error);

	h_vals(iter) = h;
	rel_errors(iter) = frac_error;

	N = N.*2; %double N
	iter=iter+1; % track iteration number... 

end
