vdc_TimeStep = 0.01; % 100 Hz

%% Car data

param_vdc.mass = 320;
param_vdc.Iz = 200;

param_vdc.trackwidthF = 1.24;
param_vdc.trackwidthR = 1.18;
param_vdc.wheelbase = 1.535;
param_vdc.r_cdg = 0.52;
param_vdc.lf = param_vdc.wheelbase*param_vdc.r_cdg;
param_vdc.lr = param_vdc.wheelbase*(1-param_vdc.r_cdg);
param_vdc.h_cdg = 0.3;

param_vdc.gear_ratio = 45/11;
param_vdc.rdyn = 0.225;
param_vdc.wheel_inertia = 0.85;
param_vdc.static_torque_distribution = [0; 0; 0.5; 0.5];
param_vdc.torque_limit_positive = [0; 0; 230/2; 230/2];
param_vdc.max_power_total = 20000;

% Aero
param_vdc.rho = 1.2;
param_vdc.CDA = 1.1;
param_vdc.CLA = 3.5;

param_vdc.g = 9.81;