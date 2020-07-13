clc
clear
dx=0.02;
a=2;
b=1;

V0=-160E6;
[Enew(1)]=secant_d_well_solve(0.81*V0,0.825*V0,V0,-5*a,5*a,0.9*a,a,b,dx);
 
V0=-240E6;
[Enew(2)]=secant_d_well_solve(0.85*V0,0.87*V0,V0,-5*a,5*a,0.9*a,a,b,dx);

V0=-320E6;
[Enew(3)]=secant_d_well_solve(0.89*V0,0.91*V0,V0,-5*a,5*a,0.9*a,a,b,dx);

V0=-360E6;
[Enew(4)]=secant_d_well_solve(0.89*V0,0.91*V0,V0,-5*a,5*a,0.9*a,a,b,dx);

V0=-400E6;
[Enew(5)]=secant_d_well_solve(0.9*V0,0.917*V0,V0,-5*a,5*a,0.9*a,a,b,dx);

figure()
plot([-160E6,-240E6,-320E6,-360E6,-400E6],Enew,'-o');
title('Effect of changing depth');
xlabel('Depth of well (eV)');ylabel('Ground state energy level (eV)');

%plotwave(0.915*V0, V0,-5*a,5*a,0.9*a,a,b,dx)
