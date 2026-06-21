%% Reference speed and trajectory
FSGDV_track
ggv_simulator_loops

time_ref = cumsum([diff(s); 0]./vx_target);
% time_ref = linspace(0,20,1000);
% time_maneuver = linspace(0.0001,20,1000);
Tini = time_ref(1);
Tend = time_ref(end);

% Tend = min(Tend, 5.0);

% Slalom
% D_cone  = 9.0;
% W_track = 3.0;
% W_car   = 1.22;
% A_path  = (W_track - W_car) / 2; % 0.8 m
% 
% w = pi / D_cone;
% v_maneuver = linspace(8, 20, length(time_maneuver));
% x_ref = cumtrapz(time_maneuver, v_maneuver); 
% y_ref = A_path * (1 - cos(w * x_ref));
% dy_dx = A_path * w * sin(w * x_ref);
% d2y_dx2 = A_path * w^2 * cos(w * x_ref) .* min(x_ref / (2 * D_cone), 1);
% k_maneuver = d2y_dx2 ./ (1 + dy_dx.^2).^(3/2);
% 
% T_warmup = 3.0;
% time_warmup = linspace(0, T_warmup, 200); 
% v_warmup = v_maneuver(1)+zeros(1, length(time_warmup));
% k_warmup = zeros(1, length(time_warmup));
% time_ref = [time_warmup, time_maneuver + T_warmup];
% v_ref = [v_warmup, v_maneuver];
% k_ref = [k_warmup, k_maneuver];



% Reference speed 
v_ref = 0.9*vel;           %trackdrive
% v_ref = 1+20*time_ref;  %acceleration
% v_ref = 10 +0*time_ref;   %skidpad
% v_ref = 1.5*vx_target-8;  % mi AutoX
% v_ref = linspace(8,13,length(time_ref));    % mi skidpad a tope

% v_ref = vel;
v_target = timeseries(v_ref,time_ref);

% Reference trajectory
k_ref = k;             %trackdrive
% k_ref = k*0;            %acceleration
% k_ref = k*0+1/9.125;   %skidpad
k_target = timeseries(k_ref,time_ref);


%% 
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

% mdl = [ROOT_DIR '/ART25_full_car_old.slx'];
mdl = 'ART25_full_car_old';
sim_TimeStep = 0.0001; % 10 kHz

set_param(mdl, 'SolverType', 'Fixed-step');
set_param(mdl, 'FixedStep', num2str(sim_TimeStep));

set_param(mdl, 'SimulationMode', 'normal');
set_param(mdl, 'FastRestart', 'off');

tic;

% out = sim(mdl,'StartTime',num2str(Tini),'StopTime',num2str(Tend));
out = sim(mdl,'StopTime',num2str(Tend));

tiempo_sim = toc;

fprintf('Tiempo simulación: %.1f s\n', tiempo_sim);

%% Log data
logdata
% log_estimation

%% %% %% Gráficas 

%% Comprobar evolución valores Ac

% for i=1:3
%     figure;
%     for j=1:3
%         subplot(3,1,j);
%         plot(out.Ac.time,squeeze(out.Ac.signals.values(i,j,:)));
%     end
% end

%% Circuito recorrido

% figure;hold on;plot(x,y);plot(out.pos.signals.values(:,1),out.pos.signals.values(:,2));


