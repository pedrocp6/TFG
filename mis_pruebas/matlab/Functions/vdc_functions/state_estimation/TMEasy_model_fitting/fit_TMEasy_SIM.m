%% Generate surface
clc
close all

n1 = 600;
n2 = 25;
n = n1 + 2*n2;
sr = [linspace(-0.175, -0.085, n2),linspace(-0.085, 0.085, n1),linspace(0.085, 0.175, n2)]'.*ones(n,4);
sa = [linspace(-0.2, -0.115, n2),linspace(-0.115, 0.115, n1),linspace(0.115, 0.2, n2)]'.*ones(n,4);
F_wz = 1500*ones(n,4);

F_wx_FL = zeros(n,n);
F_wy_FL = zeros(n,n);
for i=1:n
    for j=1:n
        [F_wy_ij, F_wx_ij, ~, ~] = calculate_tire_forces(F_wz(i,:),sa(i,:),sr(j,:),pac);
        F_wx_FL(i,j) = F_wx_ij(1);
        F_wy_FL(i,j) = F_wy_ij(1);
    end
end

Mu_x_FL = F_wx_FL ./ F_wz(:,1);
Mu_y_FL = F_wy_FL ./ F_wz(:,1);
Mu_comb_FL = sqrt(Mu_x_FL.*Mu_x_FL + Mu_y_FL.*Mu_y_FL);

figure
s1 = surf(sr(:,1),sa(:,1),Mu_x_FL);
set(s1, 'FaceColor', [0.2 0.8 0.2], ...   % green
         'EdgeColor', 'none', ...
         'FaceAlpha', 0.75);


