% visualizeTorqueVectoring3DStyle.m
% Animación top-down de torque vectoring sin toolboxes externos,
% con forma del coche usando patches y círculos/flechas MATLAB nativos.
% CHATGPT
% Uso:
%   t : 1xN vector de tiempos
%   T : 4xN matriz de pares [FL; FR; RL; RR]
time_vis = out.logsout{12}.Values.Time;
T = squeeze(out.logsout{12}.Values.Data);
x_vis = interp1(out.logsout{7}.Values.Time,out.logsout{7}.Values.Data,time_vis);
y_vis = interp1(out.logsout{8}.Values.Time,out.logsout{8}.Values.Data,time_vis);
yaw_vis = interp1(out.logsout{6}.Values.Time,squeeze(out.logsout{6}.Values.Data),time_vis);
visualizeTorqueVectoringfun(time_vis,T,[x_vis'; y_vis'],yaw_vis);

function visualizeTorqueVectoringfun(t, T, xy, theta)
    assert(size(T,1)==4, 'T debe ser 4xN para [FL; FR; RL; RR]');
    assert(numel(t)==size(T,2), 't e T deben tener igual número de muestras');

    % Posición de ruedas (x,y)
    wheelPos = [ -0.375,  .55;  % FL
                  0.375,  .55;  % FR
                 -.375, -.35;  % RL
                  .375, -0.35]; % RR

    maxT = 21;
    scale = .5/maxT;

    % Figura
    % figure('Color',[0.2 0.2 0.3]);
    % axis equal off;
    % xlim([-.6,.6])
    % ylim([-.8,1.5])
    % hold on;

     % Crear figura con 2 subplots sincronizados
    figure('Color',[0.2 0.2 0.3]);

    % Subplot 1: Torque vectoring en coche
    ax1 = subplot(1,2,1);
    axis equal off;
    hold on;    
    xlim([-.6,.6])
    ylim([-.8,1.5])
    title('Torque en ruedas','Color','w');

    % --- Dibujar carrocería con patch ---
    % Coordenadas aproximadas top-down
    % Alerón delantero (front wing)
    frontX = [-0.45, 0.45, 0.45, -0.45];
    frontY = [ 1.1,  1.1,  0.8,  0.8];
    patch(frontX, frontY, [0.05 0.05 0.05], 'EdgeColor','none');
    carX = [ 0.116, 0.165, 0.23, 0.2,  0.15,  0.058,  -0.058, -0.15, -0.2, -0.23, -0.165, -0.116, 0.116];
    carY = [ -0.49, -0.15, 0, 0.367, 0.7, 1,  1, 0.7, 0.367, 0, -0.15, -0.49, -0.49 ];
    patch(carX, carY, [0.1 0.1 0.1], 'EdgeColor','k','LineWidth',1.5);
    
    % Ruedas
    tireX = [-0.28, -0.47,-0.47, -0.28];
    tireY = [-0.5, -0.5, -0.2, -0.2];
    patch(tireX, tireY, [0.05 0.05 0.05], 'EdgeColor','none');
    tireX = [0.28, 0.47,0.47, 0.28];
    tireY = [-0.5, -0.5, -0.2, -0.2];
    patch(tireX, tireY, [0.05 0.05 0.05], 'EdgeColor','none'); 
    tireX = [-0.28, -0.47,-0.47, -0.28];
    tireY = [0.7, 0.7, 0.4, 0.4];
    patch(tireX, tireY, [0.05 0.05 0.05], 'EdgeColor','none'); 
    tireX = [0.28, 0.47,0.47, 0.28];
    tireY = [0.7, 0.7, 0.4, 0.4];
    patch(tireX, tireY, [0.05 0.05 0.05], 'EdgeColor','none');
    % Alerón trasero
    rearX = [-0.27, 0.27, 0.27, -0.27];
    rearY = [-0.3, -0.3, -0.6, -0.6];
    patch(rearX, rearY, [0.05 0.05 0.05], 'EdgeColor','k','LineWidth',1.5);
    % --- Precrear círculos y flechas ---
    % circHandles = gobjects(4,1);
    arrHandles  = gobjects(4,1);
    for i=1:4
        % flecha
        arrHandles(i) = quiver(wheelPos(i,1), wheelPos(i,2), 0, 0, ...
            'MaxHeadSize',0.8, 'LineWidth',3,'Color',[1 0 0]);
    end

    % Subplot 2: Mapa de pista
    ax2 = subplot(1,2,2);
    hold on;
    % plot(ax2, XYglobal(1,:), XYglobal(2,:), 'Color', [0.7 0.7 0.7],'LineWidth',4);
    plot(ax2, xy(1,:), xy(2,:), 'Color', [0.6 0.6 0.6],'LineWidth',1);
    axis equal;
    title('Posición en pista','Color','w');
    xlabel('X'); ylabel('Y');

    % Flecha posición
    poseArrow = quiver(ax2, 0, 0, 0, 0, 'Color', 'r', 'LineWidth', 2, 'MaxHeadSize', 2);
    dt = mean(diff(t));
    % Animación
    t0 = tic;
    for k=1:length(t)
        for i=1:4
            torque = T(i,k);
            len = abs(torque)*scale;
            dx = 0;
            dy = sign(torque)*len;
            arrHandles(i).UData = dx;
            arrHandles(i).VData = dy;
            % arrHandles(i).Color = [1 0 0];%torque>=0 ? [0 0.6 1] : [1 0 0];
        end
        title(sprintf('Tiempo: %.2f s', t(k)), 'Color','w','FontSize',14);

        % --- Posición ---
        px = xy(1,k);
        py = xy(2,k);
        th = theta(k);
        poseArrow.XData = px;
        poseArrow.YData = py;
        poseArrow.UData = 6*cos(th);
        poseArrow.VData = 6*sin(th);
        drawnow limitrate;
        while toc(t0) < t(k)
        pause(0.0001);  % pequeña pausa para no saturar CPU
        end

    end
end
