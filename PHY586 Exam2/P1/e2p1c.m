clc
clear
dx=0.02;
a=2;
V0=-320E6;


b=0.8;
[Enew(1)]=secant_d_well_solve(0.89*V0,0.91*V0,V0,-5*a,5*a,0.9*a,a,b,dx);

b=0.6;
[Enew(2)]=secant_d_well_solve(0.89*V0,0.91*V0,V0,-5*a,5*a,0.9*a,a,b,dx);

b=0.4;
[Enew(3)]=secant_d_well_solve(0.9*V0,0.91*V0,V0,-5*a,5*a,0.9*a,a,b,dx);

b=0.2;
[Enew(4)]=secant_d_well_solve(0.92*V0,0.93*V0,V0,-5*a,5*a,0.9*a,a,b,dx);

b=0.1;
[Enew(5)]=secant_d_well_solve(0.93*V0,0.94*V0,V0,-5*a,5*a,0.9*a,a,b,dx);

figure()
plot([0.8,0.6,0.4,0.2,0.1],Enew,'-o');
title('Effect of changing width');
xlabel('Width of well (fm)');ylabel('Ground state energy level (eV)');

%  plotwave(0.94*V0, V0,-5*a,5*a,0.9*a,a,b,dx)
