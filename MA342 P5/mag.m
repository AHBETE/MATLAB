clear
close all
clc

T=10;
n=30;
sigma = randi([0 1], n);
sigma = sigma-(1-sigma);
E = zeros(1,2000);

sigma = [sigma(:,n),sigma,sigma(:,1)];
sigma = [sigma(n,:);sigma;sigma(1,:)];

%filename = 'mag.gif';

for k=1:2000
    Y = rand(n);
    for i=2:n+1
        for j=2:n+1
            %dE = -2*sigma(i+(n-1)*j)*(sigma(i+(n-1)*j-1)+sigma(i+(n-1)*j+1)+sigma(i+(n-1)*j-n-2)+sigma(i+(n-1)*j+n+2));
            dE = -2*sigma(i,j)*(sigma(i+1,j)+sigma(i-1,j)+sigma(i,j+1)+sigma(i,j-1));
            if dE>0
                %sigma(i+(n-1)*j)=-sigma(i+(n-1)*j);
                sigma(i,j)=-sigma(i,j);
            end
            if dE<0
                if exp(dE/T)>=Y((i-1)+(n-1)*(j-1))
                    %sigma(i+(n-1)*j)=-sigma(i+(n-1)*j);
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
                %sigma(i+(n-1)*j)*(sigma(i+(n-1)*j-1)+sigma(i+(n-1)*j+1)+sigma(i+(n-1)*j-n-2)+sigma(i+(n-1)*j+n+2));
        end
    end
    
    if mod(k,10)==0
        subplot(1,2,1)
        spy(sigma(2:end-1,2:end-1)==1,'c')
        hold on
        spy(sigma(2:end-1,2:end-1)==-1,'b')
        xlabel('')
        title(join(["E = " num2str(E(k)/n^2)]))
        hold off
        subplot(1,2,2)
        scatter((1:1:k),E(1:k)/(n^2))
        pbaspect([1 1 1])
        xlabel('Number of iteration')
        ylabel('Energy per atom')
        axis([0 inf -2 0])
        pause(0.02)
    end
    
%     M(k)=getframe;
%     im = frame2im(M(k));
%     [imind,cm] = rgb2ind(im,256);
%     if (k/10) == 1 
%         imwrite(imind,cm,filename,'gif', 'Loopcount',inf,'DelayTime',0.1); 
%     else 
%         imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',0.05); 
%     end

end

% E = E/(n^2);
% figure(2)
% scatter((1:1:2000),E)