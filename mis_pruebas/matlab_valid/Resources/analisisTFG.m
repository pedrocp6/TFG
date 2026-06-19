
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


%% Validación del modelo MPC

vx_mpc = squeeze(out.mpc_val.signals.values(1,1,:));
vy_mpc = squeeze(out.mpc_val.signals.values(2,1,:));
r_mpc = squeeze(out.mpc_val.signals.values(3,1,:));
time_mpc = out.mpc_val.time;

vx_resampled = interp1(time, vx, time_mpc, 'pchip');
vx_error = abs(vx_resampled - vx_mpc);
mean_error_vx = mean(vx_error, 'omitnan');
rmse_error_vx = sqrt(mean(vx_error.^2, 'omitnan'));

vy_resampled = interp1(time, vy, time_mpc, 'pchip');
vy_error = abs(vy_resampled - vy_mpc);
mean_error_vy = mean(vy_error, 'omitnan');
rmse_error_vy = sqrt(mean(vy_error.^2, 'omitnan'));

r_resampled = interp1(time, yaw_rate, time_mpc, 'pchip');
r_error = abs(r_resampled - r_mpc);
mean_error_r = mean(r_error, 'omitnan');
rmse_error_r = sqrt(mean(r_error.^2, 'omitnan'));


figure;

subplot(3,3,1:2)
plot(time, vx, 'b','linewidth',3, 'DisplayName', 'Estado real'); hold on;
plot(time_mpc, vx_mpc,'k.','markerSize',5,'DisplayName','Modelo MPC'); 

grid on
legend show
legend Location best
xlabel('Tiempo [s]')
ylabel('Velocidad lontigudinal [m/s]')
set(gca,'FontSize',10)

subplot(3,3,4:5)
plot(time, vy, 'b', 'linewidth',3, 'DisplayName', 'Estado real'); hold on;
plot(time_mpc, vy_mpc,'k.','markerSize',5,'DisplayName','Modelo MPC'); 

grid on
legend show
legend Location best
xlabel('Tiempo [s]')
ylabel('Velocidad lateral [m/s]')
set(gca,'FontSize',10)

subplot(3,3,7:8)
plot(time, yaw_rate, 'b', 'linewidth',3, 'DisplayName', 'Estado real'); hold on;
plot(time_mpc, r_mpc,'k.','markerSize',5,'DisplayName','Modelo MPC'); 

grid on
legend show
legend Location best
xlabel('Tiempo [s]')
ylabel('Yaw rate [rad/s]')
set(gca,'FontSize',10)

subplot(3,3,3)
plot(time_mpc,vx_error,'b','linewidth',2);
grid on;
title(['Media: ',num2str(mean_error_vx,2),' m/s, RMSE: ', num2str(rmse_error_vx,2), ' m/s']);

subplot(3,3,6)
plot(time_mpc,vy_error,'b','linewidth',2);
grid on;
title(['Media: ',num2str(mean_error_vy,2),' m/s, RMSE: ', num2str(rmse_error_vy,2), ' m/s']);

subplot(3,3,9)
plot(time_mpc,r_error,'b','linewidth',2);
grid on;
title(['Media: ',num2str(mean_error_vy,2),' rad/s, RMSE: ', num2str(rmse_error_vy,2), ' rad/s']);


sgtitle('Validación del modelo MPC vs modelo no lineal');
x0=200;
y0=50;
width=1000;
height=600;
set(gcf,'position',[x0,y0,width,height])
% exportgraphics(gcf, 'C:\Users\Usuario\Pedro\Universidad\TFG\Figuras\validacion_modelo_mpc.png', 'Resolution', 300)


%% Cargar los datos de simulaciones de skidpad

datos_mpc = load('resultados_mpc_skidpad.mat');
datos_pd  = load('resultados_pd_skidpad.mat');

fprintf("Cargados datos skidpad\n")

%% Cargar los datos de simulaciones de AutoX

