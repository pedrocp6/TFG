function [dvx,dvy,dr,Ad,Bd, force_fx_tires, force_fy_tires] = mpc_dynamics_validation(x, wheel_torque, param_vdc, pac, sensors)

% Definimos valores instantáneos de las variables
vx = x.vx;
vy = x.vy;
yaw_rate = x.r;

% Definimos el estado actual y la actuación actual
x_k = [vx; vy; yaw_rate];
u_k = wheel_torque;

% Tamaños del sistema reducido para el MPC
nx = 3;
nu = 4;

Ac = zeros(nx, nx);
Bc = zeros(nx, nu);
Ad = zeros(nx, nx);
Bd = zeros(nx, nu);

% Definimos el valor de los sensores y su matriz
wheel_speed = [sensors.encoder.wFL; sensors.encoder.wFR; sensors.encoder.wRL; sensors.encoder.wRR];
dvx = sensors.IMU.ax;
dvy = sensors.IMU.ay;
delta_cmd = sensors.ext.steering;
vx_fijo = sensors.gss.vx;
sensors_in = [wheel_speed; delta_cmd; dvx; dvy; vx_fijo];

% Paso de perturbación (un valor muy pequeño pero mayor a epsilon)
delta = 1e-5;

for j = 1:nx
    x_plus = x_k;
    x_plus(j) = x_plus(j) + delta;
    dx_plus = f_dynamics(x_plus, u_k, sensors_in, param_vdc, pac, 0); 
    x_minus = x_k;
    x_minus(j) = x_minus(j) - delta;
    dx_minus = f_dynamics(x_minus, u_k, sensors_in, param_vdc, pac, 0);
    Ac(:, j) = (dx_plus - dx_minus) / (2 * delta);
end
for j = 1:nu
    u_plus = u_k;
    u_plus(j) = u_plus(j) + delta;
    dx_plus = f_dynamics(x_k, u_plus, sensors_in, param_vdc, pac, 0);
    u_minus = u_k;
    u_minus(j) = u_minus(j) - delta;
    dx_minus = f_dynamics(x_k, u_minus, sensors_in, param_vdc, pac, 0);
    Bc(:, j) = (dx_plus - dx_minus) / (2 * delta);
end

u_k = wheel_torque;

% x_k = [sensors.gss.vx; sensors.gss.vy; sensors.gss.r];
x_k = [vx; vy; yaw_rate];

M = expm([Ac, Bc; zeros(nu, nx+nu)] .* 0.0050);
Ad = M(1:nx, 1:nx);
Bd = M(1:nx, nx+1:end);

% En lugar de expm:
% Ad = eye(nx) + Ac .* 0.0050;
% Bd = Bc .* 0.0050;

% Predicción a un paso
x_out = Ad * x_k + Bd * u_k;

% wheel_speed = [x.wFL; x.wFR; x.wRL; x.wRR];
% dvx = x.ax;
% dvy = x.ay;
% delta_cmd = sensors.ext.steering;
% sensors_in = [wheel_speed; delta_cmd; dvx; dvy];

% dx_real_k = f_dynamics(x_k, u_k, sensors_in, param_vdc, pac, 0);
% 
% x_out = x_k + dx_real_k * 0.005;

dvx = x_out(1);
dvy = x_out(2);
dr = x_out(3);

[~, force_fx_tires, force_fy_tires] = f_dynamics(x_k, u_k, sensors_in, param_vdc, pac, 0);

end