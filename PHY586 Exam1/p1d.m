%1)d
clear
clc

%int
for i=1:6
    t(i) = (int_('cos',-1,1,10^i,1));
    s(i) = (int_('cos',-1,1,10^i,2));
    %g(i) = abs(int_gausslegendre('cos',5*i)-2*sin(1));
    N(i) = 10^i;
end

%relative errors
et=abs(diff(t));
es=abs(diff(s));
%eg=abs(diff(g));

%plot
loglog(N(2:end),et)
hold on
loglog(N(2:end),es)
%loglog(N(2:end),eg)
%legend('Trapzoid','Simpson''s','Gauss-Legnedre')
grid
xlabel('N');ylabel('relative error');