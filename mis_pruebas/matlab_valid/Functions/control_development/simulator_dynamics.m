function [dx, out_dyn, out_tires] = simulator_dynamics(dv_vec, x, delta_cmd, wheel_torque, param,pac)

% Nonlinear vehicle model
%   Input: u = [delta_cmd, wheel_torque]
%   State: 7x1  x
%       x(1) = vx [m/s]
%       x(2) = vy [m/s]
%       x(3) = yaw_rate [rad/s]
%       x(4) = wheel_speed_FL [rad/s]
%       x(5) = wheel_speed_FR [rad/s]
%       x(6) = wheel_speed_RL [rad/s]
%       x(7) = wheel_speed_RR [rad/s]

dx = zeros(7,1);

%% Initial state
vx = x(1);
vy = x(2);
yaw_rate = x(3);
wheel_speed = x(4:7);

beta = atan(vy/(vx + eps));
dvx = dv_vec(1);
dvy = dv_vec(2);
d_beta = 0*1/(1+(vy/(vx+eps))^2) * (dvx*vx - dvy*vy)/ (vx^2+eps);

ax = dvx - vy * (yaw_rate + d_beta);
ay = dvy + vx * (yaw_rate + d_beta);

%% Tire calculations

delta = calculate_steering(delta_cmd, param);

vx_wheel = vx * ones(4,1) + yaw_rate / 2 * [-param.trackwidthF; param.trackwidthF; -param.trackwidthR; param.trackwidthR];
vy_wheel = vy * ones(4,1) + yaw_rate * [param.lf; param.lf; -param.lr; -param.lr];

vx_wheel_tire = vx_wheel .* cos(delta) + vy_wheel .* sin(delta);

slip_angle = atan2(vy_wheel, vx_wheel) - delta;
slip_ratio = param.rdyn * wheel_speed ./ (vx_wheel_tire + eps) - 1;

tire_load = calculate_tire_loads(ax,ay,vx,param);
[force_fy_tires, force_fx_tires] = calculate_tire_forces(tire_load,slip_angle, slip_ratio,pac);

force_fx = force_fx_tires .* cos(delta) - force_fy_tires .* sin(delta);
force_fy = force_fx_tires .* sin(delta) + force_fy_tires .* cos(delta);

fx_total = sum(force_fx) - 0.5*param.rho*param.CDA*vx^2;
yaw_moment = (force_fy(1) + force_fy(2)) * param.lf ...
            - (force_fy(3) + force_fy(4)) * param.lr ...
            + (force_fx(2) - force_fx(1))* param.trackwidthF / 2 ...
            + (force_fx(4) - force_fx(3))* param.trackwidthR / 2;

%% ODE definition

dx(1) = fx_total / param.mass + yaw_rate * vy;
dx(2) = sum(force_fy) / param.mass - yaw_rate * vx;
dx(3) = yaw_moment / param.Iz;

dx(4) = (wheel_torque(1) - param.rdyn*force_fx_tires(1)) / param.wheel_inertia;
dx(5) = (wheel_torque(2) - param.rdyn*force_fx_tires(2)) / param.wheel_inertia;
dx(6) = (wheel_torque(3) - param.rdyn*force_fx_tires(3)) / param.wheel_inertia;
dx(7) = (wheel_torque(4) - param.rdyn*force_fx_tires(4)) / param.wheel_inertia;

%% Internal state logging

out_tires = [slip_angle; slip_ratio; tire_load; force_fy_tires; force_fx_tires];

out_dyn = [beta; d_beta; yaw_moment];