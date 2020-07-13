%% log-log plot for summing the series $\frac{1}{N}$
% We want to calculate the term:
%
% $$d = \frac{|S_{UP} - |S_{DOWN}|}{|S_{UP}| + |s_{DOWN}|}$$
% 
% And then plot $d$ for varying $N$

%%
% First, set up a vector of $N$ ranging from $10^3$ to $10^7$
N = round(logspace(3, 4, 100));
%% 
% Next, we know we'll have _as many_ $d$ terms as $N$, set them to 0
%
% see |help zeros|
term = zeros(size(N)); 

%%%
% set up a *for loop* and let |index| track each N value
index=1;
for n=N
	fprintf('Calculating up/down sums for N=%d ...', n);
%%%
% start the timer, see |help tic|
	tic; 
%%% 
% call the function
	[s_up, s_dn] = fun_one_overN_up_down(n);
%%%
% stop timer
	toc; 
	term(index) = abs(s_up - s_dn)/(s_up + s_dn);
	index = index+1; %increment index!
end

%%% 
% now plot using the loglog function 
loglog(N, term, '-ok');
%%%
% set up plot annotations
xlabel('N'); 
%%%
% use Latex for annotations!
ylabel('(S_U-S_D)/(S_U+S_D)');
