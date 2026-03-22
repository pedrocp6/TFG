%% Get test data
clear
simulation_setup
clc
close all

data = Protocolo_Carga_PC('can0_candump_2025-07-22_21-40-39(corrida_manual_2).txt');
idx = 1:247000;
% data = Protocolo_Carga_PC('can0_candump_2025-08-22_13-40-20(acceleration_manual).txt');
% idx=990100:1356000;
% data = Protocolo_Carga_PC('can0_candump_2025-10-21_13-49-10.txt');
% idx = 707000:1236000;
[tiempo_unique, idx_unique] = unique(data.tiempo(idx));
idx = idx(idx_unique);
tiempo = data.tiempo;

m = sum(data.vxGSS(idx).*data.vyGSS(idx))/sum(data.vxGSS(idx).^2);
gssAngle = atan(m);
vx = cos(gssAngle)*data.vxGSS + sin(gssAngle)*data.vyGSS;
vy = cos(gssAngle)*data.vyGSS - sin(gssAngle)*data.vxGSS;
figure
plot(data.vxGSS(idx), data.vyGSS(idx))
hold on
plot(data.vxGSS(idx), m*data.vxGSS(idx))
plot(vx(idx), vy(idx))
legend({'Original data', 'Linear regression', 'Rotated data'})
data.vxGSS  = vx;
data.vyGSS = vy;
data.SlipAngle = atan2(data.vyGSS, data.vxGSS);
data.vGSS = sqrt(data.vxGSS.^2 + data.vyGSS.^2);

extensometer_calibration(data);
param.mass = 340;
param.rdyn =  0.24;

n = 10000;
time_inst = linspace(tiempo(idx(1)), tiempo(idx(end)), n);

delta = zeros(length(idx), 4);
for i=1:length(idx)
    delta_ack = calculate_steering(data.steer(idx(i)), param);
    delta(i,:) = delta_ack';
end

v_wx_FL = interp1(tiempo(idx), data.vxGSS(idx).*cos(delta(:,1)) + data.vyGSS(idx).*sin(delta(:,1)) ...
    + (-0.5*param.trackwidthR*cos(delta(:,1))+param.lf*sin(delta(:,1))).*data.yawRateGSS(idx), time_inst);
v_wy_FL = interp1(tiempo(idx), data.vyGSS(idx).*cos(delta(:,1)) - data.vxGSS(idx).*sin(delta(:,1)) ...
    + (0.5*param.trackwidthR*sin(delta(:,1))+param.lf*cos(delta(:,1))).*data.yawRateGSS(idx), time_inst);
wFL = interp1(tiempo(idx), data.wFL(idx), time_inst);
srFL = (param.rdyn*wFL - v_wx_FL)./(v_wx_FL + eps);
saFL = atan2(v_wy_FL, v_wx_FL);

v_wx_FR = interp1(tiempo(idx), data.vxGSS(idx).*cos(delta(:,1)) + data.vyGSS(idx).*sin(delta(:,1)) ...
    + (0.5*param.trackwidthR*cos(delta(:,1))+param.lf*sin(delta(:,1))).*data.yawRateGSS(idx), time_inst);
v_wy_FR = interp1(tiempo(idx), data.vyGSS(idx).*cos(delta(:,1)) - data.vxGSS(idx).*sin(delta(:,1)) ...
    + (-0.5*param.trackwidthR*sin(delta(:,1))+param.lf*cos(delta(:,1))).*data.yawRateGSS(idx), time_inst);
wFR = interp1(tiempo(idx), data.wFR(idx), time_inst);
srFR = (param.rdyn*wFR - v_wx_FR)./(v_wx_FR + eps);
saFR = atan2(v_wy_FR, v_wx_FR);

v_wx_RL = interp1(tiempo(idx), data.vxGSS(idx)-0.5*param.trackwidthR*data.yawRateGSS(idx), time_inst);
v_wy_RL = interp1(tiempo(idx), data.vyGSS(idx)-param.lr*data.yawRateGSS(idx), time_inst);
wRL = interp1(tiempo(idx), data.wRL(idx), time_inst);
srRL = (param.rdyn*wRL - v_wx_RL)./(v_wx_RL + eps);
saRL = atan2(v_wy_RL, v_wx_RL);

v_wx_RR = interp1(tiempo(idx), data.vxGSS(idx)+0.5*param.trackwidthR*data.yawRateGSS(idx), time_inst);
v_wy_RR = v_wy_RL;
wRR = interp1(tiempo(idx), data.wRR(idx), time_inst);
srRR = (param.rdyn*wRR - v_wx_RR)./(v_wx_RR + eps);
saRR = atan2(v_wy_RR, v_wx_RR);

T_FL = interp1(tiempo(idx), data.torFL(idx), time_inst);
T_FR = interp1(tiempo(idx), data.torFR(idx), time_inst);
T_RL = interp1(tiempo(idx), data.torRL(idx), time_inst);
T_RR = interp1(tiempo(idx), data.torRR(idx), time_inst);

