%Section 1.2
%Problem 1

%Define function
f= @(x) cos(x)-x;
df= @(x)-sin(x)-1;

%Newton
fprintf('Newton\n')
Newton(f,df,0.5,10e-16,5,1); % use intitial gusee x=0.5
fprintf('\n')

%Secant
fprintf('Secant\n')
Secant(f,0.5,1,10e-16,5,1); % use intitial gusee x=0.5 and x=1