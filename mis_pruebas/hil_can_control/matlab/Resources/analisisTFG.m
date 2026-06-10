
%% Tiempo entre comunicaciones

% Ponemos el 10 para evitar los primeros valores que son mentira
fprintf('Tiempo simulación: %.1f s\n', tiempo_sim);

tiempo = mean(out.t_sim.signals.values(10:end,1));
fprintf('Tiempo medio entre iteraciones: %.3f s\n', tiempo);

figure;eje1 = subplot(2,1,1);plot(out.t_sim.signals.values,'.');grid on;xlabel("Número de puntos");title("Tiempo entre iteraciones");
eje2 = subplot(2,1,2);plot(out.t_sim.time,out.t_sim.signals.values,'.');grid on;xlabel("Tiempo de simulación [s]");linkaxes([eje1,eje2],'y');
ylim([0,0.08]);

%% Skidpad

% Calculations
% time_limit = interp1(k_calc,time,1/9.625);
% v_limit = interp1(time,v,time_limit);
% ay_limit = interp1(time,ay,time_limit);
% time_skidpad = 2*pi*9.625/v_limit;

v_ini = 10.0;
indices_validos = find(v > v_ini);
v_analisis = v(indices_validos);
k_analisis = k_calc(indices_validos);
ay_analisis = ay(indices_validos);
time_analisis = time(indices_validos);

% Los límites no son exactamente los del skidpad porque hay que tener en
% cuenta el ancho del coche. 9.125+-1.5-+1.2

% indice_salida = find(k_analisis > 1/8.625 | k_analisis < 1/9.625, 1, 'first');
indice_salida = find(k_analisis > 1/8.825 | k_analisis < 1/9.425, 1, 'first');

if ~isempty(indice_salida)
    % Guardamos el valor en tu variable
    v_limit = v_analisis(indice_salida);
    k_limit = k_analisis(indice_salida);
    ay_limit = ay_analisis(indice_salida);
    time_limit = time_analisis(indice_salida);
    time_skidpad = 2*pi*9.125/v_limit;
    fprintf('Velocidad límite %.2f m/s, Aceleración límite %.2f m/s^2, Tiempo de skidpad %.3f s\n', v_limit, ay_limit, time_skidpad);
else
    fprintf("It wasn't possible to extract the data")
end


% Visualization

figure('Name','Skidpad trajectory')
hold on
axis equal
plot(9.125*cos(time)-0.7,9.125*sin(time)+9.125,'--k')
plot(7.625*cos(time)-0.7,7.625*sin(time)+9.125,'k')
plot(10.625*cos(time)-0.7,10.625*sin(time)+9.125,'k')
% plot(out.logsout{10}.Values.Data,out.logsout{11}.Values.Data,'r')
plot(x_pos,y_pos,'r')
plot(9.625*cos(time)-0.7,9.625*sin(time)+9.125,'-.b')
plot(8.625*cos(time)-0.7,8.625*sin(time)+9.125,'-.b')
grid on;

figure('Name','Skidpad k limits')
hold on
plot(v,v*0+1/9.125,'--k')
plot(v,v*0+1/8.625,'-.b')
plot(v,v*0+1/9.625,'-.b')
plot(v,k_calc,'r')
grid on;
xline(v_limit, 'k--', 'LineWidth', 1.5);
ylim([0.1,0.12]);xlabel("Speed [m/s]");ylabel("Curvature [1/m]");

figure('Name','Inputs')
hold on
eje1 = subplot(3,1,1);
plot(time,v,'k', 'LineWidth', 1.5);
xline(time_limit, 'r--', 'LineWidth', 1.5);
xlabel("Time [s]");ylabel("Speed [m/s]");grid on;
eje2 = subplot(3,1,2);
plot(timeExt,outsensor.steer,'k', 'LineWidth', 1.5);
xline(time_limit, 'r--', 'LineWidth', 1.5);
xlabel("Time [s]");ylabel("Steering");grid on;
eje3 = subplot(3,1,3);
plot(timeIMU,outsensor.r,'k', 'LineWidth', 1.5);
xline(time_limit, 'r--', 'LineWidth', 1.5);
xlabel("Time [s]");ylabel("Yaw rate");grid on;
linkaxes([eje1,eje2,eje3],'x');


%% 






