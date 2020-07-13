function [x,nitr] = p2c(lm,x0)
%P2C
%input arguments:
% lm                    Lengths and WEIGHTs as a vector, i.e.
%                       [m1,m2,l1,l2,l3,l].
% x0                    An initial guess of the solution as a vector, i.e.
%                       [T1,T2,T3,sin(theta1),cos(theta1),sin(theta2),
%                       cos(theta2),sin(theta3),cos(theta3)]
%
%output arguments:
% x                     The solution as a vector, i.e.
%                       [T1,T2,T3,sin(theta1),cos(theta1),sin(theta2),
%                       cos(theta2),sin(theta3),cos(theta3)]
% nitr                  Number of iterations.
%
%example:
% input: x0=[1.6 0.7 1.3 0.5 0.6 0.6 0.89 0.62 0.8];
% lm=[1 1 1 1 1 2.4]; p2c(lm,x0);
% and the result would be print out on command window as:
% 'T1 = 1.400280, T2 = 0.980196, T3 = 1.400280,
% theta1 = 45.572996, theta2 = 0.000000, theta3 = 45.572996,
% nitr = 6'

% PHY586 2019 Zibo Wang

%init
nitr=0;
x=x0(:);
m1=lm(1);
m2=lm(2);
L1=lm(3);
L2=lm(4);
L3=lm(5);
L=lm(6);

T1=x(1);
T2=x(2);
T3=x(3);
sintheta1=x(4);
sintheta2=x(6);
sintheta3=x(8);
costheta1=x(5);
costheta2=x(7);
costheta3=x(9);

f=[T1*sintheta1-T2*sintheta2-m1;...
    T1*costheta1-T2*costheta2;...
    T2*sintheta2+T3*sintheta3-m2;...
    T2*costheta2-T3*costheta3;...
    L1*costheta1+L2*costheta2+L3*costheta3-L;...
    L1*sintheta1+L2*sintheta2-L3*sintheta3;...
    sintheta1^2+costheta1^2-1;...
    sintheta2^2+costheta2^2-1;...
    sintheta3^2+costheta3^2-1];

while norm(f)>10^(-6)
    T1=x(1);
    T2=x(2);
    T3=x(3);
    sintheta1=x(4);
    sintheta2=x(6);
    sintheta3=x(8);
    costheta1=x(5);
    costheta2=x(7);
    costheta3=x(9);

    f=[T1*sintheta1-T2*sintheta2-m1;...
        T1*costheta1-T2*costheta2;...
        T2*sintheta2+T3*sintheta3-m2;...
        T2*costheta2-T3*costheta3;...
        L1*costheta1+L2*costheta2+L3*costheta3-L;...
        L1*sintheta1+L2*sintheta2-L3*sintheta3;...
        sintheta1^2+costheta1^2-1;...
        sintheta2^2+costheta2^2-1;...
        sintheta3^2+costheta3^2-1];

    %the Jacobian
    J=[sintheta1,-sintheta2,0,T1,0,-T2,0,0,0;...
        costheta1,-costheta2,0,0,T1,0,-T2,0,0;...
        0,sintheta2,sintheta3,0,0,T2,0,T3,0;...
        0,costheta2,-costheta3,0,0,0,T2,0,-T3;...
        0,0,0,0,L1,0,L2,0,L3;...
        0,0,0,L1,0,L2,0,-L3,0;...
        0,0,0,2*sintheta1,2*costheta1,0,0,0,0;...
        0,0,0,0,0,2*sintheta2,2*costheta2,0,0;...
        0,0,0,0,0,0,0,2*sintheta3,2*costheta3];
    
    dx=-J\f;
    x=x+dx;
    nitr=nitr+1;
end

theta1=atand(x(4)/x(5));
theta2=atand(x(6)/x(7));
theta3=atand(x(8)/x(9));
fprintf(['T1 = %f, T2 = %f, T3 = %f,\n'...
    'theta1 = %f, theta2 = %f, theta3 = %f,\n',...
    'nitr = %d\n'],x(1),x(2),x(3),theta1,theta2,theta3,nitr)