%% Reference speed and trajectory
FSGDV_track
ggv_simulator_loops

%% Referencias

% % % % % AutoX % % % % %

time_maneuver = cumsum([diff(s); 0]./vx_target)';
v_maneuver = 0.9*vel';           %trackdrive
k_maneuver = k';             %trackdrive


% % % % % Skidpad % % % % %

% time_maneuver = linspace(0.00001, 20, 1000);
% v_maneuver = linspace(8, 13, length(time_maneuver));
% k_maneuver = v_maneuver*0 + 1/9.125;


% % % % % Slalom % % % % %

% D_cone  = 9.0;
% W_track = 3.0;
% W_car   = 1.22;
% A_path  = (W_track - W_car) / 2; % 0.8 m
% w = pi / D_cone;
% v_maneuver = linspace(8, 20, length(time_maneuver));
% x_ref = cumtrapz(time_maneuver, v_maneuver); 
% y_ref = A_path * (1 - cos(w * x_ref));
% dy_dx = A_path * w * sin(w * x_ref);
% d2y_dx2 = A_path * w^2 * cos(w * x_ref) .* min(x_ref / (2 * D_cone), 1);
% k_maneuver = d2y_dx2 ./ (1 + dy_dx.^2).^(3/2);


% % % % % Acceleration % % % % %

% time_maneuver = linspace(0.00001, 5, 1000);
% v_maneuver = 100*ones(1,length(time_maneuver));
% v_maneuver(1) = 0;
% k_maneuver = v_maneuver*0 + 1/9.125;



% Fase de estabilización de la comunicación
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
set_param(mdl, 'PacingRate', '1.0');        % 0.25 o 0.2

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

% figure;eje1 = subplot(2,1,1);plot(out.t_sim.signals.values,'.');grid on;xlabel("Número de puntos");title("Tiempo entre iteraciones");
% eje2 = subplot(2,1,2);plot(out.t_sim.time,out.t_sim.signals.values,'.');grid on;xlabel("Tiempo de simulación [s]");linkaxes([eje1,eje2],'y');
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


