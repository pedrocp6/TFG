%% Get test data
clear
simulation_setup
clc
close all

data = Protocolo_Carga_PC('can0_candump_2025-07-22_21-40-39(corrida_manual_2).txt');
idx = 1:247000;
% data = Protocolo_Carga_PC('can0_candump_2025-08-22_13-40-20(acceleration_manual).txt');
% idx=990100:1356000;
[tiempo_unique, idx_unique] = unique(data.tiempo(idx));
idx = idx(idx_unique);
tiempo = data.tiempo;

m = sum(data.vxGSS(idx).*data.vyGSS(idx))/sum(data.vxGSS(idx).^2);
gssAngle = atan(m);
vx = cos(gssAngle)*data.vxGSS + sin(gssAngle)*data.vyGSS;
vy = cos(gssAngle)*data.vyGSS - sin(gssAngle)*data.vxGSS;
figure
plot(data.vxGSS(idx), data.vyGSS(idx))
hold on
plot(data.vxGSS(idx), m*data.vxGSS(idx))
plot(vx(idx), vy(idx))
legend({'Original data', 'Linear regression', 'Rotated data'})
data.vxGSS  = vx;
data.vyGSS = vy;
data.SlipAngle = atan2(data.vyGSS, data.vxGSS);

extensometer_calibration(data);
param.mass = 340;
param.rdyn =  0.24;

dt = 0.005;
time_inst = tiempo(idx(1)):dt:tiempo(idx(end));
n = length(time_inst);

delta = zeros(length(idx), 4);
for i=1:length(idx)
    delta_ack = calculate_steering(data.steer(idx(i)), param);
    delta(i,:) = delta_ack';
end

vx_FL_teorica = interp1(tiempo(idx), data.vxGSS(idx).*cos(delta(:,1)) + data.vyGSS(idx).*sin(delta(:,1)) ...
    + (-0.5*param.trackwidthR*cos(delta(:,1))+param.lf*sin(delta(:,1))).*data.yawRateGSS(idx), time_inst);
vy_FL_teorica = interp1(tiempo(idx), data.vyGSS(idx).*cos(delta(:,1)) - data.vxGSS(idx).*sin(delta(:,1)) ...
    + (0.5*param.trackwidthR*sin(delta(:,1))+param.lf*cos(delta(:,1))).*data.yawRateGSS(idx), time_inst);
wFL = interp1(tiempo(idx), data.wFL(idx), time_inst);
srFL = (param.rdyn*wFL)./(vx_FL_teorica + eps) - 1;
saFL = atan2(vy_FL_teorica, vx_FL_teorica);

vx_FR_teorica = interp1(tiempo(idx), data.vxGSS(idx).*cos(delta(:,1)) + data.vyGSS(idx).*sin(delta(:,1)) ...
    + (0.5*param.trackwidthR*cos(delta(:,1))+param.lf*sin(delta(:,1))).*data.yawRateGSS(idx), time_inst);
vy_FR_teorica = interp1(tiempo(idx), data.vyGSS(idx).*cos(delta(:,1)) - data.vxGSS(idx).*sin(delta(:,1)) ...
    + (-0.5*param.trackwidthR*sin(delta(:,1))+param.lf*cos(delta(:,1))).*data.yawRateGSS(idx), time_inst);
wFR = interp1(tiempo(idx), data.wFR(idx), time_inst);
srFR = (param.rdyn*wFR)./(vx_FR_teorica + eps) - 1;
saFR = atan2(vy_FR_teorica, vx_FR_teorica);

vx_RL_teorica = interp1(tiempo(idx), data.vxGSS(idx)-0.5*param.trackwidthR*data.yawRateGSS(idx), time_inst);
vy_RL_teorica = interp1(tiempo(idx), data.vyGSS(idx)-param.lr*data.yawRateGSS(idx), time_inst);
wRL = interp1(tiempo(idx), data.wRL(idx), time_inst);
srRL = (param.rdyn*wRL - vx_RL_teorica)./(vx_RL_teorica + eps);
saRL = atan2(vy_RL_teorica, vx_RL_teorica);

