param.g = 9.81;

%% Car data
% Distances
param.trackwidthF = 1.22;
param.trackwidthR = 1.22;
param.wheelbase = 1.535;
param.r_cdg = 0.5;
param.lf = param.wheelbase*param.r_cdg;
param.lr = param.wheelbase*(1-param.r_cdg);

% Mass and inertia
param.mass = 345;
param.Iz = 190;
param.nsm_f = 14.5;
param.nsm_r = 12.0;
param.sm = param.mass - param.nsm_f - param.nsm_r;
param.sm_f = param.sm * param.r_cdg;
param.sm_r = param.sm * (1-param.r_cdg);

param.h_cdg = 0.273;
param.h_cdg_nsm_f = 0.225;
param.h_cdg_nsm_r = 0.225;
param.h_cdg_sm = 0.3;

param.h_RC_f = 0.033;
param.h_RC_r = 0.097;
param.h_RA = param.h_RC_f + (param.h_RC_r - param.h_RC_f) * param.lf / param.wheelbase;

% Stiffness
K_tire  = 114000;  % (N / m)
d_tire  = 3429;  % (Ns / m)
K_s_f   = 500*175.1268;  % (N / m)
K_s_r   = 500*175.1268;  % (N / m)
K_ARB_f = 3786;  % (N / m)
K_ARB_r = 11; % (N / m)
d_f     = 3200;  % (Ns / m)
d_r     = 3555;  % (Ns / m)
% Motion Ratios
MR_s_f        = 1.1003;  % (m / m)
MR_s_r        = 1.1003;  % (m / m)
MR_ARB_f_DIRK = 2.05;  
MR_ARB_r_DIRK = 2.745;   
r_ARB_f       = 0.0628;
psi_ARB_f     = 4.056 * pi / 180; 
r_ARB_r       = 0.07;  % (m)
psi_ARB_r     = 7.35 * pi / 180;
MR_ARB_f = MR_ARB_f_DIRK * 180 / pi * 1 / (r_ARB_f * 1000 * cos(psi_ARB_f)); 
MR_ARB_r = MR_ARB_r_DIRK * 180 / pi * 1 / (r_ARB_r * 1000 * cos(psi_ARB_r));
WR_f = K_s_f /MR_s_f^2;
WR_r = K_s_r /MR_s_r^2;

param.RS_f = 0.5 * param.trackwidthF^2 * tan(pi/180) * (WR_f + K_ARB_f / MR_ARB_f^2);
param.RS_r = 0.5 * param.trackwidthR^2 * tan(pi/180) * (WR_r + K_ARB_r / MR_ARB_r^2);
param.RS = param.RS_f + param.RS_r;

param.gear_ratio = 12.48;
param.rdyn = 0.225;
param.wheel_inertia = 0.4;
param.torque_limit_positive = [21; 21; 21; 21];
param.torque_limit_negative = -[21; 21; 21; 21];

param.ackermann = 0.6;

% Aero
param.rho = 1.225;
param.CDA = 1.97;
param.CLA = 4.75;
param.r_cdp = 0.4604;
param.h_cdp = 0.517;

%% State struct
state_struct.vx = 0;
state_struct.vy = 0;
state_struct.r = 0;
state_struct.wFL = 0;
state_struct.wFR = 0;
state_struct.wRL = 0;
state_struct.wRR = 0;
state_struct.ax = 0;
state_struct.ay = 0;