datos_mpc = load('resultados_mpc_autox.mat');
datos_pd  = load('resultados_pd_autox.mat');

fprintf("Cargados datos AutoX\n")

%% Cargar los datos de simulaciones de slalom

datos_mpc = load('resultados_mpc_slalom.mat');
datos_pd  = load('resultados_pd_slalom.mat');

fprintf("Cargados datos slalom\n")

%% Análisis de seguimiento de curvatura de referencia

L = 1.535;

k_ideal_mpc = tan(datos_mpc.run_data.steer) / L;
k_ideal_pd  = tan(datos_pd.run_data.steer) / L;


figure;
x0 = 0; 
y0 = 0; 

screen = get(0,'ScreenSize');
width  = round(screen(3));
height = round(screen(4));

% width = 1200; % Más ancha para que los subplots horizontales se vean bien
% height = 500; 

set(gcf, 'position', [x0, y0, width, height], 'Color', 'w')

% % Si quiero dos gráficas
% eje1 = subplot(1, 2, 1);
% plot(k_target, 'k--', 'linewidth', 2, 'DisplayName', 'Curvatura de referencia'); hold on;
% plot(datos_mpc.run_data.time, k_ideal_pd, 'r--', 'linewidth', 2, 'DisplayName', 'Curvatura Ideal (Volante)'); hold on;
% plot(datos_pd.run_data.time, datos_pd.run_data.k_calc, 'b', 'linewidth', 2.5, 'DisplayName', 'Curvatura Real (PD)');
% grid on
% legend('show', 'Location', 'best')
% xlabel('Tiempo [s]')
% ylabel('Curvatura \kappa [1/m]')
% title('Controlador PD')
% 
% set(gca, 'FontSize', 11)
% eje2 = subplot(1, 2, 2);
% plot(k_target, 'k--', 'linewidth', 2, 'DisplayName', 'Curvatura de referencia'); hold on;
% plot(datos_mpc.run_data.time, k_ideal_mpc, 'r--', 'linewidth', 2, 'DisplayName', 'Curvatura Ideal (Volante)'); hold on;
% plot(datos_mpc.run_data.time, datos_mpc.run_data.k_calc, 'b', 'linewidth', 2.5, 'DisplayName', 'Curvatura Real (MPC)'); 
% grid on
% legend('show', 'Location', 'best')
% xlabel('Tiempo [s]')
% ylabel('Curvatura \kappa [1/m]')
% title('Controlador LTV-MPC')
% set(gca, 'FontSize', 11)
% linkaxes([eje1,eje2],'xy');


% % Si quiero una sola gráfica
t_target_raw = k_target.Time;
datos_target_raw = squeeze(k_target.Data);
[t_target, unique_idx] = unique(t_target_raw);
datos_target = datos_target_raw(unique_idx);

k_resampled = interp1(t_target, datos_target, time, 'pchip');

k_error_pd = abs(k_resampled - datos_pd.run_data.k_calc);
rmse_error_k_pd = sqrt(mean(k_error_pd.^2, 'omitnan'));

k_error_mpc = abs(k_resampled - datos_mpc.run_data.k_calc);
rmse_error_k_mpc = sqrt(mean(k_error_mpc.^2, 'omitnan'));


subplot(1,4,1:3)
plot(datos_pd.run_data.time, datos_pd.run_data.k_calc, 'r', 'linewidth', 2.5, 'DisplayName', 'Curvatura Real (PD)'); hold on;
plot(datos_mpc.run_data.time, datos_mpc.run_data.k_calc, 'b', 'linewidth', 2.5, 'DisplayName', 'Curvatura Real (MPC)'); 
plot(k_target, 'k--', 'linewidth', 2, 'DisplayName', 'Curvatura de referencia');
% plot(datos_pd.run_data.time,datos_pd.run_data.time*0+1/9.125,'--k','DisplayName','Centro del skidpad')
% plot(datos_pd.run_data.time,datos_pd.run_data.time*0+1/(8.625+1.2/2),'-.b','DisplayName','Límite del skidpad')
% plot(datos_pd.run_data.time,datos_pd.run_data.time*0+1/(9.625-1.2/2),'-.b','DisplayName','Límite del skidpad')
% ylim([1/9.625,1/8.625]);
grid on
legend('show', 'Location', 'best')
xlabel('Tiempo [s]')
ylabel('Curvatura \kappa [1/m]')
set(gca, 'FontSize', 11)

