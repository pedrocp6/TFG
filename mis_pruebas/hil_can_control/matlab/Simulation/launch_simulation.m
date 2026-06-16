%% Reference speed and trajectory
FSGDV_track
ggv_simulator_loops

% time_ref = cumsum([diff(s); 0]./vx_target);
% time_ref = linspace(0,10,1000);
% Tini = time_ref(1);
% Tend = time_ref(end);

% Tend = min(Tend, 5.0);


% Reference speed 
% v_ref = 0.9*vel;           %trackdrive
% v_ref = 1+20*time_ref;  %acceleration
% v_ref = 10 +0*time_ref;   %skidpad
% v_ref = 1.5*vx_target-8;  % mi AutoX
% v_ref = linspace(8,13,length(time_ref));    % mi skidpad a tope
% v_ref = linspace(2,10,length(time_ref));    % mi skidpad

% v_ref = vel;
% v_target = timeseries(v_ref,time_ref);

% Reference trajectory
% k_ref = k;             %trackdrive
% k_ref = k*0;            %acceleration
% k_ref = k*0+1/9.125;   %skidpad
% k_target = timeseries(k_ref,time_ref);



%% 
% 1. Definir el tiempo de la maniobra real (ej. de 0 a 10s)
% time_maneuver = linspace(0, 10, 1000); 
time_maneuver = cumsum([diff(s); 0]./vx_target)';

% 2. Generar las referencias base de la maniobra (como ya las tenías)
% v_maneuver = linspace(8, 13, length(time_maneuver));    % mi skidpad
% v_maneuver = 100*ones(1,length(time_maneuver));
v_maneuver = 0.7*vel';           %trackdrive

% k_maneuver = v_maneuver*0 + 1/9.125;                               % skidpad
k_maneuver = k';             %trackdrive

% ========================================================
% 3. INYECCIÓN DE LA FASE DE CALENTAMIENTO (WARM-UP)
% ========================================================
T_warmup = 2.0; % Segundos de espera para estabilizar el USB

% Creamos un vector de tiempo muerto (desde 0 hasta T_warmup)
time_warmup = linspace(0, T_warmup, 200); 

% Durante el calentamiento, velocidad 0 y curvatura 0
v_warmup = v_maneuver(1)+zeros(1, length(time_warmup));
k_warmup = zeros(1, length(time_warmup));

% 4. Concatenar (unir) el calentamiento con la maniobra real
% Desplazamos el tiempo de la maniobra para que empiece después del warm-up
time_ref = [time_warmup, time_maneuver + T_warmup];
v_ref = [v_warmup, v_maneuver];
k_ref = [k_warmup, k_maneuver];

Tini = time_ref(1);
Tend = time_ref(end);

% 5. Crear los Timeseries finales para Simulink
v_target = timeseries(v_ref, time_ref);
k_target = timeseries(k_ref, time_ref);



%% 
% Initial values
vx0 = v_warmup(1);
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

% Como siempre
set_param(mdl, 'EnablePacing', 'on');
set_param(mdl, 'PacingRate', '0.15');        % 0.5

% set_param(mdl, 'SystemTargetFile', 'grt.tlc');
set_param(mdl, 'SimulationMode', 'normal');
set_param(mdl, 'ExtMode', 'off');

tic;

out = sim(mdl,'StartTime',num2str(Tini),'StopTime',num2str(Tend));
% out = sim(mdl,'StopTime',num2str(Tend));

tiempo_sim = toc;

fprintf('Tiempo simulación: %.1f s\n', tiempo_sim);

%% Log data
logdata
% log_estimation

%% Gráficas 

%% Comprobar tiempo de ejecución

% Ponemos el 10 para evitar los primeros valores que son mentira

tiempo = mean(out.t_sim.signals.values(10:end,1));
fprintf('Tiempo medio entre iteraciones: %.3f s\n', tiempo);

figure;eje1 = subplot(2,1,1);plot(out.t_sim.signals.values,'.');grid on;xlabel("Número de puntos");title("Tiempo entre iteraciones");
eje2 = subplot(2,1,2);plot(out.t_sim.time,out.t_sim.signals.values,'.');grid on;xlabel("Tiempo de simulación [s]");linkaxes([eje1,eje2],'y');
% ylim([0,0.01]);


% figure;plot(out.torque_cmd.time,out.torque_cmd.signals.values(:,1),'.'); grid on;

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


