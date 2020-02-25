clear
close all
clc

% output gif name
filename = 'heattest.gif';

% init
dl=0.1;
dt=0.002;
x=0:dl:10;
y=0:dl:20;

[X,Y]=meshgrid(x,y);

% specify the region and boundary
r3=and((Y<(15+sqrt(-X.^2+10*X))),(Y>(5-sqrt(-X.^2+10*X))));
r1=or(abs(Y-(15+sqrt(-X.^2+10*X)))<(dl/1.5),abs(Y-(5-sqrt(-X.^2+10*X)))<(dl/1.5));
r2=and(or(X<dl,X>(10-1.5*dl)),and(Y>(5-1.5*dl),Y<(15+1.5*dl)));
r=r1+2*r2+r3;

temp=60*r3+20*r2;

T=zeros(size(temp));

% 
for k=1:1000
    for i=1:201
        for j=1:101
            if r(i,j)==2
                if i<=101
                    if j<=51
                        T(i,j)=temp(i,j)+(dt/(dl^2))*...
                            (temp(i+1,j)*2+...
                            (X(i+1,j)-5)*dl/sqrt((X(i+1,j)-5)^2+(Y(i+1,j)-5)^2)+...
                            temp(i,j+1)*2+...
                            (Y(i,j+1)-5)*dl/sqrt((X(i,j+1)-5)^2+(Y(i,j+1)-5)^2)-4*temp(i,j));
                    end
                    if (j>51) && (j<100)
                        T(i,j)=temp(i,j)+(dt/(dl^2))*...
                            (temp(i-1,j)*2+...
                            (X(i-1,j)-5)*dl/sqrt((X(i-1,j)-5)^2+(Y(i-1,j)-5)^2)+...
                            temp(i,j+1)*2+...
                            (Y(i,j+1)-5)*dl/sqrt((X(i,j+1)-5)^2+(Y(i,j+1)-5)^2)-4*temp(i,j));
                    end
                end
                if i>101
                    if (j<=51) && (j>2)
                        T(i,j)=temp(i,j)+(dt/(dl^2))*...
                            (temp(i+1,j)*2+...
                            (X(i+1,j)-5)*dl/sqrt((X(i+1,j)-5)^2+(Y(i+1,j)-5)^2)+...
                            temp(i,j-1)*2+...
                            (Y(i,j-1)-5)*dl/sqrt((X(i,j-1)-5)^2+(Y(i,j-1)-5)^2)-4*temp(i,j));
                    end
                    if j>51
                        T(i,j)=temp(i,j)+(dt/(dl^2))*...
                            (temp(i+1,j)*2+...
                            (X(i+1,j)-5)*dl/sqrt((X(i+1,j)-5)^2+(Y(i+1,j)-5)^2)+...
                            temp(i,j-1)*2+...
                            (Y(i,j-1)-5)*dl/sqrt((X(i,j-1)-5)^2+(Y(i,j-1)-5)^2)-4*temp(i,j));
                    end
                end
            end    
            if r(i,j)==1
                if (i>1) && (i<201)
                    T(i,j)=temp(i,j)+(dt/(dl^2))*(temp(i+1,j)+temp(i-1,j)+temp(i,j+1)+temp(i,j-1)-4*temp(i,j));
                end
            end
            if r(i,j)==3
                T(i,j)=80;
            end
        end
    end
    if mod(k,10)==0
        surf(X,Y,T);
        zlim([-10 100]);
        shading interp;
        camlight;
        temp=T;
        %pause(0.05)
        M(k/10)=getframe;
        im = frame2im(M(k/10));
        [imind,cm] = rgb2ind(im,256);
        if (k/10) == 1 
            imwrite(imind,cm,filename,'gif', 'Loopcount',inf,'DelayTime',0.1); 
        else 
            imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',0.05); 
        end
    end
end