subplot(1,4,4)
plot(datos_pd.run_data.time, k_error_pd, 'r', 'linewidth', 2.5, 'DisplayName', 'PD'); hold on;
plot(datos_mpc.run_data.time, k_error_mpc, 'b', 'linewidth', 2.5, 'DisplayName', 'MPC'); 
grid on
legend('show', 'Location', 'best')
xlabel('Tiempo [s]')
ylabel('Error curvatura \kappa [1/m]')
set(gca, 'FontSize', 11)
title(['RMSE: PD=',num2str(rmse_error_k_pd,2),' MPC=',num2str(rmse_error_k_mpc,2)])

sgtitle('Seguimiento de referencia de curvatura', 'FontSize', 14, 'FontWeight', 'bold');

% ruta_guardado = 'C:\Users\Usuario\Pedro\Universidad\TFG\Figuras\comparativa_curvatura_skidpad_sim.png';
% exportgraphics(gcf, ruta_guardado)


%% Seguimiento de referencia de yaw rate


r_resampled = interp1(datos_pd.run_data.time, datos_pd.run_data.yaw_rate, datos_pd.run_data.time_control, 'pchip');
r_error_pd = abs(r_resampled - datos_pd.run_data.r_ref);
rmse_error_r_pd = sqrt(mean(r_error_pd.^2, 'omitnan'));

r_resampled = interp1(datos_mpc.run_data.time, datos_mpc.run_data.yaw_rate, datos_mpc.run_data.time_control, 'pchip');
r_error_mpc = abs(r_resampled - datos_mpc.run_data.r_ref);
rmse_error_r_mpc = sqrt(mean(r_error_mpc.^2, 'omitnan'));



figure;
x0 = 0; 
y0 = 0; 
screen = get(0,'ScreenSize');
width  = round(screen(3));
height = round(screen(4));
set(gcf, 'position', [x0, y0, width, height], 'Color', 'w')


eje1 = subplot(2, 4, 1:3);
plot(datos_pd.run_data.time_control, datos_pd.run_data.r_ref_og, 'r--', 'linewidth', 2, 'DisplayName', 'Yaw rate objetivo (PD)'); hold on;
plot(datos_pd.run_data.time, datos_pd.run_data.yaw_rate, 'b', 'linewidth', 2.5, 'DisplayName', 'Yaw rate Real'); 

grid on
legend('show', 'Location', 'best')
xlabel('Tiempo [s]')
ylabel('Yaw rate [rad/s]')
title('Controlador PD')
set(gca, 'FontSize', 11)


eje2 = subplot(2, 4, 5:7);
plot(datos_mpc.run_data.time_control, datos_mpc.run_data.r_ref, 'r--', 'linewidth', 2, 'DisplayName', 'Yaw rate Objetivo (MPC)'); hold on;
plot(datos_mpc.run_data.time, datos_mpc.run_data.yaw_rate, 'b', 'linewidth', 2.5, 'DisplayName', 'Yaw rate Real'); 

grid on
legend('show', 'Location', 'best')
xlabel('Tiempo [s]')
ylabel('Yaw rate [rad/s]')
title('Controlador LTV-MPC')
set(gca, 'FontSize', 11)
linkaxes([eje1,eje2],'xy');

