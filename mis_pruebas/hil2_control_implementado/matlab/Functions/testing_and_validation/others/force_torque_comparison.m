%% Run simulation
clc;
launch_simulation;

%% Obtain Fx, Fy, Fz and Torque data
time = out.tout;
Fz =  out.tire_bus.signals.values(:,9:12);
Fy = out.tire_bus.signals.values(:,13:16);
Fx = out.tire_bus.signals.values(:,17:20);
T_cmd = out.torque_cmd.data(:,:);

Fz_prop = Fz./sum(Fz,2);
T_prop = T_cmd./sum(T_cmd);
T_prop(abs(T_prop)>1) = 0;
Fx_total = sum(Fx,2);
Fy_total = sum(Fy,2);



%% Fx
%% Calculate linear regression
% coeff_1_fl = polyfit(Fx_total,Fx(:,1),1);
% r1_fl = @(x) polyval(coeff_1_fl,x);
% s1_fl = Fz_prop(:,1) .* Fx_total;
% 
% coeff_2_fl = polyfit(T_cmd(1,:),Fx(:,1),1);
% r2_fl = @(x) polyval(coeff_2_fl,x);
% 
% coeff_1_rl = polyfit(Fx_total,Fx(:,3),1);
% r1_rl = @(x) polyval(coeff_1_rl,x);
% s1_rl = Fz_prop(:,3) .* Fx_total;
% 
% coeff_2_rl = polyfit(T_cmd(3,:),Fx(:,3),1);
% r2_rl = @(x) polyval(coeff_2_rl,x);

%% Plot data vs linear regression
% close all
% 
% % FL
% figure(1)
% plot(Fx_total,Fx(:,1),'+k','MarkerSize',2)
% hold on
% plot(Fx_total,r1_fl(Fx_total),'-r','LineWidth',2)
% plot(Fx_total,s1_fl,'-c','LineWidth',2)
% hold off
% title('F_x vs F_x total (FL)')
% legend('Data','Linear regression','Proportional to Fz')
% 
% figure(2)
% plot(T_cmd(1,:),Fx(:,1),'+k','MarkerSize',2)
% hold on
% plot(T_cmd(1,:),r2_fl(T_cmd(1,:)),'-r','LineWidth',2)
% hold off
% title('F_x vs Torque (FL)')
% legend('Data','Linear regression')
% 
% 
% % RL
% figure(3)
% plot(Fx_total,Fx(:,3),'+k','MarkerSize',2)
% hold on
% plot(Fx_total,r1_rl(Fx_total),'-r','LineWidth',2)
% plot(Fx_total,s1_rl,'-c','LineWidth',2)
% hold off
% title('F_x vs F_x total (RL)')
% legend('Data','Linear regression','Proportional to Fz')
% 
% figure(4)
% plot(T_cmd(3,:),Fx(:,3),'+k','MarkerSize',2)
% hold on
% plot(T_cmd(3,:),r2_fl(T_cmd(3,:)),'-r','LineWidth',2)
% hold off
% title('F_x vs Torque (RL)')
% legend('Data','Linear regression')

% %% Fy
% %% Calculate linear regression
% coeff_1_fl = polyfit(Fy_total,Fy(:,1),1);
% r1_fl = @(x) polyval(coeff_1_fl,x);
% s1_fl = Fz_prop(:,1) .* Fy_total;
% q1_fl = T_prop(1,:)' .* Fy_total;

% coeff_2_fl = polyfit(T_cmd(1,:),Fx(:,1),1);
% r2_fl = @(x) polyval(coeff_2_fl,x);

% %% Plot data vs linear regression
% close all
% 
% % FL
% figure(1)
% plot(Fy_total,Fy(:,1),'+k','MarkerSize',2)
% hold on
% plot(Fy_total,r1_fl(Fy_total),'-r','LineWidth',2)
% plot(Fy_total,s1_fl,'-c','LineWidth',2)
% plot(Fy_total,q1_fl,'.b')
% hold off
% title('F_y vs F_y total (FL)')
% legend('Data','Linear regression','Proportional to Fz', 'Proportional to Torque')

