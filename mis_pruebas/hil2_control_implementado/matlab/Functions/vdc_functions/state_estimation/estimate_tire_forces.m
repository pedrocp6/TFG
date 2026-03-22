function [F_wx, F_wy, F_wz] = estimate_tire_forces(sensors, param, v, T, alpha)
m = param.mass;
Iw = param.wheel_inertia;
gr = param.gear_ratio;

ax_IMU = sensors.IMU.ax;
ay_IMU = sensors.IMU.ay;

%% Calculate tire forces
F_wz = calculate_tire_loads_vdc(ax_IMU, ay_IMU, v, param);

F_wx = (gr*T - Iw*alpha)/param.rdyn;
mu =  (sum(F_wx) - m*ax_IMU - 0.5*param.rho*param.CDA*v*v)/sum(F_wz);
F_wx = F_wx - mu*F_wz;

weight_transfer = F_wz / sum(F_wz);
F_wy = weight_transfer .* (m*ay_IMU);

end