vx_RR_teorica = interp1(tiempo(idx), data.vxGSS(idx)+0.5*param.trackwidthR*data.yawRateGSS(idx), time_inst);
vy_RR_teorica = vy_RL_teorica;
wRR = interp1(tiempo(idx), data.wRR(idx), time_inst);
srRR = (param.rdyn*wRR - vx_RR_teorica)./(vx_RR_teorica + eps) - 1;
saRR = atan2(vy_RR_teorica, vx_RR_teorica);

for i=1:n
    if(abs(wFL(i))>500)
        if(i>1)
            wFL(i) = wFL(i-1);
        else
            wFL(i) = 0;
        end
    end

    if(abs(wFR(i))>500)
        if(i>1)
            wFR(i) = wFR(i-1);
        else
            wFR(i) = 0;
        end
    end

    if(abs(wRL(i))>500)
        if(i>1)
            wRL(i) = wRL(i-1);
        else
            wRL(i) = 0;
        end
    end

    if(abs(wRR(i))>500)
        if(i>1)
            wRR(i) = wRR(i-1);
        else
            wRR(i) = 0;
        end
    end
end

yaw_rate = interp1(tiempo(idx), data.yawRateGSS(idx), time_inst);
ax = interp1(tiempo(idx), data.axGSS(idx), time_inst);
ay = interp1(tiempo(idx), data.ayGSS(idx), time_inst);
vx = interp1(tiempo(idx), data.vxGSS(idx), time_inst);
vy = interp1(tiempo(idx), data.vyGSS(idx), time_inst);
v = interp1(tiempo(idx), sqrt(data.vxGSS(idx).^2+data.vyGSS(idx).^2), time_inst);
beta = atan2(vy, vx);

T_FL = interp1(tiempo(idx), data.TcmdFL(idx), time_inst);
T_FR = interp1(tiempo(idx), data.TcmdFR(idx), time_inst);
T_RL = interp1(tiempo(idx), data.TcmdRL(idx), time_inst);
T_RR = interp1(tiempo(idx), data.TcmdRR(idx), time_inst);

steer = interp1(tiempo(idx), data.steer(idx), time_inst);
delta = zeros(n, 4);
for i=1:n
    delta_ack = calculate_steering(steer(i), param_vdc);
    delta(i,:) = delta_ack';
end

%%  HOT FIX
srFL = srFL-0.025;
srFR = srFR-0.025;
srRL = srRL-0.025;
srRR = srRR-0.025;

saFL = saFL+0.01;
saFR = saFR+0.01;
saRL = saRL+0.01;
saRR = saRR+0.01;

%% STATE ESTIMATION WITH GSS
x_est = zeros(n,3);
sr_est = zeros(n,4);
sa_est = zeros(n,4);

P_est = 0.1*ones(3,3);

x_est(1,:) = [vx(1), vy(1), yaw_rate(1)];
u = [ax(1); steer(1)];
sr_est(1,:) = [srFL(1),srFR(1),srRL(1),srRR(1)];
sa_est(1,:) = [saFL(1),saFR(1),saRL(1),saRR(1)];

% Tire cornering stiffness
cf = 26*1e3;
cr = 24*1e3;

tf = param.trackwidthF;
tr = param.trackwidthR;
lf = param.lf;
lr = param.lr;
r = param.rdyn;

% Process covariance matrix
Q = diag([0.025, 0.005, 0.01]);

% Measurement covariance matrix
R = diag([0.01, 0.005, 0.002]);