subplot(2,4,4)
plot(datos_pd.run_data.time_control, r_error_pd, 'b', 'linewidth', 2.5, 'DisplayName', 'PD');
grid on
legend('show', 'Location', 'best')
xlabel('Tiempo [s]')
ylabel('Error yaw rate [rad/s]')
set(gca, 'FontSize', 11)
title(['RMSE: PD=',num2str(rmse_error_r_pd,2)])

subplot(2,4,8)
plot(datos_mpc.run_data.time_control, r_error_mpc, 'b', 'linewidth', 2.5, 'DisplayName', 'MPC');
grid on
legend('show', 'Location', 'best')
xlabel('Tiempo [s]')
ylabel('Error yaw rate [rad/s]')
set(gca, 'FontSize', 11)
title(['RMSE: MPC=',num2str(rmse_error_r_mpc,2)])

sgtitle('Seguimiento de referencia de yaw rate', 'FontSize', 14, 'FontWeight', 'bold');

% ruta_guardado = 'C:\Users\Usuario\Pedro\Universidad\TFG\Figuras\comparativa_yaw_rate_skidpad_sim.png';
% exportgraphics(gcf, ruta_guardado)


%% Análisis de slalom 

% Parámetros geométricos del slalom
D_cone  = 9.0;
W_track = 3.0;
W_car   = 1.22;
A_path  = (W_track - W_car) / 2; % 0.8 m
w       = pi / D_cone;
k_limit = A_path * w^2;

A_max         = (W_track - W_car) / 2; % ~0.89 m
k_limit_outer = A_max * w^2;

A_min         = W_car / 2;             % 0.61 m
k_limit_inner = A_min * w^2;

% Generación de la referencia ideal basada en la distancia recorrida (X)
x_ideal = linspace(0, max(datos_mpc.run_data.x), 1000);
y_ideal = A_path * sin(w * x_ideal);
dy_dx   = A_path * w * cos(w * x_ideal);
d2y_dx2 = -A_path * w^2 * sin(w * x_ideal);
k_ideal = d2y_dx2 ./ (1 + dy_dx.^2).^(3/2);

x_pd_reesc = interp1(time, datos_pd.run_data.x, datos_pd.run_data.time_control, 'pchip');
x_mpc_reesc = interp1(time, datos_mpc.run_data.x, datos_mpc.run_data.time_control, 'pchip');

% Configuración de la figura
figure;
x0 = 0; 
y0 = 0; 
screen = get(0,'ScreenSize');
width  = round(screen(3));
height = round(screen(4));
set(gcf, 'position', [x0, y0, width, height], 'Color', 'w')

eje1 = subplot(2, 1, 1);
plot(datos_pd.run_data.time, datos_pd.run_data.k_calc, 'r', 'linewidth', 2.5, 'DisplayName', 'Curvatura Real (PD)'); hold on;
plot(datos_mpc.run_data.time, datos_mpc.run_data.k_calc, 'b', 'linewidth', 2.5, 'DisplayName', 'Curvatura Real (MPC)'); 
plot(k_target, 'k--', 'linewidth', 2, 'DisplayName', 'Curvatura de referencia');

% Límite cinemático
plot([0, max(k_target.Time)], [k_limit_outer, k_limit_outer], '-.r', 'linewidth', 1.5, 'DisplayName', 'Límite Exterior (Pista)');
plot([0, max(k_target.Time)], [-k_limit_outer, -k_limit_outer], '-.r', 'linewidth', 1.5, 'HandleVisibility', 'off');

plot([0, max(k_target.Time)], [k_limit_inner, k_limit_inner], ':k', 'linewidth', 1.5, 'DisplayName', 'Límite Interior (Cono)');
plot([0, max(k_target.Time)], [-k_limit_inner, -k_limit_inner], ':k', 'linewidth', 1.5, 'HandleVisibility', 'off');

grid on
legend('show', 'Location', 'northwest')
xlabel('Tiempo [s]')
ylabel('Curvatura [1/m]')
set(gca, 'FontSize', 11)


