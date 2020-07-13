function [x,w] = gausslegendre(n)
%GAUSSLEGENDRE Find zeros and weight of the Legendre polynomial
%
%input argument:
% n                     Degree of the Legendre polynomial.
%
%output argument:
% x                     Zeros of  the Legendre polynomial.
% w                     Weights when doing a Gauss Legendre quadrature
%                       intergration.
%
%example: 
% [x,w] = gausslegendre(4) calculate 4 zeros and 4 weights for P_4(x).

% PHY586 2019 Zibo Wang

%init
x=zeros(n,1);
w=zeros(n,1);
x_=linspace(-1,1,100+10*n+round(0.1*n^2));
%x_=linspace(-1,1,10000);
y=legendreP(n,x_);
j=zerox(y);

%p.s. not accurate enough, discard
% for i=1:(length(j))
%     x(i)=x_(j(i));
%     if j(i)~=1
%         xp=(y(j(i))-y(j(i)-1))/(x_(j(i))-x_(j(i)-1));%derivative @ x_i
%     else
%         xp=(y(j(i)+1)-y(j(i)))/(x_(j(i)+1)-x_(j(i)));
%     end
%     w(i)=2/((1-x(i)^2)*(xp)^2);
% end

for i=1:(length(j))
    x2_=linspace(x_(j(i)-1),x_(j(i)),100);
    y=legendreP(n,x2_);
    k=zerox(y);
    for l=1:3%"zoom in" to reduce the error in x_i
        x2_=linspace(x2_(k-1),x2_(k),100);
        y=legendreP(n,x2_);
        k=zerox(y);
    end
    x(i)=x2_(k);
    if k~=1
        xp=(y(k)-y(k-1))/(x2_(k)-x2_(k-1));%derivative @ x_i
    else
        xp=(y(k+1)-y(k))/(x2_(k+1)-x2_(k));
    end
    w(i)=2/((1-x(i)^2)*(xp)^2);
end

end

function j=zerox(y)
%finding indices of x where fuction is about zero
    temp=diff(y>0);
    j=find(temp~=0)+1;
end

%p.s. too slow, discard
% function j=zerox(y)
% %finding indices of x where fuction is about zero
%     j=[];
%     cnt=1;
%     for a=1:(length(y)-1)
%         if sign(y(a))~=sign(y(a+1))
%             j(cnt)=a;
%             cnt=cnt+1;
%         end
%     end
% end