for i=2:n
    % Kalman model matrices
    % Transition matrix
    vx_prev = x_est(i-1,1);

    if(vx_prev < param_vdc.vx_threshold)
        A = eye(3);
    else
        A = eye(3) + dt * [0, 0, 0;
                        0, -(cf + cr) / (param.mass * vx_prev), ...
                            (param.lr * cr - param.lf * cf) / (param.mass * vx_prev) - vx_prev;
                        0, (param.lr * cr - param.lf * cf) / (param.Iz * vx_prev), ...
                            -(param.lf^2 * cf + param.lr^2 * cr) / (param.Iz * vx_prev)];   
    end
    
    % Control matrix
    B = [1, 0;
         0, cf / param.mass;
         0, cf * param.lf / param.Iz];
    
    % Observation matrix
    H = eye(3);

    % State prediction
    x_pred = A * x_est(i-1,:)' + dt * B * u;
    P_pred = A * P_est * A' + Q;
    
    % Measurement prediciton
    z = [vx(i); vy(i); yaw_rate(i)];
    z_pred = H * x_pred;
    
    % Kalman gain
    K = P_pred * H' / (H * P_pred * H' + R);

    x_est(i,:) = x_pred + K * (z - z_pred);
    P_est = (eye(3) - K * H) * P_pred;
    
    % Control vector update
    u = [ax(i); steer(i)];


    % Combine direct formula and TMEasy inverse
    Tr = [cos(delta(i,1)),  sin(delta(i,1)), -0.5*tf*cos(delta(i,1)) + lf*sin(delta(i,1));
        cos(delta(i,2)),   sin(delta(i,2)), 0.5*tf*cos(delta(i,2)) + lf*sin(delta(i,2));
        1,            0,          -0.5*tr;
        1,            0,          0.5*tr;
        -sin(delta(i,1)),  cos(delta(i,1)), lf*cos(delta(i,1)) + 0.5*tf*sin(delta(i,1));
        -sin(delta(i,2)),  cos(delta(i,2)), lf*cos(delta(i,2)) - 0.5*tf*sin(delta(i,2));
        0,            1,          -lr;
        0,            1,          -lr];
    
    
    v_w = Tr * x_est(i-1,:)';
    v_wx = v_w(1:4);
    v_wy = v_w(5:8);
    w = [wFL(i); wFR(i); wRL(i); wRR(i)];
    % w = [wRL(i); wRR(i); wRL(i); wRR(i)];    
    
    sr = r * w ./ (v_wx + eps) - 1;
    
    sr_est(i,:) = sr;
    sa_est(i,:) = atan2(v_wy, v_wx);
end

x_est_GSS = x_est;
sr_est_GSS = sr_est;

%% ESTIMATION WITHOUT GSS
Fx = zeros(n,4);
Fy = zeros(n,4);
Fz = zeros(n,4);

x_est = zeros(n,3);
sr_est = zeros(n,4);
sa_est = zeros(n,4);

P_est = 0.1*ones(3,3);

x_est(1,:) = [vx(1), vy(1), yaw_rate(1)];
u = [ax(1); steer(1)];
sr_est(1,:) = [srFL(1),srFR(1),srRL(1),srRR(1)];
sa_est(1,:) = [saFL(1),saFR(1),saRL(1),saRR(1)];

% Process covariance matrix
Q = diag([0.025, 0.01, 0.01]);

% Measurement covariance matrix
R = diag([0.015*ones(1,4), 0.05*ones(1,2), 0.025*ones(1,2), 0.002]);
% R = diag([0.035*ones(1,2), 0.0015*ones(1,2), 0.002]);

