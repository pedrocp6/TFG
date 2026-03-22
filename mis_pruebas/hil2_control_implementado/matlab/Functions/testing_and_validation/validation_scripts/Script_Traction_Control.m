close all
clc

%% Without TC
data0 = Protocolo_Carga_PC("can0_candump_2025-10-09_13-04-01.txt");
tiempo0 = data0.tiempo - data0.tiempo(1);
data0.steer = zeros(length(tiempo0),1);

legend_entries=cell(1,2);

figure
eje1 = subplot(2,2,1);
plot(tiempo0, data0.torFL, 'b', 'LineWidth',1.5);
hold on
plot(tiempo0, data0.TcmdFL, 'r', 'LineWidth',1);
hold on
grid minor
hold off
legend_entries{1}='$T_{FL}$';
legend_entries{2}='$T_{CMD,FL}$';
legend(legend_entries, 'Interpreter','latex','FontSize',12,'Location','northeast')
title('Torque Fl without TC','Interpreter','latex','FontSize',16)
xlabel('Time (s)', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('Torque (N/m)', 'Interpreter', 'latex', 'FontSize', 14);

eje2 = subplot(2,2,2);
plot(tiempo0, data0.torFR, 'b', 'LineWidth',1.5);
hold on
plot(tiempo0, data0.TcmdFR, 'r', 'LineWidth',1);
hold on
grid minor
hold off
legend_entries{1}='$T_{FR}$';
legend_entries{2}='$T_{CMD,FR}$';
legend(legend_entries, 'Interpreter','latex','FontSize',12,'Location','northeast')
title('Torque FR without TC','Interpreter','latex','FontSize',16)
xlabel('Time (s)', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('Torque (N/m)', 'Interpreter', 'latex', 'FontSize', 14);

eje3 = subplot(2,2,3);
plot(tiempo0, data0.torRL, 'b', 'LineWidth',1.5);
hold on
plot(tiempo0, data0.TcmdRL, 'r', 'LineWidth',1);
hold on
grid minor
hold off
legend_entries{1}='$T_{RL}$';
legend_entries{2}='$T_{CMD,RL}$';
legend(legend_entries, 'Interpreter','latex','FontSize',12,'Location','northeast')
title('Torque RL without TC','Interpreter','latex','FontSize',16)
xlabel('Time (s)', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('Torque (N/m)', 'Interpreter', 'latex', 'FontSize', 14);

eje4 = subplot(2,2,4);
plot(tiempo0, data0.torRR, 'b', 'LineWidth',1.5);
hold on
plot(tiempo0, data0.TcmdRR, 'r', 'LineWidth',1);
hold on
grid minor
hold off
legend_entries{1}='$T_{RR}$';
legend_entries{2}='$T_{CMD,RR}$';
legend(legend_entries, 'Interpreter','latex','FontSize',12,'Location','northeast')
title('Torque RR without TC','Interpreter','latex','FontSize',16)
xlabel('Time (s)', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('Torque (N/m)', 'Interpreter', 'latex', 'FontSize', 14);

linkaxes([eje1, eje2, eje3, eje4], 'xy')

% Calculate Slip Ratio
wr = [data0.wFL, data0.wFR, data0.wRL, data0.wRR];
vx_wheel = data0.vxGSS .* ones(1,4) + data0.yawRateGSS / 2 .* [-1.22, 1.22, -1.22, 1.22];
vy_wheel = data0.vyGSS .* ones(1,4) + data0.yawRateGSS .* [0.7675, 0.7675, -0.7675, -0.7675];
vx_wheel_tire = vx_wheel .* cos(data0.steer .* [1,1,0,0]) + vy_wheel .* sin(data0.steer .* [1,1,0,0]);

if min(vx_wheel_tire) < 1
    SR = 0.225 * wr - vx_wheel_tire;
else
    SR = 0.225 * wr ./ (vx_wheel_tire + eps) - 1;
end


figure
eje1 = subplot(2,2,1);
plot(tiempo0, SR(:,1), 'b', 'LineWidth',1.5);
yline(0.1,'r--','LineWidth',1)
grid on
grid minor
hold off
ylim([-2 2])
legend_entries{1}='$SR_{FL}$';
legend_entries{2}='$SR_{target}$';
legend(legend_entries, 'Interpreter','latex','FontSize',12,'Location','northeast')
title('Slip Ratio FL without TC','Interpreter','latex','FontSize',16)
xlabel('Time (s)', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('Slip Ratio', 'Interpreter', 'latex', 'FontSize', 14);


eje2 = subplot(2,2,2);
plot(tiempo0, SR(:,2), 'b', 'LineWidth',1.5);
yline(0.1,'r--','LineWidth',1)
grid on
grid minor
hold off
ylim([-2 2])
legend_entries{1}='$SR_{FR}$';
legend_entries{2}='$SR_{target}$';
legend(legend_entries, 'Interpreter','latex','FontSize',12,'Location','northeast')
title('Slip Ratio FR without TC','Interpreter','latex','FontSize',16)
xlabel('Time (s)', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('Slip Ratio', 'Interpreter', 'latex', 'FontSize', 14);

eje3 = subplot(2,2,3);
plot(tiempo0, SR(:,3), 'b', 'LineWidth',1.5);
yline(0.1,'r--','LineWidth',1)
grid on
grid minor
hold off
ylim([-2 2])
legend_entries{1}='$SR_{RL}$';
legend_entries{2}='$SR_{target}$';
legend(legend_entries, 'Interpreter','latex','FontSize',12,'Location','northeast')
title('Slip Ratio RL without TC','Interpreter','latex','FontSize',16)
xlabel('Time (s)', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('Slip Ratio', 'Interpreter', 'latex', 'FontSize', 14);

eje4 = subplot(2,2,4);
plot(tiempo0, SR(:,4), 'b', 'LineWidth',1.5);
yline(0.1,'r--','LineWidth',1)
grid on
grid minor
hold off
ylim([-2 2])
legend_entries{1}='$SR_{RR}$';
legend_entries{2}='$SR_{target}$';
legend(legend_entries, 'Interpreter','latex','FontSize',12,'Location','northeast')
title('Slip Ratio RR without TC','Interpreter','latex','FontSize',16)
xlabel('Time (s)', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('Slip Ratio', 'Interpreter', 'latex', 'FontSize', 14);

linkaxes([eje1, eje2, eje3, eje4], 'xy')

figure
eje1 = subplot(2,1,1);
plot(tiempo0, data0.torFL, 'r', 'LineWidth',1.5)
title('$T_{FL} without TC$','Interpreter','latex','FontSize',16)
eje2 = subplot(2,1,2);
plot(tiempo0, SR(:,1), 'b', 'LineWidth',1.5)
hold on
yline(0.1,'r--','LineWidth',1)
ylim([-2 2])
legend_entries{1}='$SR_{FL}$';
legend_entries{2}='$SR_{target}$';
legend(legend_entries, 'Interpreter','latex','FontSize',12,'Location','northeast')
title('$SR_{FL} without TC$','Interpreter','latex','FontSize',16)

linkaxes([eje1, eje2], 'x')

figure
eje1 = subplot(2,1,1);
plot(tiempo0, data0.torFR, 'r', 'LineWidth',1.5)
title('$T_{FR} without TC$','Interpreter','latex','FontSize',16)
eje2 = subplot(2,1,2);
plot(tiempo0, SR(:,2), 'b', 'LineWidth',1.5)
hold on
yline(0.1,'r--','LineWidth',1)
ylim([-2 2])
legend_entries{1}='$SR_{FR}$';
legend_entries{2}='$SR_{target}$';
legend(legend_entries, 'Interpreter','latex','FontSize',12,'Location','northeast')
title('$SR_{FR} without TC$','Interpreter','latex','FontSize',16)

linkaxes([eje1, eje2], 'x')

figure
eje1 = subplot(3,1,1);
plot(tiempo0, data0.torRL, 'r', 'LineWidth',1.5)
title('$T_{RL} without TC$','Interpreter','latex','FontSize',16)
eje2 = subplot(3,1,2);
plot(tiempo0, data0.axGSS, 'b', 'LineWidth',1.5)
title('$a_x$','Interpreter','latex','FontSize',16)
eje3 = subplot(3,1,3);
plot(tiempo0, SR(:,3), 'b', 'LineWidth',1.5)
hold on
yline(0.1,'r--','LineWidth',1)
ylim([-2 2])
legend_entries{1}='$SR_{RL}$';
legend_entries{2}='$SR_{target}$';
legend(legend_entries, 'Interpreter','latex','FontSize',12,'Location','northeast')
title('$SR_{RL} without TC$','Interpreter','latex','FontSize',16)

linkaxes([eje1, eje2,eje3], 'x')

figure
eje1 = subplot(3,1,1);
plot(tiempo0, data0.torRR, 'r', 'LineWidth',1.5)
title('$T_{RR} without TC$','Interpreter','latex','FontSize',16)
eje2 = subplot(3,1,2);
plot(tiempo0, data0.axGSS, 'b', 'LineWidth',1.5)
title('$a_x$','Interpreter','latex','FontSize',16)
eje3 = subplot(3,1,3);
plot(tiempo0, SR(:,4), 'b', 'LineWidth',1.5)
hold on
yline(0.1,'r--','LineWidth',1)
ylim([-2 2])
legend_entries{1}='$SR_{RR}$';
legend_entries{2}='$SR_{target}$';
legend(legend_entries, 'Interpreter','latex','FontSize',12,'Location','northeast')
title('$SR_{RR} without TC$','Interpreter','latex','FontSize',16)

linkaxes([eje1, eje2,eje3], 'x')



%% With TC
data = Protocolo_Carga_PC("can0_candump_2025-10-16_20-15-07.txt");
tiempo = data.tiempo - data.tiempo(1);
data.steer = zeros(length(tiempo),1);

legend_entries=cell(1,2);

figure
eje1 = subplot(2,2,1);
plot(tiempo, data.torFL, 'b', 'LineWidth',1.5);
hold on
plot(tiempo, data.TcmdFL, 'r', 'LineWidth',1);
hold on
grid minor
hold off
legend_entries{1}='$T_{FL}$';
legend_entries{2}='$T_{CMD,FL}$';
legend(legend_entries, 'Interpreter','latex','FontSize',12,'Location','northeast')
title('Torque FL with TC','Interpreter','latex','FontSize',16)
xlabel('Time (s)', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('Torque (N/m)', 'Interpreter', 'latex', 'FontSize', 14);

eje2 = subplot(2,2,2);
plot(tiempo, data.torFR, 'b', 'LineWidth',1.5);
hold on
plot(tiempo, data.TcmdFR, 'r', 'LineWidth',1);
hold on
grid minor
hold off
legend_entries{1}='$T_{FR}$';
legend_entries{2}='$T_{CMD,FR}$';
legend(legend_entries, 'Interpreter','latex','FontSize',12,'Location','northeast')
title('Torque FR with TC','Interpreter','latex','FontSize',16)
xlabel('Time (s)', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('Torque (N/m)', 'Interpreter', 'latex', 'FontSize', 14);

eje3 = subplot(2,2,3);
plot(tiempo, data.torRL, 'b', 'LineWidth',1.5);
hold on
plot(tiempo, data.TcmdRL, 'r', 'LineWidth',1);
hold on
grid minor
hold off
legend_entries{1}='$T_{RL}$';
legend_entries{2}='$T_{CMD,RL}$';
legend(legend_entries, 'Interpreter','latex','FontSize',12,'Location','northeast')
title('Torque RL with TC','Interpreter','latex','FontSize',16)
xlabel('Time (s)', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('Torque (N/m)', 'Interpreter', 'latex', 'FontSize', 14);

eje4 = subplot(2,2,4);
plot(tiempo, data.torRR, 'b', 'LineWidth',1.5);
hold on
plot(tiempo, data.TcmdRR, 'r', 'LineWidth',1);
hold on
grid minor
hold off
legend_entries{1}='$T_{RR}$';
legend_entries{2}='$T_{CMD,RR}$';
legend(legend_entries, 'Interpreter','latex','FontSize',12,'Location','northeast')
title('Torque RR with TC','Interpreter','latex','FontSize',16)
xlabel('Time (s)', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('Torque (N/m)', 'Interpreter', 'latex', 'FontSize', 14);

linkaxes([eje1, eje2, eje3, eje4], 'xy')

% Calculate Slip Ratio
wr = [data.wFL, data.wFR, data.wRL, data.wRR];
vx_wheel = data.vxGSS .* ones(1,4) + data.yawRateGSS / 2 .* [-1.22, 1.22, -1.22, 1.22];
vy_wheel = data.vyGSS .* ones(1,4) + data.yawRateGSS .* [0.7675, 0.7675, -0.7675, -0.7675];
vx_wheel_tire = vx_wheel .* cos(data.steer .* [1,1,0,0]) + vy_wheel .* sin(data.steer .* [1,1,0,0]);

if min(vx_wheel_tire) < 1
    SR = 0.225 * wr - vx_wheel_tire;
else
    SR = 0.225 * wr ./ (vx_wheel_tire + eps) - 1;
end


figure
eje1 = subplot(2,2,1);
plot(tiempo, SR(:,1), 'b', 'LineWidth',1.5);
yline(0.1,'r--','LineWidth',1)
grid on
grid minor
hold off
ylim([-2 2])
legend_entries{1}='$SR_{FL}$';
legend_entries{2}='$SR_{target}$';
legend(legend_entries, 'Interpreter','latex','FontSize',12,'Location','northeast')
title('Slip Ratio FL with TC','Interpreter','latex','FontSize',16)
xlabel('Time (s)', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('Slip Ratio', 'Interpreter', 'latex', 'FontSize', 14);


eje2 = subplot(2,2,2);
plot(tiempo, SR(:,2), 'b', 'LineWidth',1.5);
yline(0.1,'r--','LineWidth',1)
grid on
grid minor
hold off
ylim([-2 2])
legend_entries{1}='$SR_{FR}$';
legend_entries{2}='$SR_{target}$';
legend(legend_entries, 'Interpreter','latex','FontSize',12,'Location','northeast')
title('Slip Ratio FR with TC','Interpreter','latex','FontSize',16)
xlabel('Time (s)', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('Slip Ratio', 'Interpreter', 'latex', 'FontSize', 14);

eje3 = subplot(2,2,3);
plot(tiempo, SR(:,3), 'b', 'LineWidth',1.5);
yline(0.1,'r--','LineWidth',1)
grid on
grid minor
hold off
ylim([-2 2])
legend_entries{1}='$SR_{RL}$';
legend_entries{2}='$SR_{target}$';
legend(legend_entries, 'Interpreter','latex','FontSize',12,'Location','northeast')
title('Slip Ratio RL with TC','Interpreter','latex','FontSize',16)
xlabel('Time (s)', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('Slip Ratio', 'Interpreter', 'latex', 'FontSize', 14);

eje4 = subplot(2,2,4);
plot(tiempo, SR(:,4), 'b', 'LineWidth',1.5);
yline(0.1,'r--','LineWidth',1)
grid on
grid minor
hold off
ylim([-2 2])
legend_entries{1}='$SR_{RR}$';
legend_entries{2}='$SR_{target}$';
legend(legend_entries, 'Interpreter','latex','FontSize',12,'Location','northeast')
title('Slip Ratio RR with TC','Interpreter','latex','FontSize',16)
xlabel('Time (s)', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('Slip Ratio', 'Interpreter', 'latex', 'FontSize', 14);

linkaxes([eje1, eje2, eje3, eje4], 'xy')

figure
eje1 = subplot(2,1,1);
plot(tiempo, data.torFL, 'r', 'LineWidth',1.5)
title('$T_{FL} with TC$','Interpreter','latex','FontSize',16)
eje2 = subplot(2,1,2);
plot(tiempo, SR(:,1), 'b', 'LineWidth',1.5)
hold on
yline(0.1,'r--','LineWidth',1)
ylim([-2 2])
legend_entries{1}='$SR_{FL}$';
legend_entries{2}='$SR_{target}$';
legend(legend_entries, 'Interpreter','latex','FontSize',12,'Location','northeast')
title('$SR_{FL} with TC$','Interpreter','latex','FontSize',16)

linkaxes([eje1, eje2], 'x')

figure
eje1 = subplot(2,1,1);
plot(tiempo, data.torFR, 'r', 'LineWidth',1.5)
title('$T_{FR} with TC$','Interpreter','latex','FontSize',16)
eje2 = subplot(2,1,2);
plot(tiempo, SR(:,2), 'b', 'LineWidth',1.5)
hold on
yline(0.1,'r--','LineWidth',1)
ylim([-2 2])
legend_entries{1}='$SR_{FR}$';
legend_entries{2}='$SR_{target}$';
legend(legend_entries, 'Interpreter','latex','FontSize',12,'Location','northeast')
title('$SR_{FR} with TC$','Interpreter','latex','FontSize',16)

linkaxes([eje1, eje2], 'x')

figure
eje1 = subplot(3,1,1);
plot(tiempo, data.torRL, 'r', 'LineWidth',1.5)
title('$T_{RL} with TC$','Interpreter','latex','FontSize',16)
eje2 = subplot(3,1,2);
plot(tiempo, data.axGSS, 'b', 'LineWidth',1.5)
title('$a_x$','Interpreter','latex','FontSize',16)
eje3 = subplot(3,1,3);
plot(tiempo, SR(:,3), 'b', 'LineWidth',1.5)
hold on
yline(0.1,'r--','LineWidth',1)
ylim([-2 2])
legend_entries{1}='$SR_{RL}$';
legend_entries{2}='$SR_{target}$';
legend(legend_entries, 'Interpreter','latex','FontSize',12,'Location','northeast')
title('$SR_{RL} with TC$','Interpreter','latex','FontSize',16)

linkaxes([eje1, eje2,eje3], 'x')

figure
eje1 = subplot(3,1,1);
plot(tiempo, data.torRR, 'r', 'LineWidth',1.5)
title('$T_{RR} with TC$','Interpreter','latex','FontSize',16)
eje2 = subplot(3,1,2);
plot(tiempo, data.axGSS, 'b', 'LineWidth',1.5)
title('$a_x$','Interpreter','latex','FontSize',16)
eje3 = subplot(3,1,3);
plot(tiempo, SR(:,4), 'b', 'LineWidth',1.5)
hold on
yline(0.1,'r--','LineWidth',1)
ylim([-2 2])
legend_entries{1}='$SR_{RR}$';
legend_entries{2}='$SR_{target}$';
legend(legend_entries, 'Interpreter','latex','FontSize',12,'Location','northeast')
title('$SR_{RR} with TC$','Interpreter','latex','FontSize',16)

linkaxes([eje1, eje2,eje3], 'x')

%% Fx
data = Protocolo_Carga_PC("can0_candump_2025-10-16_20-15-07.txt");
tiempo = data.tiempo - data.tiempo(1);

legend_entries=cell(1,2);

% Calculate Slip Ratio
wr = [data.wFL, data.wFR, data.wRL, data.wRR];
vx_wheel = data.vxGSS .* ones(1,4) + data.yawRateGSS / 2 .* [-1.22, 1.22, -1.22, 1.22];
vy_wheel = data.vyGSS .* ones(1,4) + data.yawRateGSS .* [0.7675, 0.7675, -0.7675, -0.7675];
vx_wheel_tire = vx_wheel .* cos(data.steer .* [1,1,0,0]) + vy_wheel .* sin(data.steer .* [1,1,0,0]);

if min(vx_wheel_tire) < 1
    SR = 0.225 * wr - vx_wheel_tire;
else
    SR = 0.225 * wr ./ (vx_wheel_tire + eps) - 1;
end

%Driverless = 1 / No Driverless = 0
DV = 0;
if (DV == 1)
    mass = 280;
else
    mass = 340;
end

%Fx calc
J_wheel = 12.48;        % kg·m^2 
c_fric  = 0.4;          % N·m·s/rad 
R_eff   = 0.225;        % m 
dt_int  = 0.01;         % s 

t_int = data.tiempo(1):dt_int:data.tiempo(end);

[tiempo_unique, idx_unique] = unique(data.tiempo);

wFL_int = interp1(tiempo_unique, data.wFL(idx_unique), t_int);
wFR_int = interp1(tiempo_unique, data.wFR(idx_unique), t_int);
wRL_int = interp1(tiempo_unique, data.wRL(idx_unique), t_int);
wRR_int = interp1(tiempo_unique, data.wRR(idx_unique), t_int);

alpha_int_wFL = [0; ((wFL_int(3:end) - wFL_int(1:end-2)) / (2 * dt_int))'; 0]; % el apóstrofe ' transpone
alpha_int_wFL = alpha_int_wFL(:);
alpha_int_wFR = [0; ((wFR_int(3:end) - wFR_int(1:end-2)) / (2 * dt_int))'; 0]; % el apóstrofe ' transpone
alpha_int_wFR = alpha_int_wFR(:);
alpha_int_wRL = [0; ((wRL_int(3:end) - wRL_int(1:end-2)) / (2 * dt_int))'; 0]; % el apóstrofe ' transpone
alpha_int_wRL = alpha_int_wRL(:);
alpha_int_wRR = [0; ((wRR_int(3:end) - wRR_int(1:end-2)) / (2 * dt_int))'; 0]; % el apóstrofe ' transpone
alpha_int_wRR = alpha_int_wRR(:);

alpha_wFL = interp1(t_int, alpha_int_wFL, data.tiempo);
alpha_wFR = interp1(t_int, alpha_int_wFR, data.tiempo);
alpha_wRL = interp1(t_int, alpha_int_wRL, data.tiempo);
alpha_wRR = interp1(t_int, alpha_int_wRR, data.tiempo);


Fx_FL = (data.TcmdFL .* J_wheel - c_fric .* alpha_wFL) ./ R_eff;
Fx_FR = (data.TcmdFR .* J_wheel - c_fric .* alpha_wFR) ./ R_eff;
Fx_RL = (data.TcmdRL .* J_wheel - c_fric .* alpha_wRL) ./ R_eff;
Fx_RR = (data.TcmdRR .* J_wheel - c_fric .* alpha_wRR) ./ R_eff;

Fx_calc = [Fx_FL, Fx_FR, Fx_RL, Fx_RR];   % matriz Nx4


%Fx real
PAC_KALPHAP   = 0.1809;
PAC_KLAMBDA_P = 0.1397;
PAC_BLAT      = 12.0;
PAC_BLON      = 17.0;
PAC_DLAT      = -1.33;
PAC_CLAT      = 2.0;
PAC_DLON      = 1.198;
PAC_CLON      = 1.3;
s_star_min = 0.01;

Fz = zeros(length(data.tiempo), 4);  

for i = 1:length(data.tiempo)
    Fz(i, :) = calculate_tire_loads(data.axGSS(i), data.ayGSS(i), data.vGSS(i), param)';  
end

alpha_star =  data.SlipAngle ./ PAC_KALPHAP;
lambda_star = SR ./ PAC_KLAMBDA_P;
s_star = max(sqrt(alpha_star.^2 + lambda_star.^2), s_star_min);

slip_ratio_local = s_star .* PAC_KLAMBDA_P;

Fx_pure = Fz .* PAC_DLON .* sin(PAC_CLON .* atan(PAC_BLON .* slip_ratio_local));
Fx_real = Fx_pure .* (lambda_star ./ s_star);


%Fx calc vs Fx real

figure
eje1 = subplot(2,1,1);
plot(tiempo, Fx_real(:,3), 'r', 'LineWidth',1.5);
hold on
plot(tiempo, Fx_RL,       'b', 'LineWidth',1);
grid minor
legend_entries{1}='$Fx_{real}$';
legend_entries{2}='$Fx_{calc}$';
legend(legend_entries, 'Interpreter','latex','FontSize',12,'Location','northeast')
title('$RL$','Interpreter','latex','FontSize',16)

eje2 = subplot(2,1,2);
plot(tiempo, SR(:,3), 'b', 'LineWidth',1.5)
hold on
yline(0.1,'r--','LineWidth',1)
ylim([-2 2])
legend_entries{1}='$SR_{RL}$';
legend_entries{2}='$SR_{target}$';
legend(legend_entries, 'Interpreter','latex','FontSize',12,'Location','northeast')
title('$SR_{RL} with TC$','Interpreter','latex','FontSize',16)
linkaxes([eje1, eje2], 'x')


figure
eje1 = subplot(2,1,1);
plot(tiempo, Fx_real(:,4), 'r', 'LineWidth',1.5);
hold on
plot(tiempo, Fx_RR,       'b', 'LineWidth',1);
grid minor
legend_entries{1}='$Fx_{real}$';
legend_entries{2}='$Fx_{calc}$';
legend(legend_entries, 'Interpreter','latex','FontSize',12,'Location','northeast')
title('$RR$','Interpreter','latex','FontSize',16)

eje2 = subplot(2,1,2);
plot(tiempo, SR(:,4), 'b', 'LineWidth',1.5)
hold on
yline(0.1,'r--','LineWidth',1)
ylim([-2 2])
legend_entries{1}='$SR_{RR}$';
legend_entries{2}='$SR_{target}$';
legend(legend_entries, 'Interpreter','latex','FontSize',12,'Location','northeast')
title('$SR_{RR} with TC$','Interpreter','latex','FontSize',16)
linkaxes([eje1, eje2], 'x')


mu_x_real = Fx_real./Fz;

mu_x_calc = Fx_calc./Fz;

figure
plot(SR, mu_x_calc, '.','Color','b');
hold on
plot(SR, mu_x_real, '.','Color','r');
hold off
grid minor
legend_entries{1}='$\mu_{x,calc}$';
legend_entries{2}='$\mu_{x,real}$';
legend(legend_entries, 'Interpreter','latex','FontSize',12,'Location','northeast')
title('$\mu_x$','Interpreter','latex','FontSize',16)