%% Problem 3
% Motion of two equal masses under mutual gravity.

clear
clc

SM = 1.98847e30;
mass = [0.001*SM,0.001*SM]; % suppose both masses have 0.001 solar mass
AU = 1.495978707e11;
x0 = [100*AU,-100*AU];
y0 = [0,0];
vx0 = [0,0];
vy0 = [0.1*AU,0.1*AU];
% Although two mass are stationaly, we can view them in a moving frame to
% visualize better.
y = 365.2422222*24*3600;
tvec = (0:10:12000).*y;
[xt,yt,vxt,vyt] = compute_orbits_RK4_nbody(x0, y0, vx0, vy0, mass, tvec);
plot(xt(:,1)/AU,yt(:,1)/AU,xt(:,2)/AU,yt(:,2)/AU);
xlabel('x ');ylabel('y ');
title('In a moving frame Vy = 1');

%%
% Two masses pass through each other, and never come back. Becuase they
% experience acceleration that is 'infinity' when they are right on top of
% each other. Another explaination can be, the initial configuration has
% total potential energy larger than 0, so even when two masses approach
% the infinity, they will still have residual speed.