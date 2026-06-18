%% TMEasy graphics
clc
close all
n = 750;
sr = linspace(-0.175, 0.175, n);
sa = linspace(-0.25, 0.25, n);
Fz = 500:250:1500;
m = length(Fz);

px = load('fitted_parameters_comb_sim7_x.mat').params;

dMu_x0 = px.dMu_x0;
Mu_x_M = px.Mu_x_M;
Mu_x_S = px.Mu_x_S;
s_x_M = px.s_x_M;
s_x_S = px.s_x_S;

dMu_y0 = px.dMu_y0;
Mu_y_M = px.Mu_y_M;
Mu_y_S = px.Mu_y_S;
s_y_M = px.s_y_M;
s_y_S = px.s_y_S;

sx_norm_x = s_x_M./(s_x_M + s_y_M) + (Mu_x_M./dMu_x0)./(Mu_x_M./dMu_x0 + Mu_y_M./dMu_y0);
sy_norm_x = s_y_M./(s_x_M + s_y_M) + (Mu_y_M./dMu_y0)./(Mu_x_M./dMu_x0 + Mu_y_M./dMu_y0);

px_x = [dMu_x0;Mu_x_M;Mu_x_S;s_x_M;s_x_S];
py_x = [dMu_y0;Mu_y_M;Mu_y_S;s_y_M;s_y_S];
pComb_x = [px_x; py_x];

py = load('fitted_parameters_comb_sim7_y.mat').params;

dMu_x0 = py.dMu_x0;
Mu_x_M = py.Mu_x_M;
Mu_x_S = py.Mu_x_S;
s_x_M = py.s_x_M;
s_x_S = py.s_x_S;

dMu_y0 = py.dMu_y0;
Mu_y_M = py.Mu_y_M;
Mu_y_S = py.Mu_y_S;
s_y_M = py.s_y_M;
s_y_S = py.s_y_S;

sx_norm_y = s_x_M./(s_x_M + s_y_M) + (Mu_x_M./dMu_x0)./(Mu_x_M./dMu_x0 + Mu_y_M./dMu_y0);
sy_norm_y = s_y_M./(s_x_M + s_y_M) + (Mu_y_M./dMu_y0)./(Mu_x_M./dMu_x0 + Mu_y_M./dMu_y0);

px_y = [dMu_x0;Mu_x_M;Mu_x_S;s_x_M;s_x_S];
py_y = [dMu_y0;Mu_y_M;Mu_y_S;s_y_M;s_y_S];
pComb_y = [px_y; py_y];

% Calculate F, Fx and Fy (pure & combined) for every sr, sa and Fz value
Fx_comb = zeros(n,n,m);
Fy_comb = zeros(n,n,m);
F_comb = zeros(n,n,m);
Fx_pure = zeros(n,n,m);
Fy_pure = zeros(n,n,m);
Fx_pac = zeros(n,n,m);
Fy_pac = zeros(n,n,m);
F_pac = zeros(n,n,m);

for k=1:m
    for i=1:n
        for j=1:n
            phi_x = atan2(sa(i)/sy_norm_x, sr(j)/sx_norm_x);
            F = Fz(k) * mu_comb(pComb_x, [sr(j),sa(i),phi_x]);
            Fx_comb(i,j,k) = F * cos(phi_x);

            phi_y = atan2(sa(i)/sy_norm_y, sr(j)/sx_norm_y);
            F = Fz(k) * mu_comb(pComb_y, [sr(j),sa(i),phi_y]);
            Fy_comb(i,j,k) = -F * sin(phi_y);
            
            Fx_pure(i,j,k) = Fz(k) * mu_TME(px_x, sr(j));
            Fy_pure(i,j,k) = Fz(k) * (-mu_TME(py_y, sa(i)));

            [FyPac, FxPac, ~, ~]= calculate_tire_forces(Fz(k)*ones(4,1),sa(i)*ones(4,1),sr(j)*ones(4,1),pac);
            Fx_pac(i,j,k) = FxPac(1);
            Fy_pac(i,j,k) = FyPac(1);

            F_comb(i,j,k) =  sqrt(Fx_comb(i,j,k).^2 + Fy_comb(i,j,k).^2);
            F_pac(i,j,k) = sqrt(Fx_pac(i,j,k).^2 + Fy_pac(i,j,k).^2);
        end
    end
end

%% Plot F, Fx, Fy curves for different Fz values
% Fx pure
figure
hold on;
legend_entries = cell(1, m);
colors = jet(m);

for k = 1:m
    plot(sr, Fx_pure(1,:,k), 'Color', colors(k,:), 'LineWidth',1.5);
    legend_entries{k} = ['$F_z$ = ', num2str(Fz(k)), ' N'];
