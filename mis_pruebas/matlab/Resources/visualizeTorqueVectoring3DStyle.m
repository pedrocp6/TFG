% visualizeTorqueVectoring3DStyle.m
% Animación sincronizada: torque vectoring + posición en pista.
% Requiere:
%   t     : 1xN vector de tiempos
%   T     : 4xN matriz de pares [FL; FR; RL; RR]
%   xy    : 2xN matriz de posiciones (x,y)
%   theta : 1xN orientación del coche en radianes (0 = eje Y)
% Ejemplo:
%   t = linspace(0,10,500);
%   T = [100*sin(2*pi*0.2*t);
%        80*sin(2*pi*0.2*t + 0.5);
%        60*sin(2*pi*0.2*t + 1);
%        90*sin(2*pi*0.2*t + 1.5)];
%   xy = [cos(2*pi*0.05*t); sin(2*pi*0.05*t)];
%   theta = atan2(diff([xy(2,1),xy(2,:)]), diff([xy(1,1),xy(1,:)]+1e-6));
%   visualizeTorqueVectoring3DStyle(t,T,xy,theta);

function visualizeTorqueVectoring3DStyle(t, T, xy, theta)
    assert(size(T,1)==4, 'T debe ser 4xN para [FL; FR; RL; RR]');
    assert(numel(t)==size(T,2), 't e T deben tener igual número de muestras');
    assert(all(size(xy)==[2 numel(t)]), 'xy debe ser 2xN');
    assert(numel(theta)==numel(t), 'theta debe ser 1xN');

    % Posiciones de ruedas (en sistema del coche)
    wheelRel = [ -1.0,  0.8;   % FL
                  1.0,  0.8;   % FR
                 -1.0, -0.8;   % RL
                  1.0, -0.8 ]; % RR

    maxT = max(abs(T(:)));
    scale = 0.5/maxT;

    % Crear figura con 2 subplots sincronizados
    figure('Color',[0.2 0.2 0.3]);

    % Subplot 1: Torque vectoring en coche
    ax1 = subplot(1,2,1);
    axis equal off;
    hold on;
    title('Torque en ruedas','Color','w');

    % Coche (patch fijo)
    carX = [ -1.2, -0.8, -0.5, 0.5, 0.8, 1.2, 1.2, -1.2 ];
    carY = [ -0.9, -1.0, -1.0, -1.0, -1.0, -0.9, 0.9, 0.9 ];
    patch(ax1, carX, carY, [0.1 0.1 0.1], 'EdgeColor','k','LineWidth',1.5);
    patch(ax1, [-0.4 0.4 0.4 -0.4], [0.2 0.2 0.8 0.8], [0.15 0.15 0.15], 'EdgeColor','none');
    patch(ax1, [-1.1 1.1 1.1 -1.1], [-0.9 -0.9 -1.2 -1.2], [0.05 0.05 0.05], 'EdgeColor','none');

    % Círculos y flechas torque
    for i=1:4
        circHandles(i) = rectangle(ax1,'Position',[wheelRel(i,1)-0.35, wheelRel(i,2)-0.35, 0.7, 0.7],...
            'Curvature',[1,1], 'EdgeColor','y', 'LineWidth',6);
        arrHandles(i) = quiver(ax1, wheelRel(i,1), wheelRel(i,2), 0, 0, 'MaxHeadSize',0.8, 'LineWidth',3);
    end

    % Subplot 2: Mapa de pista
    ax2 = subplot(1,2,2);
    hold on;
    plot(ax2, xy(1,:), xy(2,:), 'Color', [0.7 0.7 0.7]);
    axis equal;
    title('Posición en pista','Color','w');
    xlabel('X'); ylabel('Y');

    % Flecha posición
    poseArrow = quiver(ax2, 0, 0, 0, 0, 'Color', 'c', 'LineWidth', 2, 'MaxHeadSize', 2);

    for k=1:length(t)
        % --- Torque ---
        for i=1:4
            torque = T(i,k);
            len = abs(torque)*scale;
            dx = 0;
            dy = sign(torque)*len;
            arrHandles(i).UData = dx;
            arrHandles(i).VData = dy;
            % arrHandles(i).Color = torque >= 0 ? [0 0.6 1] : [1 0 0];
        end
        title(ax1, sprintf('Tiempo: %.2f s', t(k)), 'Color','w','FontSize',14);

        % --- Posición ---
        px = xy(1,k);
        py = xy(2,k);
        th = theta(k);
        poseArrow.XData = px;
        poseArrow.YData = py;
        poseArrow.UData = 0.5*cos(th);
        poseArrow.VData = 0.5*sin(th);

        drawnow;
    end
end