for i=2:n
    x_prev = x_est(i-1,:)';
    v_prev = sqrt(x_prev(1)^2 + x_prev(2)^2);
    w = [wFL(i); wFR(i); wRL(i); wRR(i)];
    w_prev = [wFL(i-1); wFR(i-1); wRL(i-1); wRR(i-1)];
    % w = [wRL(i); wRR(i); wRL(i); wRR(i)];
    % w_prev = [wRL(i-1); wRR(i-1); wRL(i-1); wRR(i-1)];
    alpha = (w - w_prev)/dt;

    F_wz = calculate_tire_loads_vdc(ax(i), ay(i), v_prev, param);

    weight_transfer = F_wz / sum(F_wz);
    F_wy = weight_transfer .* (param.mass*ay(i) + .5*param.rho*param.CDA*v_prev*v_prev*sin(beta(i)));

    T = [T_FL(i); T_FR(i); T_RL(i); T_RR(i)];
    F_wx = (param.gear_ratio*T - param.wheel_inertia*alpha)/param.rdyn;
    Fx_total = cos(delta(i,1))*F_wx(1) + cos(delta(i,2))*F_wx(2) + F_wx(3) + F_wx(4) ...
        -sin(delta(i,1))*F_wy(1) - sin(delta(i,2))*F_wy(2);
    mu =  (Fx_total - param.mass*ax(i) - 0.5*param.rho*param.CDA*v_prev*v_prev*cos(beta(i)))/sum(F_wz);
    F_wx = F_wx - mu*F_wz;
    
    Fx(i,:) = F_wx; Fy(i,:) = F_wy; Fz(i,:) = F_wz;

    [sr_TME, sa] = TMEasy_inverse_model(F_wx, F_wy, F_wz, sr_est(i-1,:)', sa_est(i-1,:)',false);

    v_wx = (w*param.rdyn) ./ (sr_TME + 1);
    v_wy = tan(sa) .* v_wx; 

    % Transition matrix
    vx_prev = x_prev(1);
    
    if(vx_prev < param_vdc.vx_threshold)
        A = eye(3);
    else
        A = eye(3) + dt * [0, 0, 0;
                        0, -(cf + cr) / (param.mass * vx_prev), ...
                            (param.lr * cr - param.lf * cf) / (param.mass * vx_prev) - vx_prev;
                        0, (param.lr * cr - param.lf * cf) / (param.Iz * vx_prev), ...
                            -(param.lf^2 * cf + param.lr^2 * cr) / (param.Iz * vx_prev)];   
    end    
    
    % Control matrix
    B = [1, 0;
         0, cf / param.mass;
         0, cf * param.lf / param.Iz];
    
    % Observation matrix
    H = [cos(delta(i,1)),  sin(delta(i,1)), -0.5*param.trackwidthF*cos(delta(i,1)) + param.lf*sin(delta(i,1));
        cos(delta(i,2)),   sin(delta(i,2)), 0.5*param.trackwidthF*cos(delta(i,2)) + param.lf*sin(delta(i,2));
        1,            0,          -0.5*param.trackwidthR;
        1,            0,          0.5*param.trackwidthR;
        -sin(delta(i,1)),  cos(delta(i,1)), param.lf*cos(delta(i,1)) + 0.5*param.trackwidthF*sin(delta(i,1));
        -sin(delta(i,2)),  cos(delta(i,2)), param.lf*cos(delta(i,2)) - 0.5*param.trackwidthF*sin(delta(i,2));
        0,            1,          -param.lr;
        0,            1,          -param.lr;
        0,            0,          1];

    % State prediction
    x_pred = A * x_prev + dt * B * u;
    P_pred = A * P_est * A' + Q;
    
    % Measurement prediciton
    z = [v_wx; v_wy; yaw_rate(i)];
    % z = [v_wx(3:4); v_wy(3:4); yaw_rate(i)];
    z_pred = H * x_pred;
    
    % Kalman gain
    K = P_pred * H' / (H * P_pred * H' + R);

    % State estimation
    x_est(i,:) = x_pred + K * (z - z_pred);
    P_est = (eye(3) - K * H) * P_pred;

    z_est = H * x_est(i,:)';
    v_wx = z_est(1:4);
    % v_wx = [z_est(1:2);z_est(1:2)];    

    for j=1:4
    % for j=3:4
        if(abs(sr_est(i-1,j)) >= 0.02)
            sr_TME(j) = (param.rdyn*w(j) - v_wx(j))./ (v_wx(j) + eps);
        end
    end

    sr_est(i,:) = sr_TME;
    sa_est(i,:) = sa;
end

x_est_TME = x_est;
sr_est_TME = sr_est;

