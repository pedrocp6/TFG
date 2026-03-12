%% Reference speed and trajectory
FSGDV_track
ggv_simulator_loops

time_ref = cumsum([diff(s); 0]./vx_target);
Tini = time_ref(1);
Tend = time_ref(end);

% Tend = min(Tend, 5.0);


% Reference speed 
% v_ref = vel;           %trackdrive
% v_ref = 1+20*time_ref;  %acceleration
% v_ref = 10 +0*time_ref;   %skidpad
% v_ref = 1.5*vx_target-8;
v_ref = vel;
v_target = timeseries(v_ref,time_ref);

% Reference trajectory
k_ref = k;             %trackdrive
% k_ref = k*0;            %acceleration
% k_ref = k*0+1/9.125;   %skidpad
k_target = timeseries(k_ref,time_ref);

% Initial values
vx0 = v_ref(1);
vy0 = 0;
yaw_rate0 = 0;
wFL0 = vx0/param_vdc.rdyn;
wFR0 = vx0/param_vdc.rdyn;
wRL0 = vx0/param_vdc.rdyn;
wRR0 = vx0/param_vdc.rdyn;

%% Run simulation
cd(fileparts(mfilename('fullpath')))

sim_TimeStep = 0.0001; % 10 kHz
control_TimeStep = vdc_TimeStep;
mdl = [ROOT_DIR '/ART25_full_car_old.slx'];

tic;

out = sim(mdl,'StartTime',num2str(Tini),'StopTime',num2str(Tend));

tiempo = toc;

fprintf('Tiempo simulación: %.1f s\n', tiempo);

%% Log data
logdata
% log_estimation

