%Sorry for the inconvenience
%Each command has to be used individually and after all figures are closed.

%% Couette flow water
%[yw,uw] = CoutteNewtonianFluid(2,0.05,8.90e-4);

%% Couette flow mercury
%[ym,um] = CoutteNewtonianFluid(2,0.05,1.50e-3);

%% Couette flow of Thixotropic Fluid
%CoutteThixotropicFluid(2,0.05,[0.5,1,1.5,2]);

%% Couette flow of Bingham Plastic
%CoutteBinghamPlastic(2,0.05,[0.5,1,1.5,2]);

%% Laminar flow of Thixotropic Fluid
%LaminarflowThixotropic(0.05,[0.25,0.5,0.75,1],1e4,5*pi/180)

%% Laminar flow of Bingham Plastic
%LaminarflowBingham(0.05,[0.25,0.5,0.75,1],1e4,5*pi/180)

%% Laminar flow of Newtonian Fluid
LaminarflowNewtonian(0.05,8.90e-4,1e4,5*pi/180)