ax = interp1(tiempo(idx), data.axGSS(idx), time_inst);
ay = interp1(tiempo(idx), data.ayGSS(idx), time_inst);
v = interp1(tiempo(idx), data.vGSS(idx), time_inst);
beta = interp1(tiempo(idx), data.SlipAngle(idx), time_inst);
delta = interp1(tiempo(idx), delta, time_inst);

F_wz_FL = zeros(n,1);
F_wz_FR = zeros(n,1);
F_wz_RL = zeros(n,1);
F_wz_RR = zeros(n,1);

Mu_x_FL = zeros(n,1);
Mu_x_FR = zeros(n,1);
Mu_x_RL = zeros(n,1);
Mu_x_RR = zeros(n,1);

Mu_y_FL = zeros(n,1);
Mu_y_FR = zeros(n,1);
Mu_y_RL = zeros(n,1);
Mu_y_RR = zeros(n,1);

Fx_total = param.mass*ax + cos(beta).*(0.5*param.rho*param.CDA*v.^2);
Fy_total = param.mass*ay + sin(beta).*(0.5*param.rho*param.CDA*v.^2);

for i=1:n
    Fz = calculate_tire_loads_vdc(ax(i), ay(i), v(i), param);
    F_wz_FL(i) = Fz(1);
    F_wz_FR(i) = Fz(2);
    F_wz_RL(i) = Fz(3);
    F_wz_RR(i) = Fz(4);    
end

Fz_total = F_wz_FL+F_wz_FR+F_wz_RL+F_wz_RR;

F_wx_FL = F_wz_FL./Fz_total.*Fx_total';
F_wx_FR = F_wz_FR./Fz_total.*Fx_total';
F_wx_RL = F_wz_RL./Fz_total.*Fx_total';
F_wx_RR = F_wz_RR./Fz_total.*Fx_total';

F_wy_FL = F_wz_FL./Fz_total.*Fy_total';
F_wy_FR = F_wz_FR./Fz_total.*Fy_total';
F_wy_RL = F_wz_RL./Fz_total.*Fy_total';
F_wy_RR = F_wz_RR./Fz_total.*Fy_total';

for i=1:n
    if abs(v_wx_FL(i)) < 1
        srFL(i) = param.rdyn*wFL(i) - v_wx_FL(i);
    end

    if abs(v_wx_FR(i)) < 1
        srFR(i) = param.rdyn*wFR(i) - v_wx_FR(i);
    end

    if abs(v_wx_RL(i)) < 1
        srRL(i) = param.rdyn*wRL(i) - v_wx_RL(i);
    end

    if abs(v_wx_RR(i)) < 1
        srRR(i) = param.rdyn*wRR(i) - v_wx_RR(i);
    end

    if(isnan(F_wx_FL(i)) || abs(F_wx_FL(i)) > 2000 || abs(srFL(i)) > 2)
        if(i>1)
            srFL(i) = srFL(i-1);
            F_wx_FL(i) =  F_wx_FL(i-1);
        else
            srFL(i) = 0;
            F_wx_FL(i) = 0;
        end
    end

    if(isnan(F_wx_FR(i)) || abs(F_wx_FR(i)) > 2000 || abs(srFR(i)) > 2)
        if(i>1)
            srFR(i) = srFR(i-1);
            F_wx_FR(i) =  F_wx_FR(i-1);
        else
            srFR(i) = 0;
            F_wx_FR(i) = 0;
        end
    end

    if(isnan(F_wx_RL(i)) || abs(F_wx_RL(i)) > 2000 || abs(srRL(i)) > 2)
        if(i>1)
            srRL(i) = srRL(i-1);
            F_wx_RL(i) =  F_wx_RL(i-1);
        else
            srRL(i) = 0;
            F_wx_RL(i) = 0;
        end
    end

    if(isnan(F_wx_RR(i)) || abs(F_wx_RR(i)) > 2000 || abs(srRR(i)) > 2)
        if(i>1)
            srRR(i) = srRR(i-1);
            F_wx_RR(i) =  F_wx_RR(i-1);
        else
            srRR(i) = 0;
            F_wx_RR(i) = 0;
        end
    end

    if(abs(F_wz_FL(i))>0.5)
       Mu_x_FL(i) = F_wx_FL(i)/F_wz_FL(i);
    else 
        Mu_x_FL(i) = 0;
    end

    if(abs(F_wz_FR(i))>0.5)
       Mu_x_FR(i) = F_wx_FR(i)/F_wz_FR(i);
    else 
        Mu_x_FR(i) = 0;
    end

    if(abs(F_wz_RL(i))>0.5)
       Mu_x_RL(i) = F_wx_RL(i)/F_wz_RL(i);
    else 
        Mu_x_RL(i) = 0;
    end

    if(abs(F_wz_RR(i))>0.5)
       Mu_x_RR(i) = F_wx_RR(i)/F_wz_RR(i);
    else 
        Mu_x_RR(i) = 0;
    end

    if(abs(F_wz_FL(i))>0.5)
       Mu_y_FL(i) = F_wy_FL(i)/F_wz_FL(i);
    else 
       Mu_y_FL(i) = 0;
    end

    if(abs(F_wz_FR(i))>0.5)
       Mu_y_FR(i) = F_wy_FR(i)/F_wz_FR(i);
    else 
       Mu_y_FR(i) = 0;
    end

    if(abs(F_wz_RL(i))>0.5)
       Mu_y_RL(i) = F_wy_RL(i)/F_wz_RL(i);
    else 
       Mu_y_RL(i) = 0;
    end

    if(abs(F_wz_RR(i))>0.5)
       Mu_y_RR(i) = F_wy_RR(i)/F_wz_RR(i);
    else 
       Mu_y_RR(i) = 0;
    end