eje2 = subplot(2, 1, 2);
plot(datos_pd.run_data.time, datos_pd.run_data.yaw_rate, 'r', 'linewidth', 2.5, 'DisplayName', 'Real PD'); hold on;
plot(datos_mpc.run_data.time, datos_mpc.run_data.yaw_rate, 'b', 'linewidth', 2.5, 'DisplayName', 'Real MPC');
plot(datos_pd.run_data.time_control, datos_pd.run_data.r_ref_og, 'g--', 'linewidth', 2.5, 'DisplayName', 'Referencia PD');
plot(datos_mpc.run_data.time_control, datos_mpc.run_data.r_ref, 'k--', 'linewidth', 2.5, 'DisplayName', 'Referencia MPC');

grid on
legend('show', 'Location', 'best')
xlabel('Tiempo [s]')
ylabel('Yaw rate [rad/s]')
set(gca, 'FontSize', 11)
linkaxes([eje1,eje2],'x')

sgtitle('Comparación de Slalom en Aceleración', 'FontSize', 14, 'FontWeight', 'bold');
% ruta_guardado = 'C:\Users\Usuario\Pedro\Universidad\TFG\Figuras\comparativa_slalom_sim.png';
% exportgraphics(gcf, ruta_guardado)


%% Gráfica de los pares de cada rueda

figure;
x0 = 0; 
y0 = 0; 
screen = get(0,'ScreenSize');
width  = round(screen(3));
height = round(screen(4));
set(gcf, 'position', [x0, y0, width, height], 'Color', 'w')


eje1 = subplot(2,1,1);
plot(datos_pd.run_data.time_control, datos_pd.run_data.tv_out(:,1), 'Color','#e41a1c', 'linewidth', 2.5, 'DisplayName', 'FL'); hold on;
plot(datos_pd.run_data.time_control, datos_pd.run_data.tv_out(:,2), 'Color','#377eb8', 'linewidth', 2.5, 'DisplayName', 'FR');
plot(datos_pd.run_data.time_control, datos_pd.run_data.tv_out(:,3), 'Color','#4daf4a', 'linewidth', 2.5, 'DisplayName', 'RL');
plot(datos_pd.run_data.time_control, datos_pd.run_data.tv_out(:,4), 'Color','#984ea3', 'linewidth', 2.5, 'DisplayName', 'RR');

grid on
legend('show', 'Location', 'best')
xlabel('Tiempo [s]')
ylabel('Par [N/m]')
set(gca, 'FontSize', 11)
title('Controlador PD')

eje2 = subplot(2,1,2);
plot(datos_mpc.run_data.time_control, datos_mpc.run_data.tv_out(1,:), 'Color','#e41a1c', 'linewidth', 2.5, 'DisplayName', 'FL'); hold on;
plot(datos_mpc.run_data.time_control, datos_mpc.run_data.tv_out(2,:), 'Color','#377eb8', 'linewidth', 2.5, 'DisplayName', 'FR');
plot(datos_mpc.run_data.time_control, datos_mpc.run_data.tv_out(3,:), 'Color','#4daf4a', 'linewidth', 2.5, 'DisplayName', 'RL');
plot(datos_mpc.run_data.time_control, datos_mpc.run_data.tv_out(4,:), 'Color','#984ea3', 'linewidth', 2.5, 'DisplayName', 'RR');

grid on
legend('show', 'Location', 'best')
xlabel('Tiempo [s]')
ylabel('Par [N/m]')
set(gca, 'FontSize', 11)
title('Controlador LTV-MPC')

linkaxes([eje1,eje2],'x')

sgtitle('Comparación de par comandado', 'FontSize', 14, 'FontWeight', 'bold');
% ruta_guardado = 'C:\Users\Usuario\Pedro\Universidad\TFG\Figuras\comparativa_slalom_par_sim.png';
% exportgraphics(gcf, ruta_guardado)


%% Análisis del Límite de Adherencia: Diagrama G-G-V

