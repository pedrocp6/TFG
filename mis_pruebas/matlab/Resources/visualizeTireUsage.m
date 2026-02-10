FY = out.tire_bus.signals.values(:,13:16);
FX = out.tire_bus.signals.values(:,17:20);
FZ = out.tire_bus.signals.values(:,9:12);
sa = out.tire_bus.signals.values(:,1:4);
sr = out.tire_bus.signals.values(:,5:8);

slip = sqrt(sa.^2+sr.^2);
tire_use = sqrt(FY.^2+FX.^2);
tire_overuse = [(movmean((sign(diff(movmean(tire_use,50)./movmean(FZ,50))).*sign(diff(movmean(slip,50)))),500)) > 0; false false false false];

n = 100;
time_vis = time(1:n:end);

x_vis = interp1(out.logsout{7}.Values.Time,out.logsout{7}.Values.Data,time_vis);
y_vis = interp1(out.logsout{8}.Values.Time,out.logsout{8}.Values.Data,time_vis);
yaw_vis = interp1(out.logsout{6}.Values.Time,squeeze(out.logsout{6}.Values.Data),time_vis);

visualizeTireUsagefun(time_vis,movmean(FX(1:n:end,:),10),movmean(FY(1:n:end,:),10),movmean(FZ(1:n:end,:),10),[x_vis'; y_vis'],yaw_vis,tire_overuse(1:n:end,:));

function visualizeTireUsagefun(t, FX, FY, FZ, xy, theta, tire_overuse)
%% Dibujo del coche
    % Posición de ruedas (x,y)
    wheelPos = [ -0.375,  .55;  % FL
                  0.375,  .55;  % FR
                 -.375, -.35;  % RL
                  .375, -0.35]; % RR

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
    xlim([-1,1])
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
%% Preparacion de elipses y flechas

    arrHandles  = gobjects(4,1);
    circHandles = gobjects(4,1);
    
    mux_max = 1.1976;
    muy_max = 1.3323;
    ry = mux_max/4;
    rx = muy_max/4;

    scale = 0.3/1500;


    for i=1:4
        % elipse
        circHandles(i) = rectangle('Position',[wheelPos(i,1)-rx, wheelPos(i,2)-ry, 2*rx, 2*ry],...
            'Curvature',[1,1], 'EdgeColor','y', 'LineWidth',3);
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
            dx = - FY(k,i) * scale;
            dy = FX(k,i) * scale;
            arrHandles(i).UData = dx;
            arrHandles(i).VData = dy;

            rx = muy_max * FZ(k,i) * scale;
            ry = mux_max * FZ(k,i) * scale;
            circHandles(i).Position = [wheelPos(i,1)-rx, wheelPos(i,2)-ry, 2*rx, 2*ry];
            if tire_overuse(k,i)
                circHandles(i).EdgeColor = 'y';
            else
                circHandles(i).EdgeColor = 'r';
            end
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
        pause(0.0000001);  % pequeña pausa para no saturar CPU
        end

    end
end