end

legend(legend_entries, 'Interpreter', 'latex', 'FontSize', 10, 'Location','best');
title('Pure $F_x$ vs Slip ratio', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Slip ratio', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Longitudinal force (N)', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor
hold off

% Fy pure
figure
hold on;

for k = 1:m
    plot(sa, Fy_pure(:,1,k), 'Color', colors(k,:), 'LineWidth',1.5);
end

legend(legend_entries, 'Interpreter', 'latex', 'FontSize', 10, 'Location','best');
title('Pure $F_y$ vs Slip angle', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Slip angle (rad)', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Lateral force (N)', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor
hold off

% Fx comb 
figure
hold on;

for k = 1:m
    plot(sr, Fx_comb(n/2,:,k), 'Color', colors(k,:), 'LineWidth',1.5);
end

legend(legend_entries, 'Interpreter', 'latex', 'FontSize', 10, 'Location','best');
title('Combined $F_x$ vs Slip ratio (Slip angle = 0)', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Slip ratio', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Longitudinal force (N)', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor
hold off

figure
hold on;

for k = 1:m
    plot(sr, Fx_comb(469,:,k), 'Color', colors(k,:), 'LineWidth',1.5);
end

legend(legend_entries, 'Interpreter', 'latex', 'FontSize', 10, 'Location','best');
title('Combined $F_x$ vs Slip ratio (Slip angle = 0.05)', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Slip ratio', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Longitudinal force (N)', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor
hold off

figure
hold on;

for k = 1:m
    plot(sr, Fx_comb(563,:,k), 'Color', colors(k,:), 'LineWidth',1.5);
end

legend(legend_entries, 'Interpreter', 'latex', 'FontSize', 10, 'Location','best');
title('Combined $F_x$ vs Slip ratio (Slip angle = 0.1)', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Slip ratio', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Longitudinal force (N)', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor
hold off

figure
hold on;

for k = 1:m
    plot(sr, Fx_comb(656,:,k), 'Color', colors(k,:), 'LineWidth',1.5);
end

legend(legend_entries, 'Interpreter', 'latex', 'FontSize', 10, 'Location','best');
title('Combined $F_x$ vs Slip ratio (Slip angle = 0.15)', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Slip ratio', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Longitudinal force (N)', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor
hold off

% Combined Fy
figure
hold on;

for k = 1:m
    plot(sa, Fy_comb(:,n/2,k), 'Color', colors(k,:), 'LineWidth',1.5);
end

legend(legend_entries, 'Interpreter', 'latex', 'FontSize', 10, 'Location','best');
title('Combined $F_y$ vs Slip angle (Slip ratio = 0)', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Slip angle (rad)', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Lateral force (N)', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor
hold off

figure
hold on;

for k = 1:m
    plot(sa, Fy_comb(:,469,k), 'Color', colors(k,:), 'LineWidth',1.5);
end

legend(legend_entries, 'Interpreter', 'latex', 'FontSize', 10, 'Location','best');
title('Combined $F_y$ vs Slip angle (Slip ratio = 0.05)', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Slip angle (rad)', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Lateral force (N)', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor
hold off

figure
hold on;

for k = 1:m
    plot(sa, Fy_comb(:,563,k), 'Color', colors(k,:), 'LineWidth',1.5);
end

legend(legend_entries, 'Interpreter', 'latex', 'FontSize', 10, 'Location','best');
title('Combined $F_y$ vs Slip angle (Slip ratio = 0.1)', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Slip angle (rad)', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Lateral force (N)', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor
hold off

figure(10)
hold on;

for k = 1:m
    plot(sa, Fy_comb(:,656,k), 'Color', colors(k,:), 'LineWidth',1.5);
end

legend(legend_entries, 'Interpreter', 'latex', 'FontSize', 10, 'Location','best');
title('Combined $F_y$ vs Slip angle (Slip ratio = 0.15)', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Slip angle (rad)', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Lateral force (N)', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor
hold off

%% Plot combined surfaces
figure(11)
s = surf(sr,sa,Fx_comb(:,:,1));
    set(s, 'FaceColor', colors(1,:), ...   
             'EdgeColor', 'none', ...
             'FaceAlpha', 0.6);
legend_entries{1} = ['$F_z$ = ', num2str(Fz(1)), ' N'];
hold on;

for k = 2:m
    s = surf(sr,sa,Fx_comb(:,:,k));
    set(s, 'FaceColor', colors(k,:), ...  
             'EdgeColor', 'none', ...
             'FaceAlpha', 0.6);
    legend_entries{k} = ['$F_z$ = ', num2str(Fz(k)), ' N'];
end

legend(legend_entries, 'Interpreter', 'latex', 'FontSize', 10, 'Location','northwest');
title('Combined $F_x$ vs Slip ratio vs Slip angle', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Slip ratio', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Slip angle (rad)', 'Interpreter', 'latex', 'FontSize', 12);
zlabel('Longitudinal force (N)', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor
hold off

figure(12)
s = surf(sr,sa,Fy_comb(:,:,1));
    set(s, 'FaceColor', colors(1,:), ...  
             'EdgeColor', 'none', ...
             'FaceAlpha', 0.6);
hold on;

for k = 2:m
    s = surf(sr,sa,Fy_comb(:,:,k));
    set(s, 'FaceColor', colors(k,:), ...  
             'EdgeColor', 'none', ...
             'FaceAlpha', 0.6);
end

legend(legend_entries, 'Interpreter', 'latex', 'FontSize', 10, 'Location','northeast');
title('Combined $F_y$ vs Slip ratio vs Slip angle', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Slip ratio', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Slip angle (rad)', 'Interpreter', 'latex', 'FontSize', 12);
zlabel('Lateral force (N)', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor
hold off

%% Compare models
% Fx
figure(13)
legend_entries = cell(1, 2);

s = surf(sr,sa,Fx_comb(:,:,5));
    set(s, 'FaceColor', [0.2 0.2 0.8], ...   
             'EdgeColor', 'none', ...
             'FaceAlpha', 0.6);

hold on

s = surf(sr,sa,Fx_pure(:,:,5));
    set(s, 'FaceColor', [0.8 0.2 0.2], ...   
             'EdgeColor', 'none', ...
             'FaceAlpha', 0.6);

s = surf(sr,sa,Fx_pac(:,:,5));
    set(s, 'FaceColor', [0.2 0.8 0.2], ...   
             'EdgeColor', 'none', ...
             'FaceAlpha', 0.6);

legend_entries{1} = 'TMEasy Combined';
legend_entries{2} = 'TMEasy Pure';
legend_entries{3} = 'Pacejka MF 6.1';

legend(legend_entries, 'Interpreter', 'latex', 'FontSize', 10, 'Location','northwest');
title('$F_x$ models comparison ($F_z$ = 1500N)', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Slip ratio', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Slip angle', 'Interpreter', 'latex', 'FontSize', 12);
zlabel('Longitudinal force (N)', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor
hold off

% Fy
figure(14)

s = surf(sr,sa,Fy_comb(:,:,5));
    set(s, 'FaceColor', [0.2 0.2 0.8], ...   
             'EdgeColor', 'none', ...
             'FaceAlpha', 0.6);

hold on

s = surf(sr,sa,Fy_pure(:,:,5));
    set(s, 'FaceColor', [0.8 0.2 0.2], ...   
             'EdgeColor', 'none', ...
             'FaceAlpha', 0.6);

s = surf(sr,sa,Fy_pac(:,:,5));
    set(s, 'FaceColor', [0.2 0.8 0.2], ...   
             'EdgeColor', 'none', ...
             'FaceAlpha', 0.6);

legend_entries{1} = 'TMEasy Combined';
legend_entries{2} = 'TMEasy Pure';
legend_entries{3} = 'Pacejka MF 6.1';

legend(legend_entries, 'Interpreter', 'latex', 'FontSize', 10, 'Location','northeast');
title('$F_y$ models comparison ($F_z$ = 1500 N)', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Slip ratio', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Slip angle', 'Interpreter', 'latex', 'FontSize', 12);
zlabel('Lateral force (N)', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor
hold off

% Mu
figure(15)

s = surf(sr,sa,F_pac(:,:,5)/Fz(5));
    set(s, 'FaceColor', [0.2 0.8 0.2], ...   
             'EdgeColor', 'none', ...
             'FaceAlpha', 0.6);

hold on;

s = surf(sr,sa,F_comb(:,:,5)/Fz(5));
    set(s, 'FaceColor', [0.2 0.2 0.8], ...   
             'EdgeColor', 'none', ...
             'FaceAlpha', 0.6);

legend_entries{1} = 'Pacejka MF 6.1 Combined';
legend_entries{2} = 'TMEasy Combined';

legend(legend_entries, 'Interpreter', 'latex', 'FontSize', 10, 'Location','northwest');
title('$\mu$ models comparison', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Slip ratio', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Slip angle', 'Interpreter', 'latex', 'FontSize', 12);
zlabel('Combined coefficient', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor
hold off