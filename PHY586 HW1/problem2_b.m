%%problem 2b
%Zibo Wang 2019

clear
close all
clc

max=1;%set a initial value
while max*2~=Inf
    max=max*2;
end

for i=1:15
    while max*(1+10^(-i))~=Inf
        max=max*(1+10^(-i));
    end
end

min=-1;%set a initial value
while min*2~=-Inf
    min=min*2;
end

for i=1:15
    while min*(1+10^(-i))~=-Inf
        min=min*(1+10^(-i));
    end
end

fprintf('largest positive number = %e, lowest negative number = %e\n',max,min);