% figure(2)
% plot(T_cmd(1,:),Fy(:,1),'+k','MarkerSize',2)
% hold on
% plot(T_cmd(1,:),r2_fl(T_cmd(1,:)),'-r','LineWidth',2)
% hold off
% title('F_x vs Torque (FL)')
% legend('Data','Linear regression')


%% Calculate Force with wheels' dynamics: r*Fx = 12*T - dw/dt
% Without noise
alphaFL = [0; diff(wFL)./diff(time)];
alphaFR = [0; diff(wFR)./diff(time)];
alphaRL = [0; diff(wRL)./diff(time)];
alphaRR = [0; diff(wRR)./diff(time)];

r = param.rdyn;
Iw = param.wheel_inertia;
gr = param.gear_ratio;

Fx_est_FL = (gr*T_cmd(1,:)' - Iw*alphaFL)/r;
Fx_est_FR = (gr*T_cmd(2,:)' - Iw*alphaFR)/r;
Fx_est_RL = (gr*T_cmd(3,:)' - Iw*alphaRL)/r;
Fx_est_RR = (gr*T_cmd(4,:)' - Iw*alphaRR)/r;

close all
figure(1)
plot(time,Fx(:,1),'-k', LineWidth=2);
hold on
plot(time,Fx_est_FL,'-r');
hold off
legend('Data', 'Formula calculated force')
title('Fx FL')

figure(2)
plot(time,Fx(:,2),'-k', LineWidth=2);
hold on
plot(time,Fx_est_FR,'-r');
hold off
legend('Data', 'Formula calculated force')
title('Fx FR')

figure(3)
plot(time,Fx(:,3),'-k', LineWidth=2);
hold on
plot(time,Fx_est_RL,'-r');
hold off
legend('Data', 'Formula calculated force')
title('Fx RL')

figure(4)
plot(time,Fx(:,4),'-k', LineWidth=2);
hold on
plot(time,Fx_est_RR,'-r');
hold off
legend('Data', 'Formula calculated force')
title('Fx RR')

% With noise
wFL_sens = outsensor.wFL;
wFR_sens = outsensor.wFR;
wRL_sens = outsensor.wRL;
wRR_sens = outsensor.wRR;
t_enc = out.sensor_out.encoder.wFL.Time;

wFL_sens = interp1(t_enc, wFL_sens, time);
wFR_sens = interp1(t_enc, wFR_sens, time);
wRL_sens = interp1(t_enc, wRL_sens, time);
wRR_sens = interp1(t_enc, wRR_sens, time);

alphaFL_sens = [0; diff(wFL_sens)./diff(time)];
alphaFR_sens = [0; diff(wFR_sens)./diff(time)];
alphaRL_sens = [0; diff(wRL_sens)./diff(time)];
alphaRR_sens = [0; diff(wRR_sens)./diff(time)];

Fx_est_FL = (12*T_cmd(1,:)' - alphaFL_sens)/r;
Fx_est_FR = (12*T_cmd(2,:)' - alphaFR_sens)/r;
Fx_est_RL = (12*T_cmd(3,:)' - alphaRL_sens)/r;
Fx_est_RR = (12*T_cmd(4,:)' - alphaRR_sens)/r;

figure(5)
plot(time,Fx(:,1),'-k', LineWidth=2);
hold on
plot(time,Fx_est_FL,'-b');
hold off
legend('Data', 'Formula calculated force')
title('Fx FL')

figure(6)
plot(time,Fx(:,2),'-k', LineWidth=2);
hold on
plot(time,Fx_est_FR,'-b');
hold off
legend('Data', 'Formula calculated force')
title('Fx FR')

figure(7)
plot(time,Fx(:,3),'-k', LineWidth=2);
hold on
plot(time,Fx_est_RL,'-b');
hold off
legend('Data', 'Formula calculated force')
title('Fx RL')

figure(8)
plot(time,Fx(:,4),'-k', LineWidth=2);
hold on
plot(time,Fx_est_RR,'-b');
hold off
legend('Data', 'Formula calculated force')
title('Fx RR')