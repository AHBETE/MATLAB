%sum to N ?
N = input('N =');

for j=1:N
    sum_u=0;
    sum_d=0;

    for i=1:j
        sum_u=1/i+sum_u;
    end

    for i=1:j
        sum_d=1/(j+1-i)+sum_d;
    end

    diff(j)=(abs(sum_u-sum_d)/(sum_u+sum_d));
end

plot(N,diff)