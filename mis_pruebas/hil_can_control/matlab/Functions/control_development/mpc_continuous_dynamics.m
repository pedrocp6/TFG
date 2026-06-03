% function [Ac, Bc] = mpc_continuous_dynamics(x,delta_cmd,wheel_torque,param_vdc,pac,sensors)
% 
% % Definimos valores instantáneos de las variables
% vx = x(1);
% vy = x(2);
% yaw_rate = x(3);
% % wheel_torque = [0 0 0 0]';
% 
% % Definimos el estado actual y la actuación actual
% x_k = [vx; vy; yaw_rate];
% u_k = wheel_torque;
% 
% % Tamaños del sistema reducido para el MPC
% nx = 3;
% nu = 4;
% 
% Ac = zeros(nx, nx);
% Bc = zeros(nx, nu);
% 
% % Definimos el valor de los sensores y su matriz
% % sensors = zeros(8,1);
% 
% wheel_speed = [sensors.encoder.wFL; sensors.encoder.wFR; sensors.encoder.wRL; sensors.encoder.wRR];
% % delta_cmd = 0;
% dvx = sensors.IMU.ax;
% dvy = sensors.IMU.ay;
% 
% sensors_in = [wheel_speed; delta_cmd; dvx; dvy];
% 
% % Paso de perturbación (un valor muy pequeño pero mayor a epsilon)
% delta = 1e-5;
% 
% 
% for j = 1:nx
%     x_plus = x_k;
%     x_plus(j) = x_plus(j) + delta;
%     
%     dx_plus = f_dynamics(x_plus, u_k, sensors_in, param_vdc, pac); 
%     
%     x_minus = x_k;
%     x_minus(j) = x_minus(j) - delta;
%     dx_minus = f_dynamics(x_minus, u_k, sensors_in, param_vdc, pac);
%     
%     Ac(:, j) = (dx_plus - dx_minus) / (2 * delta);
% end
% 
% 
% for j = 1:nu
%     u_plus = u_k;
%     u_plus(j) = u_plus(j) + delta;
%     dx_plus = f_dynamics(x_k, u_plus, sensors_in, param_vdc, pac);
%     
%     u_minus = u_k;
%     u_minus(j) = u_minus(j) - delta;
%     dx_minus = f_dynamics(x_k, u_minus, sensors_in, param_vdc, pac);
%     
%     Bc(:, j) = (dx_plus - dx_minus) / (2 * delta);
% end
% 
% % Ac
% % 
% % Bc
% 
% end
