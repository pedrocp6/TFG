%% Reference speed and trajectory
FSGDV_track
ggv_simulator_loops

% time_ref = cumsum([diff(s); 0]./vx_target);
time_ref = linspace(1,10,1000);
Tini = time_ref(1);
Tend = time_ref(end);

% Tend = min(Tend, 5.0);


% Reference speed 
% v_ref = 0.9*vel;           %trackdrive
% v_ref = 1+20*time_ref;  %acceleration
% v_ref = 10 +0*time_ref;   %skidpad
% v_ref = 1.5*vx_target-8;  % mi AutoX
% v_ref = linspace(8,13,length(time_ref));    % mi skidpad a tope
v_ref = linspace(2,10,length(time_ref));    % mi skidpad

% v_ref = vel;
v_target = timeseries(v_ref,time_ref);

% Reference trajectory
% k_ref = k;             %trackdrive
% k_ref = k*0;            %acceleration
k_ref = k*0+1/9.125;   %skidpad
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

% mdl = [ROOT_DIR '/ART25_full_car_old.slx'];
mdl = 'ART25_full_car_old';
sim_TimeStep = 0.0001; % 10 kHz

set_param(mdl, 'SolverType', 'Fixed-step');
set_param(mdl, 'FixedStep', num2str(sim_TimeStep));


% Como siempre
set_param(mdl, 'EnablePacing', 'on');
set_param(mdl, 'PacingRate', '0.5');

% set_param(mdl, 'SystemTargetFile', 'grt.tlc');
set_param(mdl, 'SimulationMode', 'normal');
set_param(mdl, 'ExtMode', 'off');

% Con Desktop Real-Time
% set_param(mdl, 'EnablePacing', 'off');
% set_param(mdl, 'Solver', 'ode1');
% 
% set_param(mdl, 'SystemTargetFile', 'sldrt.tlc'); % Compilador para Desktop Real-Time
% % set_param('ART25_full_car_old/ART25_old', 'SystemTargetFile', 'sldrt.tlc'); % Compilador para Desktop Real-Time
% % 
% % set_param('ART25_full_car_old/ART25_old/vehicle_dynamics_old', 'SystemTargetFile', 'sldrt.tlc'); % Compilador para Desktop Real-Time
% % set_param('HIL_comm_old', 'SystemTargetFile', 'sldrt.tlc'); % Compilador para Desktop Real-Time
% 
% set_param(mdl, 'SimulationMode', 'external');    % Modo de simulación Externa
% set_param(mdl, 'ExtMode', 'on');                 % Activar comunicación de modo externo
% % Construir y conectar
% set_param(mdl, 'SimulationCommand', 'connect');
% pause(2);  % Esperar conexión
% 
% % Enviar un mensaje CAN inicial desde MATLAB para arrancar el ciclo
% ch = canChannel('PEAK-System', 'PCAN_USBBUS1');
% configBusSpeed(ch, 1000000);
% start(ch);
% 
% % Mensaje dummy para arrancar el handshake
% msg_init = canMessage(hex2dec('010'), false, 8);
% msg_init.Data = zeros(1, 8, 'uint8');
% transmit(ch, msg_init);
% msg_init = canMessage(hex2dec('011'), false, 8);
% msg_init.Data = zeros(1, 8, 'uint8');
% transmit(ch, msg_init);
% msg_init = canMessage(hex2dec('012'), false, 8);
% msg_init.Data = zeros(1, 8, 'uint8');
% transmit(ch, msg_init);
% msg_init = canMessage(hex2dec('013'), false, 8);
% msg_init.Data = zeros(1, 8, 'uint8');
% transmit(ch, msg_init);
% msg_init = canMessage(hex2dec('014'), false, 8);
% msg_init.Data = zeros(1, 8, 'uint8');
% transmit(ch, msg_init);
% msg_init = canMessage(hex2dec('015'), false, 8);
% msg_init.Data = zeros(1, 8, 'uint8');
% transmit(ch, msg_init);
% pause(0.1);
% stop(ch);
% clear ch;

tic;

out = sim(mdl,'StartTime',num2str(Tini),'StopTime',num2str(Tend));
% set_param(mdl, 'SimulationCommand', 'start');


% (Esto es solo si decides usar SimulationMode = 'external')
% set_param(mdl, 'SimulationCommand', 'start');
% 
% % Esperar a que termine
% while ~strcmp(get_param(mdl, 'SimulationStatus'), 'stopped')
%     pause(0.5);
% end




tiempo_sim = toc;

fprintf('Tiempo simulación: %.1f s\n', tiempo_sim);

%% Log data
% logdata
% log_estimation

%% Gráficas 

%% Comprobar tiempo de ejecución

% Ponemos el 10 para evitar los primeros valores que son mentira

tiempo = mean(out.t_sim.signals.values(10:end,1));
fprintf('Tiempo medio entre iteraciones: %.3f s\n', tiempo);

figure;eje1 = subplot(2,1,1);plot(out.t_sim.signals.values,'.');grid on;xlabel("Número de puntos");title("Tiempo entre iteraciones");
eje2 = subplot(2,1,2);plot(out.t_sim.time,out.t_sim.signals.values,'.');grid on;xlabel("Tiempo de simulación [s]");linkaxes([eje1,eje2],'y');
ylim([0,0.08]);


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


