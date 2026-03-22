close all
clc

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
c_visc  = 0.4;          % N·m·s/rad 
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


Fx_FL = (data.TcmdFL .* J_wheel - c_visc .* alpha_wFL) ./ R_eff;
Fx_FR = (data.TcmdFR .* J_wheel - c_visc .* alpha_wFR) ./ R_eff;
Fx_RL = (data.TcmdRL .* J_wheel - c_visc .* alpha_wRL) ./ R_eff;
Fx_RR = (data.TcmdRR .* J_wheel - c_visc .* alpha_wRR) ./ R_eff;

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
title('$Fx_{calc} vs Fx_{real}$','Interpreter','latex','FontSize',16)

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





