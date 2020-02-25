function [E,M,C,X] = Ising(T,size,nitr,loud)
%ISING model: Output average energy of a 2D lattice at given temperature.
%input argument:
% T                     Temperatur.
% size                  Size of the 2D lattice, ~30 is reasonable.
% nitr                  The number of iterations used, >1000 gives a
%                       reasonable prediction of energy.
% loud                  If loud = 1, how atom configuration and energy
%                       changes over time are shown.
%output argument:
% E                 	Average energy of the atom configuration at given
%                       temperature.
% M                     Average magnetization.
% C                     Average heat capacity.
% X                     Average susceptibility.
%
% TRY loud = 1 !!!

% MA342 Zibo Wang 2019

if nargin == 1
    size = 30;
    nitr = 2000;
    loud = 0;
end

n = size;
sigma = randi([0 1], n);
sigma = sigma-(1-sigma);
E = zeros(1,nitr);
M = zeros(1,nitr);

sigma = [sigma(:,n),sigma,sigma(:,1)];
sigma = [sigma(n,:);sigma;sigma(1,:)];

for k=1:nitr
    Y = rand(n);
    for i=2:n+1
        for j=2:n+1
            dE = -2*sigma(i,j)*(sigma(i+1,j)+sigma(i-1,j)+sigma(i,j+1)+sigma(i,j-1));
            if dE>0
                sigma(i,j)=-sigma(i,j);
            end
            if dE<=0
                if exp(dE/T)>=Y((i-1)+(n-1)*(j-1))
                    sigma(i,j)=-sigma(i,j);
                end
            end
            if i==2 || i==n+1 || j==2 || j==n+1
                sigma = sigma(2:end-1,2:end-1);
                sigma = [sigma(:,n),sigma,sigma(:,1)];
                sigma = [sigma(n,:);sigma;sigma(1,:)];
            end  
        end
    end

    for i=2:n+1
        for j=2:n+1
            E(k)= E(k)- ...
                sigma(i,j)*(sigma(i+1,j)+sigma(i-1,j)+sigma(i,j+1)+sigma(i,j-1))/2;
        end
    end
    
    M(k)=sum(sum(sigma));
    
    if loud == 1
        if mod(k,10)==0
            subplot(2,2,1)
            spy(sigma(2:end-1,2:end-1)==1,'c')
            hold on
            spy(sigma(2:end-1,2:end-1)==-1,'b')
            xlabel('')
            title(join(["E = " num2str(E(k)/n^2)]))
            hold off
            
            subplot(2,2,2)
            scatter((1:1:k),E(1:k)/(n^2))
            %pbaspect([1 1 1])
            xlabel('Number of iteration')
            ylabel('Energy per atom')
            axis([0 inf -2.1 0])
            
            subplot(2,2,3)
            scatter((1:1:k),M(1:k)/(n^2))
            %pbaspect([1 1 1])
            xlabel('Number of iteration')
            ylabel('Magnetization per atom')
            axis([0 inf -1.1 1.1])
           
            pause(0.02)
            
        end
    end
end

C = var(E(1500:end))/(T^2*n^2);
X = var(M(1500:end))/(T*n^2);
E = mean(E(1500:end)/n^2);
M = mean(M(1500:end)/n^2);

end