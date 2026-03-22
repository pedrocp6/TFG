%% Run simulation
clc;
launch_simulation;

%% Validate speed estimation
%% Plot results
x_est = out.estimated_state.Data;
x_est = x_est(:, 3:end);
t_est = out.estimated_state.Time;
t_est = t_est(3:end);

vx_sim = interp1(time, vx, t_est);
vy_sim = interp1(time, vy, t_est);
wz_sim = interp1(time, yaw_rate, t_est);

close all;
legend_entries = cell(1,2);

figure
plot(t_est, x_est(1,:));
hold on
plot(t_est, vx_sim);
hold off
legend_entries{1} = '$v_x$ estimated';
legend_entries{2} = 'Reference';
legend(legend_entries, 'Interpreter', 'latex', 'FontSize', 10, 'Location','northeast');
title('$v_x$ estimation', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Time (s)', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Longitudinal speed (m/s)', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor
hold off

figure
plot(t_est, x_est(2,:));
hold on
plot(t_est, vy_sim);
legend_entries{1} = '$v_y$ estimated';
legend(legend_entries, 'Interpreter', 'latex', 'FontSize', 10, 'Location','northeast');
title('$v_y$ estimation', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Time (s)', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Lateral speed (m/s)', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor
hold off

figure
plot(t_est, x_est(3,:));
hold on
plot(t_est, wz_sim);
legend_entries{1} = '$\omega_z$ estimated';
legend_entries{2} = 'Reference';
legend(legend_entries, 'Interpreter', 'latex', 'FontSize', 10, 'Location','northeast');
title('$\omega_z$ estimation', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Time (s)', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Yaw rate (rad/s)', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor
hold off

%% Compute error metrics
x_sim = [vx_sim, vy_sim, wz_sim];
error = x_sim - [x_est(1,:)', x_est(2,:)', x_est(3,:)'];

% Min / Max error
error_min = min(abs(error));
error_max = max(abs(error));

% Mean square error
mse = mean(error.*error);

% Standard deviation
std = sqrt(mse);
std_pct = sqrt(mean(error.*error ./ abs(x_sim) * 100));

disp('Speed estimation errors:');
fprintf(['v_x:\n\tMin error: %f \n\tMax error: %f \n\tMean Square Error: %f ' ...
    '\n\tStandard Deviation: %f / %.2f%% \n'], error_min(1), error_max(1), mse(1), std(1), std_pct(1));
fprintf(['v_y:\n\tMin error: %f \n\tMax error: %f \n\tMean Square Error: %f ' ...
    '\n\tStandard Deviation: %f / %.2f%% \n'], error_min(2), error_max(2), mse(2), std(2), std_pct(2));
fprintf(['w_z:\n\tMin error: %f \n\tMax error: %f \n\tMean Square Error: %f ' ...
    '\n\tStandard Deviation: %f / %.2f%% \n\n'], error_min(3), error_max(3), mse(3), std(3), std_pct(3));



%% Validate slip ratio estimation
%% Plot results
sr_out = out.sr_est.Data;
sr_est = [sr_out(1,3:end)', sr_out(2,3:end)', sr_out(3,3:end)', sr_out(4,3:end)'];

sr_sim = out.tire_bus.signals.values(:,5:8);
t_est_sr = out.sr_est.Time(3:end);
sr_reference = interp1(time, sr_sim, t_est_sr);

figure;
plot(t_est_sr, sr_est(:,1));
hold on
plot(t_est_sr, sr_reference(:,1));
legend_entries{1} = '$\lambda_{FL}$ estimated';
legend_entries{2} = 'Reference';
legend(legend_entries, 'Interpreter', 'latex', 'FontSize', 10, 'Location','northeast');
title('$\lambda_{FL}$ estimation', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Time (s)', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Slip ratio', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor
hold off

figure;
plot(t_est_sr, sr_est(:,2));
hold on
plot(t_est_sr, sr_reference(:,2));
legend_entries{1} = '$\lambda_{FR}$ estimated';
legend(legend_entries, 'Interpreter', 'latex', 'FontSize', 10, 'Location','northeast');
title('$\lambda_{FR}$ estimation', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Time (s)', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Slip ratio', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor
hold off

figure;
plot(t_est_sr, sr_est(:,3));
hold on
plot(t_est_sr, sr_reference(:,3));
legend_entries{1} = '$\lambda_{RL}$ estimated';
legend(legend_entries, 'Interpreter', 'latex', 'FontSize', 10, 'Location','northeast');
title('$\lambda_{RL}$ estimation', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Time (s)', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Slip ratio', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor
hold off

figure;
plot(t_est_sr, sr_est(:,4));
hold on
plot(t_est_sr, sr_reference(:,4));
legend_entries{1} = '$\lambda_{RR}$ estimated';
legend(legend_entries, 'Interpreter', 'latex', 'FontSize', 10, 'Location','northeast');
title('$\lambda_{RR}$ estimation', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Time (s)', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Slip ratio', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor
hold off

%% Compute error metrics
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

%% Compare speed at wheels calculated from inverse model
if(~param_vdc.gss_active)
    v_wx_est = out.est_debug.Data(1:4,:)';
    v_wy_est = out.est_debug.Data(5:8,:)';
    
    t_est2 = out.est_debug.Time;
    vx_sim = interp1(time, vx, t_est2);
    vy_sim = interp1(time, vy, t_est2);
    wz_sim = interp1(time, yaw_rate, t_est2);
    delta_sim = interp1(time, steer, t_est2);
    n = length(t_est2);
    
    v_wx_sim = zeros(n,4);
    v_wy_sim = zeros(n,4);
    
    for i=1:n
        delta_i = calculate_steering(delta_sim(i), param_vdc);
        H = [cos(delta_i(1)),  sin(delta_i(1)), -0.5*param_vdc.trackwidthF*cos(delta_i(1)) + param_vdc.lf*sin(delta_i(1));
        cos(delta_i(2)),   sin(delta_i(2)), 0.5*param_vdc.trackwidthF*cos(delta_i(2)) + param_vdc.lf*sin(delta_i(2));
        1,            0,          -0.5*param_vdc.trackwidthR;
        1,            0,          0.5*param_vdc.trackwidthR;
        -sin(delta_i(1)),  cos(delta_i(1)), param_vdc.lf*cos(delta_i(1)) + 0.5*param_vdc.trackwidthF*sin(delta_i(1));
        -sin(delta_i(2)),  cos(delta_i(2)), param_vdc.lf*cos(delta_i(2)) - 0.5*param_vdc.trackwidthF*sin(delta_i(2));
        0,            1,          -param_vdc.lr;
        0,            1,          -param_vdc.lr;
        0,            0,          1];
        
        x_sim_i = H*[vx_sim(i); vy_sim(i); wz_sim(i)];
        v_wx_sim(i,:) = x_sim_i(1:4)';
        v_wy_sim(i,:) = x_sim_i(5:8)';
    end
    
    figure
    plot(v_wx_est(:,1))
    hold on
    plot(v_wx_sim(:,1))
    hold off
    legend('v_{wx,fl} est', 'v_{wx,fl} sim')
    set(gcf, 'Color', 'w')
    grid on
    grid minor

    figure(10)
    plot(v_wx_est(:,2))
    hold on
    plot(v_wx_sim(:,2))
    hold off
    legend('v_{wx,fr} est', 'v_{wx,fr} sim')
    set(gcf, 'Color', 'w')
    grid on
    grid minor

    
    figure(11)
    plot(v_wx_est(:,3))
    hold on
    plot(v_wx_sim(:,3))
    hold off
    legend('v_{wx,rl} est', 'v_{wx,rl} sim')
    set(gcf, 'Color', 'w')
    grid on
    grid minor
    
    figure(12)
    plot(v_wx_est(:,4))
    hold on
    plot(v_wx_sim(:,4))
    hold off
    legend('v_{wx,rr} est', 'v_{wx,rr} sim')
    set(gcf, 'Color', 'w')
    grid on
    grid minor
    
    figure(13)
    plot(v_wy_est(:,1))
    hold on
    plot(v_wy_sim(:,1))
    hold off
    legend('v_{wy,fl} est', 'v_{wy,fl} sim')
    set(gcf, 'Color', 'w')
    grid on
    grid minor
    
    figure(14)
    plot(v_wy_est(:,2))
    hold on
    plot(v_wy_sim(:,2))
    hold off
    legend('v_{wy,fr} est', 'v_{wy,fr} sim')
    set(gcf, 'Color', 'w')
    grid on
    grid minor
    
    figure(15)
    plot(v_wy_est(:,3))
    hold on
    plot(v_wy_sim(:,3))
    hold off
    legend('v_{wy,rl} est', 'v_{wy,rl} sim')
    set(gcf, 'Color', 'w')
    grid on
    grid minor

    figure(16)
    plot(v_wy_est(:,4))
    hold on
    plot(v_wy_sim(:,4))
    hold off
    legend('v_{wy,rr} est', 'v_{wy,rr} sim')
    set(gcf, 'Color', 'w')
    grid on
    grid minor

end