title('$\mu_x$ Pacejka MF 6.1', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Slip ratio', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Slip angle (rad)', 'Interpreter', 'latex', 'FontSize', 12);
zlabel('Longitudinal coefficient', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor

figure
s1 = surf(sr(:,1),sa(:,1),Mu_y_FL);
set(s1, 'FaceColor', [0.2 0.8 0.2], ...   % green
         'EdgeColor', 'none', ...
         'FaceAlpha', 0.75);

title('$\mu_y$ Pacejka MF 6.1', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Slip ratio', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Slip angle (rad)', 'Interpreter', 'latex', 'FontSize', 12);
zlabel('Lateral coefficient', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor

figure
s1 = surf(sr(:,1),sa(:,1),Mu_comb_FL);
set(s1, 'FaceColor', [0.2 0.8 0.2], ...   % green
         'EdgeColor', 'none', ...
         'FaceAlpha', 0.75);

title('$\mu$ Pacejka MF 6.1', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Slip ratio', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Slip angle (rad)', 'Interpreter', 'latex', 'FontSize', 12);
zlabel('Combined coefficient', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor

%% Fit combined parameters
% Initial parameters 
pComb = load('fitted_parameters_comb_sim5.mat').params;

dMu_x00 = pComb.dMu_x0;
Mu_x_M0 = pComb.Mu_x_M;
Mu_x_S0 = pComb.Mu_x_S;
s_x_M0 = pComb.s_x_M;
s_x_S0 =  pComb.s_x_S;
px0 = [dMu_x00; Mu_x_M0; Mu_x_S0; s_x_M0; s_x_S0];

% lb_x = [0; 0.5; 0.5; 0.065; 0.075];
lb_x = zeros(5,1);
% ub_x = [100; 1.25; 1.2; 0.085; 0.4];
ub_x = [100; 2; 2; 2; 2];


dMu_y00 = pComb.dMu_y0;
Mu_y_M0 = pComb.Mu_y_M;
Mu_y_S0 = pComb.Mu_y_S;
s_y_M0 = pComb.s_y_M;
s_y_S0 =  pComb.s_y_S;
py0 = [dMu_y00; Mu_y_M0; Mu_y_S0; s_y_M0; s_y_S0];

% lb_y = [0; 0.95; 0.6; 0.075; 0.1];
lb_y = zeros(5,1);
% ub_y = [100; 1.35; 1.3; 0.115; 0.4];
ub_y = [100; 2; 2; 2; 2];

p0 = [px0; py0];
lb = [lb_x; lb_y];
ub = [ub_x; ub_y];

in_fit = zeros(n*n, 2);
Mu_comb_FL_fit = zeros(n*n, 1);
Mu_comb_FL_fit_x = zeros(n*n, 1);
Mu_comb_FL_fit_y = zeros(n*n, 1);
k = 1;
for i = 1:n
    for j = 1:n
        in_fit(k,:) = [sr(j,1), sa(i,1)];
        Mu_comb_FL_fit(k) = Mu_comb_FL(i,j);
        Mu_comb_FL_fit_x(k) = Mu_x_FL(i,j);
        Mu_comb_FL_fit_y(k) = Mu_y_FL(i,j);
        k = k + 1;
    end
end

%% Fit to Mu_comb
mu_comb_vect = @(p, inFL) arrayfun(@(i) mu_comb(p, inFL(i,:)), 1:size(inFL,1))';

phii = @(p,in) atan2(in(2)/(p(9)/(p(4)+p(9)) + (p(7)/p(6))/(p(2)/p(1)+p(7)/p(6))), in(1)/(p(4)/(p(4)+p(9)) + (p(2)/p(1))/(p(2)/p(1)+p(7)/p(6))));
mu_comb_vect_x = @(p, inFL) arrayfun(@(i) cos(phii(p,inFL(i,:)))*mu_comb(p, inFL(i,:)), 1:size(inFL,1))';
mu_comb_vect_y = @(p, inFL) arrayfun(@(i) -sin(phii(p,inFL(i,:)))*mu_comb(p, inFL(i,:)), 1:size(inFL,1))';

% USING FMINCON TO IMPOSE CONSTRAINTS
% Objective function: sum of squared residuals
% objfun = @(p) sum((mu_comb_vect(p, in_fit) - Mu_comb_FL_fit).^2);

objfun = @(p) sum(0.4*(mu_comb_vect(p, in_fit) - Mu_comb_FL_fit).^2 ...
    + 0.35*(mu_comb_vect_x(p, in_fit) - Mu_comb_FL_fit_x).^2 ...
    + 0.25*(mu_comb_vect_y(p, in_fit) - Mu_comb_FL_fit_y).^2);

% Linear constraints (s_x_M <= s_x_S, s_y_M <= s_y_S, F_x_M >= F_x_s, F_y_M >= F_y_S)
A = [0 0 0 1 -1 0 0 0 0 0;
    0 0 0 0 0 0 0 0 1 -1;
    0 -1 1 0 0 0 0 0 0 0;
    0 0 0 0 0 0 -1 1 0 0];
b = [0; -0.05; 0; 0];

% Nonlinear constraint function
nonlcon = @(p) deal([2*p(2)/p(4)-p(1); 2*p(7)/p(9)-p(6)], []);

% Optimization options
options = optimoptions('fmincon', 'Display', 'iter', 'Algorithm', 'sqp');

% Run optimization
p = fmincon(objfun, p0, A, b, [], [], lb, ub, nonlcon, options)


% Plot results
Mu_comb_FL_TME = zeros(n,n);
Mu_x_comb_FL_TME = zeros(n,n);
Mu_y_comb_FL_TME = zeros(n,n);
Mu_x_pure_FL_TME = zeros(n,n);
Mu_y_pure_FL_TME = zeros(n,n);

sx_norm = p(4)/(p(4)+p(9)) + (p(2)/p(1))/(p(2)/p(1)+p(7)/p(6));
sy_norm = p(9)/(p(4)+p(9)) + (p(7)/p(6))/(p(2)/p(1)+p(7)/p(6));

for i=1:n
    for j=1:n
        Mu_comb_FL_TME(i,j) = mu_comb(p, [sr(j,1),sa(i,1)]);
        phi = atan2(sa(i,1)/sy_norm, sr(j,1)/sx_norm);
        
        Mu_x_comb_FL_TME(i,j) = Mu_comb_FL_TME(i,j)*cos(phi);
        Mu_y_comb_FL_TME(i,j) = -Mu_comb_FL_TME(i,j)*sin(phi);
        Mu_x_pure_FL_TME(i,j) = mu_TME(p(1:5),sr(j,1));
        Mu_y_pure_FL_TME(i,j) = -mu_TME(p(6:10),sa(i,1));
    end
end

figure
legend_entries = cell(1,2);
legend_entries{1} = 'Pacejka MF 6.1';
legend_entries{2} = 'TMEasy Combined';

s1 = surf(sr(:,1),sa(:,1),Mu_comb_FL);
set(s1, 'FaceColor', [0.2 0.8 0.2], ...   % green
         'EdgeColor', 'none', ...
         'FaceAlpha', 0.6);
hold on

s2 = surf(sr(:,1),sa(:,1),Mu_comb_FL_TME);
set(s2, 'FaceColor', [0.2 0.2 0.8], ...   % blue
         'EdgeColor', 'none', ...
         'FaceAlpha', 0.6);

legend(legend_entries, 'Interpreter', 'latex', 'FontSize', 10, 'Location','northwest');
title('$\mu$ models comparison', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Slip ratio', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Slip angle', 'Interpreter', 'latex', 'FontSize', 12);
zlabel('Combined coefficient', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor

model_diff = abs(Mu_comb_FL - Mu_comb_FL_TME);
mean_diff = mean(mean(model_diff));

figure
surf(sr(:,1), sa(:,1), model_diff);
xlabel('Slip ratio')
ylabel('Slip angle')
zlabel('Model difference')
title(['Mean diff = ',num2str(mean_diff)])
colormap jet
colorbar

figure
legend_entries = cell(1,2);
legend_entries{1} = 'Pacejka MF 6.1';
legend_entries{2} = 'TMEasy Combined';
legend_entries{3} = 'TMEasy Pure';

s1 = surf(sr(:,1),sa(:,1),Mu_x_FL);
set(s1, 'FaceColor', [0.2 0.8 0.2], ...   % green
         'EdgeColor', 'none', ...
         'FaceAlpha', 0.6);
hold on

s2 = surf(sr(:,1),sa(:,1),Mu_x_comb_FL_TME);
set(s2, 'FaceColor', [0.2 0.2 0.8], ...   % blue
         'EdgeColor', 'none', ...
         'FaceAlpha', 0.6);

s3 = surf(sr(:,1),sa(:,1),Mu_x_pure_FL_TME);
set(s3, 'FaceColor', [0.8 0.2 0.2], ...   % red
         'EdgeColor', 'none', ...
         'FaceAlpha', 0.6);

legend(legend_entries, 'Interpreter', 'latex', 'FontSize', 10, 'Location','northwest');
title('$\mu_x$ models comparison', 'Interpreter','latex', 'FontSize', 14);
xlabel('Slip ratio', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Slip angle (rad)', 'Interpreter', 'latex', 'FontSize', 12);
zlabel('Longitudinal coefficient', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor

figure
s1 = surf(sr(:,1),sa(:,1),Mu_y_FL);
set(s1, 'FaceColor', [0.2 0.8 0.2], ...   % green
         'EdgeColor', 'none', ...
         'FaceAlpha', 0.6);
hold on

s2 = surf(sr(:,1),sa(:,1),Mu_y_comb_FL_TME);
set(s2, 'FaceColor', [0.2 0.2 0.8], ...   % blue
         'EdgeColor', 'none', ...
         'FaceAlpha', 0.6);

s3 = surf(sr(:,1),sa(:,1),Mu_y_pure_FL_TME);
set(s3, 'FaceColor', [0.8 0.2 0.2], ...   % red
         'EdgeColor', 'none', ...
         'FaceAlpha', 0.6);

legend(legend_entries, 'Interpreter', 'latex', 'FontSize', 10, 'Location','northeast');
title('$\mu_y$ models comparison', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Slip ratio', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Slip angle (rad)', 'Interpreter', 'latex', 'FontSize', 12);
zlabel('Lateral coefficient', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor

%% Save fitted parameters
filename = 'Functions/vdc_functions/state_estimation/TMEasy_model_fitting/fitted_parameters_comb_sim8.mat';
param_names = {'dMu_x0', 'Mu_x_M', 'Mu_x_S', 's_x_M', 's_x_S', 'dMu_y0', 'Mu_y_M', 'Mu_y_S', 's_y_M', 's_y_S'};

params = struct();
for i = 1:length(param_names)
    params.(param_names{i}) = p(i);
end

save(filename, 'params');
disp(['Parameters saved to ', filename]);

