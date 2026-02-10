%% Run simulation
clc;
simulation_setup;
launch_simulation;
close all;

x = cumsum(vx*0.0001);
idx = find(x>75,1);

% Figura TC + SR 
figure()
subplot(2,1,1)
plot(out.TCobj.Time, out.TCobj.Data(1,:), 'r','LineWidth',1); hold on;
plot(out.TCout.Time, out.TCout.Data(1,:), 'b','LineWidth',1.5);
plot(out.TVout.Time,  out.TVout.Data(:,1), 'm','LineWidth',1);
grid on; grid minor; hold off;
legend({'$TC_{OBJ}$','$TC_{OUT}$','$TV_{OUT}$'},...
       'Interpreter','latex','FontSize',14,'Location','northeast');
title(['Tiempo=',num2str(time(idx))],'Interpreter','latex','FontSize',20);
xlabel('Time (s)','Interpreter','latex','FontSize',16);
ylabel('Torque (N·m)','Interpreter','latex','FontSize',16);

subplot(2,1,2)
plot(out.SR_calc.Time, out.SR_calc.Data(1,:), 'm','LineWidth',1.5); hold on;
plot(time, out.tire_bus.signals.values(:,5), 'b','LineWidth',1.5); hold on;
yline(0.1,'r--','LineWidth',1);
grid on; grid minor; hold off;
ylim([-0.2 0.2]);
legend({'$SR_{calc}$','$SR_{tire_bus}$'},...
       'Interpreter','latex','FontSize',14,'Location','northeast');
title('Slip Ratio Calculated','Interpreter','latex','FontSize',20);
xlabel('Time (s)','Interpreter','latex','FontSize',16);
ylabel('Slip Ratio','Interpreter','latex','FontSize',16);


% Figura Fz usando tire_load
figure()
plot(out.tire_load.Time, out.tire_load.Data(1,:), 'k','LineWidth',1.5); % rueda 1
grid on; grid minor;
title('Carga vertical en rueda','Interpreter','latex','FontSize',20);
xlabel('Time (s)','Interpreter','latex','FontSize',16);
ylabel('$F_z$ (N)','Interpreter','latex','FontSize',16);
legend({'$F_z$ rueda 1'},'Interpreter','latex','FontSize',14,'Location','northeast');
