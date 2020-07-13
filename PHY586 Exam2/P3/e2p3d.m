clear;clc;

g=9.81; %gravity a
L=1; %assume length of pendulum is 1m
m=1;%suppose m=1kg
tvec = (0:0.01:4);

str=[];
for  i=1:17
    hold on
    theta = 10*i;
    [thetat,~] = nonlinearpendulum(theta,tvec);
    thetat=thetat/max(thetat);
    plot(tvec,thetat,'Color',([1,1,1]-i*[5,5,5]/100));
    tempstr=strcat(num2str(i*10),char(176));
    str=[str,{tempstr}];
end

xlabel('Time (sec)');ylabel('Normalized angular displacement');
legend(str);
hold off