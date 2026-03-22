vdc_TimeStep = 0.01; % 100 Hz

%% Car data
% Distances
param_vdc.trackwidthF = 1.22;
param_vdc.trackwidthR = 1.22;
param_vdc.wheelbase = 1.535;
param_vdc.r_cdg = 0.5;
param_vdc.lf = param_vdc.wheelbase*param_vdc.r_cdg;
param_vdc.lr = param_vdc.wheelbase*(1-param_vdc.r_cdg);

% Mass and inertia
param_vdc.mass = 345;
param_vdc.Iz = 190;
param_vdc.nsm_f = 14.5;
param_vdc.nsm_r = 12.0;
param_vdc.sm = param_vdc.mass - param_vdc.nsm_f - param_vdc.nsm_r;
param_vdc.sm_f = param_vdc.sm * param_vdc.r_cdg;
param_vdc.sm_r = param_vdc.sm * (1-param_vdc.r_cdg);

param_vdc.h_cdg = 0.273;
param_vdc.h_cdg_nsm_f = 0.225;
param_vdc.h_cdg_nsm_r = 0.225;
param_vdc.h_cdg_sm = 0.3;

param_vdc.h_RC_f = 0.033;
param_vdc.h_RC_r = 0.097;
param_vdc.h_RA = param_vdc.h_RC_f + (param_vdc.h_RC_r - param_vdc.h_RC_f) * param_vdc.lf / param_vdc.wheelbase;

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

param_vdc.RS_f = 0.5 * param_vdc.trackwidthF^2 * tan(pi/180) * (WR_f + K_ARB_f / MR_ARB_f^2);
param_vdc.RS_r = 0.5 * param_vdc.trackwidthR^2 * tan(pi/180) * (WR_r + K_ARB_r / MR_ARB_r^2);
param_vdc.RS = param_vdc.RS_f + param_vdc.RS_r;

param_vdc.gear_ratio = 12.48;
param_vdc.rdyn = 0.225;
param_vdc.wheel_inertia = 0.4;
param_vdc.torque_limit_positive = [21; 21; 21; 21];
param_vdc.torque_limit_negative = -[21; 21; 21; 21];
param_vdc.static_torque_distribution = [0.25;0.25;0.25;0.25];
param_vdc.max_power_total = 50000;
param_vdc.min_power_total = -30000;

param_vdc.ackermann = 0.6;

% Aero
param_vdc.rho = 1.225;
param_vdc.CDA = 1.97;
param_vdc.CLA = 4.75;
param_vdc.r_cdp = 0.4604;
param_vdc.h_cdp = 0.517;

param_vdc.g = 9.81;

% State estimation
param_vdc.gss_active = true;
param_vdc.vx_threshold = 1;

% Torque vectoring
param_vdc.TV_active = false;
param_vdc.TV_use_fz = true;
param_vdc.TV_Kp = 1000;
param_vdc.TV_Ki = 0;
param_vdc.TV_Kd = 15;
param_vdc.TV_N = 20;
param_vdc.TV_front = 0.4;
param_vdc.TV_rear = 0.6;
param_vdc.max_mz = 800;
param_vdc.max_compensation = 0.1;
param_vdc.max_yawrate_error = 1;
param_vdc.TV_use_compensation = false;

% Traction control
param_vdc.TC_active = true;
param_vdc.TC_v0 = 5;
param_vdc.TC_v_gain = 3;
param_vdc.TC_Kp = 18.25;
param_vdc.TC_Ti = 4.05;
param_vdc.TC_Td = 0;

% Time step
param_vdc.TimeStep = vdc_TimeStep;