end

figure
legend_entries = cell(1,4);
legend_entries{1} = '$\mu_{x,FL}$';
legend_entries{2} = '$\mu_{x,FR}$';
legend_entries{3} = '$\mu_{x,RL}$';
legend_entries{4} = '$\mu_{x,RR}$';
plot(srFL, Mu_x_FL, '.')
hold on
plot(srFR, Mu_x_FR, '.')
plot(srRL, Mu_x_RL, '.')
plot(srRR, Mu_x_RR, '.')
legend(legend_entries, 'Interpreter', 'latex', 'FontSize', 10, 'Location','northwest');
title('$\mu_x$ test data', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Slip ratio', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Longitudinal coefficient', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor

figure
legend_entries = cell(1,4);
legend_entries{1} = '$\mu_{y,FL}$';
legend_entries{2} = '$\mu_{y,FR}$';
legend_entries{3} = '$\mu_{y,RL}$';
legend_entries{4} = '$\mu_{y,RR}$';
plot(saFL, Mu_y_FL, '.')
hold on
plot(saFR, Mu_y_FR, '.')
plot(saRL, Mu_y_RL, '.')
plot(saRR, Mu_y_RR, '.')
legend(legend_entries, 'Interpreter', 'latex', 'FontSize', 10, 'Location','northwest');
title('$\mu_y$ test data', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Slip angle', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Longitudinal coefficient', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor

%%  HOT FIX
srFL = srFL-0.03;
srFR = srFR-0.03;
srRL = srRL-0.03;
srRR = srRR-0.03;

saFL = saFL+0.01;
saFR = saFR+0.01;
saRL = saRL+0.01;
saRR = saRR+0.01;

%% Fit combined parameters
% Initial parameters 
pComb = load('fitted_parameters_comb_test.mat').params;

dMu_x00 = pComb.dMu_x0;
Mu_x_M0 = pComb.Mu_x_M;
Mu_x_S0 = pComb.Mu_x_S;
s_x_M0 = pComb.s_x_M;
s_x_S0 =  pComb.s_x_S;
px0 = [dMu_x00; Mu_x_M0; Mu_x_S0; s_x_M0; s_x_S0];

lb_x = [20; 0.6; 0.4; 0.075; 0.075];
ub_x = [100; 0.8; 0.8; 0.1; 0.2];


dMu_y00 = pComb.dMu_y0;
Mu_y_M0 = pComb.Mu_y_M;
Mu_y_S0 = pComb.Mu_y_S;
s_y_M0 = pComb.s_y_M;
s_y_S0 =  pComb.s_y_S;
py0 = [dMu_y00; Mu_y_M0; Mu_y_S0; s_y_M0; s_y_S0];

lb_y = [20; 0.6; 0; 0.025; 0.025];
ub_y = [100; 1.2; 1.2; 0.075; 0.1];

p0 = [px0; py0];
lb = [lb_x; lb_y];
ub = [ub_x; ub_y];

%% Fit to test data
inFL = [srFL', saFL'];  
inFR = [srFR', saFR'];  
inRL = [srRL', saRL'];  
inRR = [srRR', saRR'];  

mu_comb_vect = @(p, in) arrayfun(@(i) mu_comb(p, in(i,:)), 1:size(in,1))';

phii = @(p,in) atan2(in(2)/(p(9)/(p(4)+p(9)) + (p(7)/p(6))/(p(2)/p(1)+p(7)/p(6))), in(1)/(p(4)/(p(4)+p(9)) + (p(2)/p(1))/(p(2)/p(1)+p(7)/p(6))));
mu_comb_vect_x = @(p, in) arrayfun(@(i) cos(phii(p,in(i,:)))*mu_comb(p, in(i,:)), 1:size(in,1))';
mu_comb_vect_y = @(p, in) arrayfun(@(i) -sin(phii(p,in(i,:)))*mu_comb(p, in(i,:)), 1:size(in,1))';

mu_pure_vect_x = @(p, in) arrayfun(@(i) mu_TME(p(1:5), in(i,1)), 1:size(in,1))';
mu_pure_vect_y = @(p, in) arrayfun(@(i) -mu_TME(p(6:10), in(i,2)), 1:size(in,1))'; 

F_pure_vect_x = @(p) F_wz_FL.*mu_pure_vect_x(p,inFL).*cos(delta(:,1)) + F_wz_FR.*mu_pure_vect_x(p,inFR).*cos(delta(:,2)) ...
    + F_wz_FL.*mu_pure_vect_y(p,inFL).*sin(delta(:,1)) + F_wz_FR.*mu_pure_vect_y(p,inFR).*sin(delta(:,2)) ...
    + F_wz_RL.*mu_pure_vect_x(p,inRL) + F_wz_RR.*mu_pure_vect_x(p,inRR);
F_pure_vect_y = @(p) F_wz_FL.*mu_pure_vect_y(p,inFL).*cos(delta(:,1)) + F_wz_FR.*mu_pure_vect_y(p,inFR).*cos(delta(:,2)) ...
    - F_wz_FL.*mu_pure_vect_x(p,inFL).*sin(delta(:,1)) - F_wz_FR.*mu_pure_vect_x(p,inFR).*sin(delta(:,2)) ...
    + F_wz_RL.*mu_pure_vect_y(p,inRL) + F_wz_RR.*mu_pure_vect_y(p,inRR);

F_comb_vect_x = @(p) F_wz_FL.*mu_comb_vect_x(p,inFL).*cos(delta(:,1)) + F_wz_FR.*mu_comb_vect_x(p,inFR).*cos(delta(:,2)) ...
    + F_wz_FL.*mu_comb_vect_y(p,inFL).*sin(delta(:,1)) + F_wz_FR.*mu_comb_vect_y(p,inFR).*sin(delta(:,2)) ...
    + F_wz_RL.*mu_comb_vect_x(p,inRL) + F_wz_RR.*mu_comb_vect_x(p,inRR);
F_comb_vect_y = @(p) F_wz_FL.*mu_comb_vect_y(p,inFL).*cos(delta(:,1)) + F_wz_FR.*mu_comb_vect_y(p,inFR).*cos(delta(:,2)) ...
    - F_wz_FL.*mu_comb_vect_x(p,inFL).*sin(delta(:,1)) - F_wz_FR.*mu_comb_vect_x(p,inFR).*sin(delta(:,2)) ...
    + F_wz_RL.*mu_comb_vect_y(p,inRL) + F_wz_RR.*mu_comb_vect_y(p,inRR);


Mu_y_pure_FL = mu_pure_vect_y(p0, inFL);
Mu_y_pure_FR = mu_pure_vect_y(p0, inFR);
Mu_y_pure_RL = mu_pure_vect_y(p0, inRL);
Mu_y_pure_RR = mu_pure_vect_y(p0, inRR);

Mu_comb_FL = sqrt(Mu_x_FL.^2 + Mu_y_pure_FL.^2);
Mu_comb_FR = sqrt(Mu_x_FR.^2 + Mu_y_pure_FR.^2);
Mu_comb_RL = sqrt(Mu_x_RL.^2 + Mu_y_pure_RL.^2);
Mu_comb_RR = sqrt(Mu_x_RR.^2 + Mu_y_pure_RR.^2);

% USING FMINCON TO IMPOSE CONSTRAINTS
% Objective function: sum of squared residuals

% objfun = @(p) 0.55*sum((mu_pure_vect_x(p, inRL) - Mu_x_RL).^2 + (mu_pure_vect_x(p, inRR) - Mu_x_RR).^2)...
%     + 0.*sum((mu_pure_vect_y(p, inRL) - Mu_y_RL).^2 + (mu_pure_vect_y(p, inRR) - Mu_y_RR).^2);

objfun = @(p) 0.5*sum((-0.2 < srRR & srRR < 0.2)' .* (mu_comb_vect_x(p, inRR) - Mu_x_RR).^2)...
    + 0.5*sum((-0.1 < saRR & saRR < 0.1)' .* (mu_comb_vect_y(p, inRR) - Mu_y_RR).^2);

% objfun = @(p) 0.45*sum((F_comb_vect_x(p) - Fx_total').^2) + 0.55*sum((F_comb_vect_y(p) - Fy_total').^2);

% Linear constraints (s_x_M <= s_x_S, s_y_M <= s_y_S, F_x_M >= F_x_s, F_y_M >= F_y_S)
A = [0 0 0 1 -1 0 0 0 0 0;
    0 0 0 0 0 0 0 0 1 -1;
    0 -1 1 0 0 0 0 0 0 0;
    0 0 0 0 0 0 -1 1 0 0];
b = [-0.0075; -0.005; 0; 0];

% Nonlinear constraint function
nonlcon = @(p) deal([2*p(2)/p(4)-p(1); 2*p(7)/p(9)-p(6)], []);

% Optimization options
options = optimoptions('fmincon', 'Display', 'iter', 'Algorithm', 'sqp');

% Run optimization
p = fmincon(objfun, p0, A, b, [], [], lb, ub, nonlcon, options)


% Plot results
Mu_comb_RL_TME = zeros(n,1);
Mu_x_comb_RL_TME = zeros(n,1);
Mu_comb_RR_TME = zeros(n,1);
Mu_x_comb_RR_TME = zeros(n,1);
Mu_x_pure_RL_TME = zeros(n,1);
Mu_x_pure_RR_TME = zeros(n,1);

sx_norm = p(4)/(p(4)+p(9)) + (p(2)/p(1))/(p(2)/p(1)+p(7)/p(6));
sy_norm = p(9)/(p(4)+p(9)) + (p(7)/p(6))/(p(2)/p(1)+p(7)/p(6));

for i=1:n
    Mu_comb_RL_TME(i) = mu_comb(p, [srRL(i),saRL(i)]);
    phiRL = atan2(saRL(i)/sy_norm, srRL(i)/sx_norm);
    Mu_x_comb_RL_TME(i) = Mu_comb_RL_TME(i)*cos(phiRL);
    Mu_x_pure_RL_TME(i) = mu_TME(p(1:5),srRL(i));

    Mu_comb_RR_TME(i) = mu_comb(p, [srRR(i),saRR(i)]);
    phiRR = atan2(saRR(i)/sy_norm, srRR(i)/sx_norm);
    Mu_x_comb_RR_TME(i) = Mu_comb_RR_TME(i)*cos(phiRR);
    Mu_x_pure_RR_TME(i) = mu_TME(p(1:5),srRR(i));
end

barrido_sr = linspace(-1.15, 1.15, 2500);
barrido_sa = linspace(-0.3, 0.3, 500);
surface_mu_pure_x_RR = zeros(500, 2500);
surface_mu_pure_y_RR = zeros(500, 2500);
surface_mu_comb_x_RR = zeros(500, 2500);
surface_mu_comb_y_RR = zeros(500, 2500);
surface_mu_comb_RR = zeros(500, 2500);

for i=1:500
    for j=1:2500
        surface_mu_pure_x_RR(i,j) = mu_TME(p(1:5), barrido_sr(j));
        surface_mu_pure_y_RR(i,j) = -mu_TME(p(6:10), barrido_sa(i));
        surface_mu_comb_RR(i,j) = mu_comb(p, [barrido_sr(j), barrido_sa(i)]);
        surface_mu_comb_x_RR(i,j) = cos(phii(p, [barrido_sr(j), barrido_sa(i)])) * surface_mu_comb_RR(i,j);
        surface_mu_comb_y_RR(i,j) = -sin(phii(p, [barrido_sr(j), barrido_sa(i)])) * surface_mu_comb_RR(i,j);
    end
end

Fx_pure = F_pure_vect_x(p);
Fy_pure = F_pure_vect_y(p);

Fx_comb = F_comb_vect_x(p);
Fy_comb = F_comb_vect_y(p);


figure
legend_entries = cell(1,3);
legend_entries{1} = 'Real $\mu_{x,RR}$';
legend_entries{2} = 'TME Pure $\mu_{x,RR}$';
legend_entries{3} = 'TME Combined $\mu_{x,RR}$';
plot3(srRR, saRR, Mu_x_RR, '.b', 'MarkerSize', 8); 
hold on
surf(barrido_sr, barrido_sa, surface_mu_pure_x_RR, ...
    'FaceColor', [0.8 0.2 0.2], ...  
    'FaceAlpha', 0.75, ...
    'EdgeColor', 'none');
surf(barrido_sr, barrido_sa, surface_mu_comb_x_RR, ...
    'FaceColor', [0.2 0.8 0.2], ...     
    'FaceAlpha', 0.75, ...
    'EdgeColor', 'none');
legend(legend_entries,'Interpreter', 'latex', 'FontSize', 10, 'Location','northwest');
title('$\mu_x$ models comparison', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Slip ratio', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Slip angle (rad)', 'Interpreter', 'latex', 'FontSize', 12);
zlabel('Longitudinal coefficient', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor
axis([-1. 1. -0.3 0.3 -2 2])

figure
legend_entries = cell(1,3);
legend_entries{1} = 'Real $\mu_{x,RR}$';
legend_entries{2} = 'TME Pure $\mu_{x,RR}$';
legend_entries{3} = 'TME Combined $\mu_{x,RR}$';
plot(srRR, Mu_x_RR, '.')
hold on
plot(srRR, Mu_x_pure_RR_TME, '.')
plot(srRR, Mu_x_comb_RR_TME, '.')
legend(legend_entries, 'Interpreter', 'latex', 'FontSize', 10, 'Location','northwest');
title('$\mu_x$ models comparison (RR)', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Slip ratio', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Longitudinal coefficient', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor

figure
legend_entries = cell(1,3);
legend_entries{1} = 'Real $F_{x}$';
legend_entries{2} = 'TME Pure $F_{x}$';
legend_entries{3} = 'TME Comb $F_{x}$';
plot(time_inst, Fx_total)
hold on
plot(time_inst, Fx_pure)
plot(time_inst, Fx_comb)
legend(legend_entries, 'Interpreter', 'latex', 'FontSize', 10, 'Location','northwest');
title('$F_x$ models comparison', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Time (s)', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Lateral force (N)', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor

figure
legend_entries = cell(1,3);
legend_entries{1} = 'Real $\mu_{y,mean}$';
legend_entries{2} = 'TME Pure $\mu_{y,RR}$';
legend_entries{3} = 'TME Combined $\mu_{y,RR}$';
plot(saRR, Mu_y_RR, '.')
hold on
plot(saRR, mu_pure_vect_y(p,inRR), '.')
plot(saRR, mu_comb_vect_y(p,inRR), '.')
legend(legend_entries, 'Interpreter', 'latex', 'FontSize', 10, 'Location','northwest');
title('$\mu_y$ models comparison (RR)', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Slip ratio', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Lateral coefficient', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor

figure
legend_entries = cell(1,3);
legend_entries{1} = 'Real $\mu_{y,mean}$';
legend_entries{2} = 'TME Pure $\mu_{y,RR}$';
legend_entries{3} = 'TME Combined $\mu_{y,RR}$';
plot3(srRR, saRR, Mu_y_RR, '.b', 'MarkerSize', 8); 
hold on
surf(barrido_sr, barrido_sa, surface_mu_pure_y_RR, ...
    'FaceColor', [0.8 0.2 0.2], ...  
    'FaceAlpha', 0.75, ...
    'EdgeColor', 'none');
surf(barrido_sr, barrido_sa, surface_mu_comb_y_RR, ...
    'FaceColor', [0.2 0.8 0.2], ...     
    'FaceAlpha', 0.75, ...
    'EdgeColor', 'none');
legend(legend_entries,'Interpreter', 'latex', 'FontSize', 10, 'Location','northwest');
title('$\mu_y$ models comparison (RR)', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Slip ratio', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Slip angle (rad)', 'Interpreter', 'latex', 'FontSize', 12);
zlabel('Lateral coefficient', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor
axis([-1. 1. -0.3 0.3 -2 2])

figure
legend_entries = cell(1,3);
legend_entries{1} = 'Real $F_y$';
legend_entries{2} = 'TME Pure $F_y$';
legend_entries{3} = 'TME Combined $F_y$';
plot(time_inst, Fy_total)
hold on
plot(time_inst, Fy_pure)
plot(time_inst, Fy_comb)
legend(legend_entries, 'Interpreter', 'latex', 'FontSize', 10, 'Location','northwest');
title('$F_y$ models comparison', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Time (s)', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Lateral force (N)', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor

figure
legend_entries = cell(1,2);
legend_entries{1} = 'Real $\mu_{RR}$';
legend_entries{2} = 'TME Combined $\mu_{RR}$';
plot3(srRR, saRR, Mu_comb_RR, '.b', 'MarkerSize', 8); 
hold on
surf(barrido_sr, barrido_sa, surface_mu_comb_RR, ...
    'FaceColor', [0.2 0.8 0.2], ...     
    'FaceAlpha', 0.75, ...
    'EdgeColor', 'none');
legend(legend_entries,'Interpreter', 'latex', 'FontSize', 10, 'Location','northwest');
title('$\mu$ models comparison (RR)', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Slip ratio', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Slip angle (rad)', 'Interpreter', 'latex', 'FontSize', 12);
zlabel('Combined coefficient', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor
axis([-0.5 0.5 -0.3 0.3 0 1.5])

%% Test TMEasy inverse model
sr_TME_Pure = zeros(n,4);
sa_TME_Pure = zeros(n,4);

sr_TME_Comb = zeros(n,4);
sa_TME_Comb = zeros(n,4);

for i=2:n
    % Pure slip ratio
    F_wx = [F_wx_FL(i); F_wx_FR(i); F_wx_RL(i); F_wx_RR(i)];
    F_wz = [F_wz_FL(i); F_wz_FR(i); F_wz_RL(i); F_wz_RR(i)];
    F_wy = [F_wy_FL(i); F_wy_FR(i); F_wy_RL(i); F_wy_RR(i)];

    dF_x0 = p(1) * F_wz;
    F_x_M = p(2) * F_wz;
    F_x_S = p(3) * F_wz;
    s_x_M = p(4);
    s_x_S = p(5);
    
    for j = 1:4
        % First piece
        a = 1;
        b = dF_x0(j) * s_x_M * (1/F_x_M(j) - 1/F_wx(j)) -2;
        c = 1;
    
        if(b^2 - 4*a*c < 0) % --> F_wx > F_x_m --> sr ~ s_x_M
            s1 = sign(F_wx(j)) * s_x_M;
        else
            sigma1 = [(-b +sqrt(b^2 - 4*a*c))/(2*a); (-b - sqrt(b^2 - 4*a*c))/(2*a)];
    
            s1 = sigma1 * s_x_M;                                % Obtain SR
            s1 = s1(abs(s1) <= s_x_M);                          % Check domain of definition
        end
    
        % Second piece
        a = 2;
        b = -3;
        c = 0;
        d = (F_wx(j) - F_x_M(j)) / (F_x_S(j) - F_x_M(j));
    
        P = (3*a*c - b^2)/(3*a^2);
        q = (2*b^3 - 9*a*b*c + 27*a^2*d)/(27*a^3);
        D = (q/2)^2 + (P/3)^3;
    
        if(D<0)
            r = sqrt(abs(P/3)^3);
            theta = acos(-q/(2*r));
            sigma2 = -b/(3*a) + 2*sqrt(-P/3)*[cos(theta/3); cos((theta+2*pi)/3); cos((theta+4*pi)/3)];
        else
            alpha = nthroot(-q/2 + sqrt(D), 3);
            betaa = nthroot(-q/2 - sqrt(D), 3);
            sigma2 = alpha + betaa;
        end
    
        s2 = (s_x_S - s_x_M) * sigma2 + s_x_M;               % Obtain SR
        s2 = s2((s_x_M <= abs(s2)) & (abs(s2) <= s_x_S));    % Check domain of definition
    
        % Choose solution
        if(abs(F_wx(j)) < F_x_S(j) && ~isempty(s1))
            [~,k] = min(abs(s1 - sr_TME_Pure(i-1,j)));
            sr_TME_Pure(i,j) = s1(k);
        elseif(~isempty([s1; s2]))
            s = [s1; s2];
            [~,k] = min(abs(s - sr_TME_Pure(i-1,j)));
            sr_TME_Pure(i,j) = s(k);
        end
    end
    
    % Pure slip angle
    dF_y0 = p(6) * F_wz;
    F_y_M = p(7) * F_wz;
    F_y_S = p(8) * F_wz;
    s_y_M = p(9);
    s_y_S = p(10);

    for j = 1:4
        % First piece
        a = 1;
        b = dF_y0(j) * s_y_M * (1/F_y_M(j) - 1/F_wy(j)) -2;
        c = 1;
    
        if(b^2 - 4*a*c < 0) % --> F_wy > F_y_m --> sa ~ s_y_M
            s1 = sign(F_wy(j)) * s_y_M;
        else
            sigma1 = [(-b +sqrt(b^2 - 4*a*c))/(2*a); (-b - sqrt(b^2 - 4*a*c))/(2*a)];
    
            s1 = sigma1 * s_y_M;                                % Obtain SA
            s1 = s1(abs(s1) <= s_y_M);                          % Check domain of definition
        end
    
        % Second piece
        a = 2;
        b = -3;
        c = 0;
        d = (F_wy(j) - F_y_M(j)) / (F_y_S(j) - F_y_M(j));
    
        P = (3*a*c - b^2)/(3*a^2);
        q = (2*b^3 - 9*a*b*c + 27*a^2*d)/(27*a^3);
        D = (q/2)^2 + (P/3)^3;
    
        if(D<0)
            r = sqrt(abs(P/3)^3);
            theta = acos(-q/(2*r));
            sigma2 = -b/(3*a) + 2*sqrt(-P/3)*[cos(theta/3); cos((theta+2*pi)/3); cos((theta+4*pi)/3)];
        else
            alpha = nthroot(-q/2 + sqrt(D), 3);
            betaa = nthroot(-q/2 - sqrt(D), 3);
            sigma2 = alpha + betaa;
        end
    
        s2 = (s_y_S - s_y_M) * sigma2 + s_y_M;               % Obtain SA
        s2 = s2((s_y_M <= abs(s2)) & (abs(s2) <= s_y_S));    % Check domain of definition
    
        % Choose solution
        if(abs(F_wy(j)) < F_y_S(j) && ~isempty(s1))
            [~, k] = min(abs(s1 + sa_TME_Pure(i-1,j)));
            sa_TME_Pure(i,j) = s1(k); 
        elseif(~isempty([s1; s2]))
            s = [s1; s2];
            [~, k] = min(abs(s + sa_TME_Pure(i-1,j)));
            sa_TME_Pure(i,j) = s(k);
        end
        sa_TME_Pure(i,j) = -sa_TME_Pure(i,j);
    end

    % Combined slip
    sx_norm = s_x_M./(s_x_M + s_y_M) + (F_x_M./dF_x0)./(F_x_M./dF_x0 + F_y_M./dF_y0);
    sy_norm = s_y_M./(s_x_M + s_y_M) + (F_y_M./dF_y0)./(F_x_M./dF_x0 + F_y_M./dF_y0);

    Fy_pure = sqrt(F_wx.^2 + F_wy.^2);
    phi = atan2(F_wy, F_wx);

    dF0 = sqrt((dF_x0 .* sx_norm .* cos(phi)).^2 + (dF_y0 .* sy_norm .* sin(phi)).^2);
    F_M = sqrt((F_x_M .* cos(phi)).^2 + (F_y_M .* sin(phi)).^2);
    F_S = sqrt((F_x_S .* cos(phi)).^2 + (F_y_S .* sin(phi)).^2);
    s_M = sqrt((s_x_M ./ sx_norm .* cos(phi)).^2 + (s_y_M ./ sy_norm .* sin(phi)).^2);
    s_S = sqrt((s_x_S ./ sx_norm .* cos(phi)).^2 + (s_y_S ./ sy_norm .* sin(phi)).^2);
    s_prev = sqrt((sr_TME_Comb(i-1,:)' ./ sx_norm .* cos(phi)).^2 + (sa_TME_Comb(i-1,:)' ./ sy_norm .* sin(phi)).^2);

    s = zeros(4,1);

    for j = 1:4
        % First piece
        a = 1;
        b = dF0(j) * s_M(j) * (1/F_M(j) - 1/Fy_pure(j)) -2;
        c = 1;

        if(b^2 - 4*a*c < 0) % --> F > F_m --> s ~ s_M
            s1 = s_M(j);
        else
            sigma1 = [(-b +sqrt(b^2 - 4*a*c))/(2*a); (-b - sqrt(b^2 - 4*a*c))/(2*a)];
            s1 = sigma1 * s_M(j);                        % Obtain combined slip
            s1 = s1((0 <= s1) & (s1 <= s_M(j)));                  % Check domain of definition
        end

        % Second piece
        a = 2;
        b = -3;
        c = 0;
        d = (Fy_pure(j) - F_M(j)) / (F_S(j) - F_M(j));

        P = (3*a*c - b^2)/(3*a^2);
        q = (2*b^3 - 9*a*b*c + 27*a^2*d)/(27*a^3);
        D = (q/2)^2 + (P/3)^3;

        if(D<0)
            r = sqrt(abs(P/3)^3);
            theta = acos(-q/(2*r));
            sigma2 = -b/(3*a) + 2*sqrt(-P/3)*[cos(theta/3); cos((theta+2*pi)/3); cos((theta+4*pi)/3)];
        else
            alpha = nthroot(-q/2 + sqrt(D), 3);
            betaa = nthroot(-q/2 - sqrt(D), 3);
            sigma2 = alpha + betaa;
        end

        s2 = (s_S(j) - s_M(j)) * sigma2 + s_M(j);               % Obtain combined slip
        s2 = s2((s_M(j) < s2) & (s2 <= s_S(j)));    % Check domain of definition

        % Choose solution
        if(Fy_pure(j) < F_S(j) && ~isempty(s1))
            [~, k] = min(abs(s1 - s_prev(j))); 
            s(j) = s1(k);
        elseif(~isempty([s1; s2]))
            ss = [s1; s2];
            [~, k] = min(abs(ss - s_prev(j)));
            s(j) = ss(k);
        end

        sr_TME_Comb(i,j) = s(j) * cos(phi(j)) * sx_norm(j);
        sa_TME_Comb(i,j) = -s(j) * sin(phi(j)) * sy_norm(j);
    end

end

figure
legend_entries = cell(1,3);
legend_entries{1} = 'Calculated $sr_{RL}$';
legend_entries{2} = 'TME Pure $sr_{RL}$';
legend_entries{3} = 'TME Combined $sr_{RL}$';
plot(time_inst, srRL)
hold on
plot(time_inst, sr_TME_Pure(:,3))
plot(time_inst, sr_TME_Comb(:,3))
legend(legend_entries, 'Interpreter', 'latex', 'FontSize', 10, 'Location','northeast');
title('TMEasy inverse model (Longitudinal)', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Time (s)', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Slip ratio', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor

figure
legend_entries = cell(1,3);
legend_entries{1} = 'Calculated $sa_{RL}$';
legend_entries{2} = 'TME Pure $sa_{RL}$';
legend_entries{3} = 'TME Combined $sa_{RL}$';
plot(time_inst, saRL)
hold on
plot(time_inst, sa_TME_Pure(:,3))
plot(time_inst, sa_TME_Comb(:,3))
legend(legend_entries, 'Interpreter', 'latex', 'FontSize', 10, 'Location','northeast');
title('TMEasy inverse model (Lateral)', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Time (s)', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Slip angle (rad)', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor

%% Save fitted parameters
filename = 'Functions/vdc_functions/state_estimation/TMEasy_model_fitting/fitted_parameters_comb_test3.mat';
param_names = {'dMu_x0', 'Mu_x_M', 'Mu_x_S', 's_x_M', 's_x_S', 'dMu_y0', 'Mu_y_M', 'Mu_y_S', 's_y_M', 's_y_S'};

params = struct();
for i = 1:length(param_names)
    params.(param_names{i}) = p(i);
end

save(filename, 'params');
disp(['Parameters saved to ', filename]);