%% COMPARE RESULTS
figure
legend_entries = cell(1,3);
legend_entries{1} = '$v_x$ from GSS';
legend_entries{2} = '$v_{x,est}$ with GSS';
legend_entries{3} = '$v_{x,est}$ without GSS';
plot(time_inst-time_inst(1), vx)
hold on
plot(time_inst-time_inst(1), x_est_GSS(:,1))
plot(time_inst-time_inst(1), x_est_TME(:,1))
legend(legend_entries,'Interpreter', 'latex', 'FontSize', 10, 'Location','northeast');
title('$v_x$ estimation', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Time (s)', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Longitudinal velocity (m/s)', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor

figure
legend_entries = cell(1,3);
legend_entries{1} = '$v_y$ from GSS';
legend_entries{2} = '$v_{y,est}$ with GSS';
legend_entries{3} = '$v_{y,est}$ without GSS';
plot(time_inst-time_inst(1), vy)
hold on
plot(time_inst-time_inst(1), x_est_GSS(:,2))
plot(time_inst-time_inst(1), x_est_TME(:,2))
legend(legend_entries,'Interpreter', 'latex', 'FontSize', 10, 'Location','northeast');
title('$v_y$ estimation', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Time (s)', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Lateral velocity (m/s)', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor

figure
legend_entries = cell(1,3);
legend_entries{1} = '$\omega_z$ from GSS';
legend_entries{2} = '$\omega_{z,est}$ with GSS';
legend_entries{3} = '$\omega_{z,est}$ without GSS';
plot(time_inst-time_inst(1), yaw_rate)
hold on
plot(time_inst-time_inst(1), x_est_GSS(:,3))
plot(time_inst-time_inst(1), x_est_TME(:,3))
legend(legend_entries,'Interpreter', 'latex', 'FontSize', 10, 'Location','northeast');
title('$\omega_z$ estimation', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Time (s)', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Yaw rate (rad/s)', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor

figure
legend_entries = cell(1,3);
legend_entries{1} = '$sr_{RL}$ calculated';
legend_entries{2} = '$sr_{RL,est}$ with GSS';
legend_entries{3} = '$sr_{RL,est}$ without GSS';
plot(time_inst-time_inst(1), srRL)
hold on
plot(time_inst-time_inst(1), sr_est_GSS(:,3)+0.03)
plot(time_inst-time_inst(1), sr_est_TME(:,3))
legend(legend_entries,'Interpreter', 'latex', 'FontSize', 10, 'Location','northeast');
title('Slip ratio estimation', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Time (s)', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Slip ratio', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor

%% Compute error metrics
clc

x_real = [vx', vy', yaw_rate'];
error = x_real - [x_est(:,1), x_est(:,2), x_est(:,3)];

% Min / Max error
error_min = min(abs(error));
error_max = max(abs(error));

% Mean square error
mse = mean(error.*error);

% Standard deviation
std = sqrt(mse);
std_pct = sqrt(mean(error.*error ./ abs(x_real) * 100));

disp('Speed estimation errors:');
fprintf(['v_x:\n\tMin error: %f \n\tMax error: %f \n\tMean Square Error: %f ' ...
    '\n\tStandard Deviation: %f / %.2f%% \n'], error_min(1), error_max(1), mse(1), std(1), std_pct(1));
fprintf(['v_y:\n\tMin error: %f \n\tMax error: %f \n\tMean Square Error: %f ' ...
    '\n\tStandard Deviation: %f / %.2f%% \n'], error_min(2), error_max(2), mse(2), std(2), std_pct(2));
fprintf(['w_z:\n\tMin error: %f \n\tMax error: %f \n\tMean Square Error: %f ' ...
    '\n\tStandard Deviation: %f / %.2f%% \n\n'], error_min(3), error_max(3), mse(3), std(3), std_pct(3));

sr_reference = [srFL', srFR', srRL', srRR'];
error = sr_reference - sr_est;

% Min / Max error
error_min = min(abs(error));
error_max = max(abs(error));

% Mean square error
mse = mean(error.*error);

% Standard deviation
std = sqrt(mse);
std_pct = sqrt(mean(error.*error ./ abs(sr_reference) * 100));

disp('Slip ratio estimation errors:');
fprintf(['FL:\n\tMin error: %f \n\tMax error: %f \n\tMean Square Error: %f ' ...
    '\n\tStandard Deviation: %f / %.2f%% \n'], error_min(1), error_max(1), mse(1), std(1), std_pct(1));
fprintf(['FR:\n\tMin error: %f \n\tMax error: %f \n\tMean Square Error: %f ' ...
    '\n\tStandard Deviation: %f / %.2f%% \n'], error_min(2), error_max(2), mse(2), std(2), std_pct(2));
fprintf(['RL:\n\tMin error: %f \n\tMax error: %f \n\tMean Square Error: %f ' ...
    '\n\tStandard Deviation: %f / %.2f%% \n'], error_min(3), error_max(3), mse(3), std(3), std_pct(3));
fprintf(['RR:\n\tMin error: %f \n\tMax error: %f \n\tMean Square Error: %f ' ...
    '\n\tStandard Deviation: %f / %.2f%% \n'], error_min(4), error_max(4), mse(4), std(4), std_pct(4));