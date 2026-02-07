Simulink.sdi.clear;

warning('off','Simulink:Logging:SignalsLoggedWithoutSDI');

simulation_setup
if bdIsLoaded('ART25_full_car')
    bdclose('ART25_full_car');
end
launch_simulation

KPs = 15:0.25:22;
KIs = 2:0.05:5;
KDs = 0;

[KPg, KIg, KDg] = ndgrid(KPs, KIs, KDs);
K = [KPg(:), KIg(:), KDg(:)];
l = size(K,1);
n = length(out.tire_bus.signals.values(:,5));
M = zeros(2*n+4, l);

mdlPath = fullfile(ROOT_DIR,'ART25_full_car.slx');
load_system(mdlPath);

mdl = 'ART25_full_car';

set_param(mdl, ...
    'SignalLogging','off', ...
    'SaveOutput','off', ...
    'SaveState','off', ...
    'FastRestart','on');

set_param(mdl, ...
    'StartTime', num2str(Tini), ...
    'StopTime',  num2str(Tend));

for i = 1:l
    % set_param(mdl,'SimulationCommand','stop');
    % set_param(mdl,'SimulationCommand','update');

    % Asignar PID
    param_vdc.TC_Kp = K(i,1);
    param_vdc.TC_Ti = K(i,2);
    param_vdc.TC_Td = K(i,3);

    % Inyectar en workspace del worker
    assignin('base','param_vdc',param_vdc);

    % Simulación NORMAL
    out_i = sim(mdl);

    % Postproceso
    SR_FL = out_i.tire_bus.signals.values(:,5);
    SR_RL = out_i.tire_bus.signals.values(:,7);

    SR_e_FL = 0.1 - abs(SR_FL);
    SR_e_RL = 0.1 - abs(SR_RL);

    error_pos = sum(max(-SR_e_FL,0) + max(-SR_e_RL,0));
    
    SR_target = 0.1;

    % Pesos (ajustados para TC real)
    w_over  = 20;   % castigo fuerte overshoot
    w_under = 2;    % castigo suave undershoot
    w_band  = 1.0;  % recompensa por estar en target
    w_pass  = 30;   % castigo PID pasivo
    w_var   = 0.2;  % suavidad
    
    tol = 0.01;     % banda ±10% del target
    
    % Slip Ratios
    SR_FL = abs(out_i.tire_bus.signals.values(:,5));
    SR_RL = abs(out_i.tire_bus.signals.values(:,7));
    
    SR_all = [SR_FL; SR_RL];
    
    % Overshoot / Undershoot
    e_over  = max(SR_all - SR_target, 0);
    e_under = max(SR_target - SR_all, 0);
    
    % --- Costes principales ---
    J_over  = w_over  * sum(e_over.^2);      % NO pasarse
    J_under = w_under * sum(e_under);         % No quedarse corto
    
    % --- Tiempo cerca del target ---
    in_band = abs(SR_all - SR_target) < tol;
    J_band  = -w_band * sum(in_band);
    
    % --- Penalización PID pasivo ---
    mean_SR = mean(SR_all);
    J_pass  = w_pass * max(0.085 - mean_SR, 0)^2;
    
    % --- Suavidad ---
    J_var = w_var * (var(SR_FL) + var(SR_RL));
    
    % --- Coste total ---
    J = J_over + J_under + J_band + J_pass + J_var;
    
    % Guardar
    M(:,i) = [ ...
        K(i,1); K(i,2); K(i,3); ...
        J; ...
        SR_FL; ...
        SR_RL ];

    fprintf('Iteración: %d/%d. kp=%f, Ti=%f, Td=%f, error=%f \n', ...
        i, l, K(i,1), K(i,2), K(i,3), J);
    
    Simulink.sdi.clear;
end

set_param(mdl, "FastRestart",'off');

M2 = M(:,(M(4,:)>0));
[min_errors, idx] = mink(M2(4,:),10);
t = time;

for i = idx
    kp = M2(1,i);
    ki = M2(2,i);
    kd = M2(3,i);
    error_pos = M2(4,i);
    SR_FL = M2(5:5+n-1,i);
    SR_RL = M2(5+n:end,i);
    figure
    plot(t, SR_FL, 'b','LineWidth',1.5);
    hold on
    plot(t, SR_RL, 'c','LineWidth',1.5);
    yline(0.1,'r--','LineWidth',1);
    grid on; grid minor;
    legend({'$SR_{FL}$','$SR_{RL}$','$SR_{target}$'},...
       'Interpreter','latex','FontSize',14,'Location','northeast');
    title(['kp=',num2str(kp),', ki=',num2str(ki),', kd=', num2str(kd),...
        ',error=',num2str(error_pos)],'Interpreter','latex','FontSize',16);
    xlabel('Time (s)','Interpreter','latex','FontSize',16);
    ylabel('Slip Ratio','Interpreter','latex','FontSize',16);
end

figure
scatter3(M2(1,:), M2(2,:), M2(3,:), 50, M2(4,:), 'filled')
xlabel('Kp')
ylabel('Ki')
zlabel('Kd')
ylim([0, 2])
cb = colorbar;
cb.Label.String = 'Error Positivo';
title('Error en función de Kp, Ki, Kd')
grid on
view(45,30)
clims = prctile(M2(4,:), [0 30]); % 5% y 95% para ignorar outliers extremos
clim(clims)