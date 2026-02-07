%% Load test data
% Con rosbags
rosbag_data = rosbag_logger('arussim/rosbag2_2025_12_17-22_30_27_0.mcap');
time = rosbag_data.motor_speed_rl.time;
time = time(500:end);
w_mot_fl = interp1(rosbag_data.motor_speed_fl.time, rosbag_data.motor_speed_fl.data, time, 'linear', 'extrap');
w_mot_fr = interp1(rosbag_data.motor_speed_fr.time, rosbag_data.motor_speed_fr.data, time, 'linear', 'extrap');
w_mot_rl = interp1(rosbag_data.motor_speed_rl.time, rosbag_data.motor_speed_rl.data, time, 'linear', 'extrap');
w_mot_rr = interp1(rosbag_data.motor_speed_rr.time, rosbag_data.motor_speed_rr.data, time, 'linear', 'extrap');
w_mot = [w_mot_fl', w_mot_fr', w_mot_rl', w_mot_rr'];
T_mot_fl = interp1(rosbag_data.motor_torque_fl.time, rosbag_data.motor_torque_fl.data, time, 'linear', 'extrap');
T_mot_fr = interp1(rosbag_data.motor_torque_fr.time, rosbag_data.motor_torque_fr.data, time, 'linear', 'extrap');
T_mot_rl = interp1(rosbag_data.motor_torque_rl.time, rosbag_data.motor_torque_rl.data, time, 'linear', 'extrap');
T_mot_rr = interp1(rosbag_data.motor_torque_rr.time, rosbag_data.motor_torque_rr.data, time);
T_mot = [T_mot_fl', T_mot_fr', T_mot_rl', T_mot_rr'];

% % Con logs de CAN
% data = Protocolo_Carga_PC('AutoX_FSXerez_Tornay.txt');
% time = data.tiempo - data.tiempo(1);
% w_mot = 12.48*[data.wFL, data.wFR, data.wRL, data.wRR];
% T_mot = [data.torFL, data.torFR, data.torRL, data.torRR];


%% Calculate consumed and regenerated power
close all

P_mec = sum(w_mot.*T_mot, 2);
P_mec_cons = max(P_mec, zeros(length(P_mec),1));
cons_energy = trapz(time, P_mec_cons)/3600/1000;
P_mec_regen = min(P_mec, zeros(length(P_mec),1));
regen_energy = trapz(time, abs(P_mec_regen))/3600/1000;

regen_cons_ratio = regen_energy/cons_energy;

figure
plot(time, P_mec_cons, 'r')
hold on
plot(time, P_mec_regen, 'b')
legend({['Consumed energy: ', num2str(cons_energy), ' kWh'], ...
    ['Regenerated energy: ', num2str(regen_energy), ' kWh']}, ...
    'Interpreter', 'latex', 'FontSize', 12)
title(['Power (w) (regen-consumed power ratio: ', num2str(regen_cons_ratio), ')'], ...
    'Interpreter', 'latex', 'FontSize', 14);
grid on

backwards_spin_idx_rl = w_mot(:,3) < 0;

figure
eje1=subplot(2,1,1);
plot(time, T_mot(:,3))
legend('$T_{RL}^{mot} (rad/s)$', 'Interpreter', 'latex', 'FontSize', 12)
eje2=subplot(2,1,2);
plot(time, w_mot(:,3))
hold on
plot(time(backwards_spin_idx_rl), w_mot(backwards_spin_idx_rl, 3), '.r')
yline(80)
yline(170)
if any(backwards_spin_idx_rl)
    title('CAUTION: RL wheel SPINS BACKWARDS', 'FontSize', 14)
end
legend('$\omega_{RL}^{mot} (rad/s)$', 'Interpreter', 'latex', 'FontSize', 12)
grid on
linkaxes([eje1, eje2], 'x')

backwards_spin_idx_rr = w_mot(:,4) < 0;

figure
eje1=subplot(2,1,1);
plot(time, T_mot(:,4))
legend('$T_{RR}^{mot} (rad/s)$', 'Interpreter', 'latex', 'FontSize', 12)
eje2=subplot(2,1,2);
plot(time, w_mot(:,4))
hold on
plot(time(backwards_spin_idx_rr), w_mot(backwards_spin_idx_rr, 4), '.r')
yline(80)
yline(170)
if any(backwards_spin_idx_rr)
    title('CAUTION: RR wheel SPINS BACKWARDS', 'FontSize', 14)
end
legend('$\omega_{RR}^{mot} (rad/s)$', 'Interpreter', 'latex', 'FontSize', 12)
grid on
linkaxes([eje1, eje2], 'x')