T=linspace(1,4,100);
for i=1:length(T)
    [E(i),M(i),C(i),X(i)]=Ising(T(i),30,2000,0);
end

subplot(2,2,1)
scatter(T,E)
xlabel('Temperature')
ylabel('Energy per atom')

subplot(2,2,2)
scatter(T,M)
xlabel('Temperature')
ylabel('Magnetization per atom')

subplot(2,2,3)
scatter(T,C)
xlabel('Temperature')
ylabel('Heat capacity per atom')

subplot(2,2,4)
scatter(T,X)
xlabel('Temperature')
ylabel('Susceptibility per atom')