% 1. Extracción y conversión de aceleraciones a fuerzas G
ax_pd_g = datos_pd.run_data.ax;
ay_pd_g = datos_pd.run_data.ay;
v_pd    = datos_pd.run_data.vx;

ax_mpc_g = datos_mpc.run_data.ax;
ay_mpc_g = datos_mpc.run_data.ay;
v_mpc    = datos_mpc.run_data.vx;

% Configuración de la figura
figure;
x0 = 0; y0 = 0; 
screen = get(0,'ScreenSize');
width  = round(screen(3));
height = round(screen(4));
set(gcf, 'position', [x0, y0, width, height], 'Color', 'w')


subplot(1, 2, 1)
% Trazadas (Dibujamos PD primero para que el MPC quede por encima si se solapan)
plot(ay_pd_g, ax_pd_g, 'r.', 'linewidth', 1.5, 'DisplayName', 'Real (PD)'); hold on;
plot(ay_mpc_g, ax_mpc_g, 'b.', 'linewidth', 1.5, 'DisplayName', 'Real (MPC)');

grid on; axis equal;
xlabel('Aceleración Lateral a_y [g]')
ylabel('Aceleración Longitudinal a_x [g]')
title('Diagrama G-G (Proyección 2D)')
legend('show', 'Location', 'best')
set(gca, 'FontSize', 11)


subplot(1, 2, 2)

plot3(ay_pd_g, ax_pd_g, v_pd, 'r.', 'linewidth', 1.5, 'DisplayName', 'Evolución PD'); hold on;
plot3(ay_mpc_g, ax_mpc_g, v_mpc, 'b.', 'linewidth', 1.5, 'DisplayName', 'Evolución MPC');

grid on;
xlabel('Aceleración Lateral a_y [g]')
ylabel('Aceleración Longitudinal a_x [g]')
zlabel('Velocidad v_x [m/s]')
title('Diagrama G-G-V 3D')
legend('show', 'Location', 'best')
set(gca, 'FontSize', 11)

% Ajuste de cámara inicial (puedes rotarla con el ratón luego en MATLAB)
view(-45, 25); 

sgtitle('Diagrama G-G-V', 'FontSize', 14, 'FontWeight', 'bold');
% ruta_guardado = 'C:\Users\Usuario\Pedro\Universidad\TFG\Figuras\comparativa_ggv_sim.png';
% exportgraphics(gcf, ruta_guardado)


%% Análisis de Comportamiento: Ángulo de Dirección vs Aceleración Lateral

ay_pd_g = datos_pd.run_data.ay;
steer_pd_deg = datos_pd.run_data.steer * (180 / pi); 

ay_mpc_g = datos_mpc.run_data.ay;
steer_mpc_deg = datos_mpc.run_data.steer * (180 / pi);


figure;
x0 = 100; y0 = 100; 
screen = get(0,'ScreenSize');
width  = round(screen(3) * 0.6); % Un poco más estrecha para mantener la proporción
height = round(screen(4) * 0.7);
set(gcf, 'position', [x0, y0, width, height], 'Color', 'w')


hold on; grid on;

scatter(ay_pd_g, steer_pd_deg, 15, 'r', 'filled', 'DisplayName', 'Evolución PD');
scatter(ay_mpc_g, steer_mpc_deg, 15, 'b', 'filled', 'DisplayName', 'Evolución MPC');
plot(ay_pd_g,ay_pd_g, 'k','linewidth', 1.5, 'HandleVisibility', 'off')

xlabel('Aceleración Lateral a_y [g]')
ylabel('Ángulo de Dirección \delta [deg]')
legend('show', 'Location', 'northwest')
set(gca, 'FontSize', 11)

sgtitle('Understeer Gradient', 'FontSize', 14, 'FontWeight', 'bold');
% ruta_guardado = 'C:\Users\Usuario\Pedro\Universidad\TFG\Figuras\comparativa_subviraje.png';
% exportgraphics(gcf, ruta_guardado)

%% 











