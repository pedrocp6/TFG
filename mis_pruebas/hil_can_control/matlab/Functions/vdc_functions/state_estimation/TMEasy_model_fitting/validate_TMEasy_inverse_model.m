%% Load simulation data 
close all
clc
launch_simulation;

%% Calculate forces on wheels
sa_real = out.tire_bus.signals.values(:, 1:4);
sr_real = out.tire_bus.signals.values(:, 5:8);
F_wz_real = out.tire_bus.signals.values(:, 9:12);
F_wy_real = out.tire_bus.signals.values(:, 13:16);
F_wx_real = out.tire_bus.signals.values(:, 17:20);
n = length(time);

% %% Validate TMEasy (F_wx)
% px = load('fitted_parameters_comb_sim1.mat').params;
% 
% mu_scalar_x = @(p, s) sign(s) .* ((abs(s) <= p.s_x_M) .* (p.s_x_M*p.dMu_x0*(abs(s)/p.s_x_M) / (1 + (abs(s)/p.s_x_M) * ((abs(s)/p.s_x_M) + p.dMu_x0*p.s_x_M/p.Mu_x_M -2))) ...
%  + (p.s_x_M <= abs(s)) .* (abs(s) <= p.s_x_S) .* (p.Mu_x_M - (p.Mu_x_M - p.Mu_x_S) * ((abs(s) - p.s_x_M)/(p.s_x_S - p.s_x_M))^2 * (3 - 2*(abs(s) - p.s_x_M)/(p.s_x_S - p.s_x_M))) ...
%  + (abs(s) > p.s_x_S) .* (p.Mu_x_S));
% 
% mu_x = @(p, s) arrayfun(@(s) mu_scalar_x(p, s), s);
% 
% F_wx_TME = F_wz_real .* [mu_x(px, sr_real(:, 1)), ...
%             mu_x(px, sr_real(:, 2)), ...
%             mu_x(px, sr_real(:, 3)), ...
%             mu_x(px, sr_real(:, 4))];
% 
% figure
% plot(F_wx_TME(:, 1))
% hold on
% plot(F_wx_real(:, 1))
% legend('F_w_x_,_F_L TMEasy', 'F_w_x_,_F_L Pacejka')
% title('TMEasy vs Pacejka')
% 
% figure
% plot(F_wx_TME(:, 2))
% hold on
% plot(F_wx_real(:, 2))
% legend('F_w_x_,_F_R TMEasy', 'F_w_x_,_F_R Pacejka')
% title('TMEasy vs Pacejka')
% 
% figure
% plot(F_wx_TME(:, 3))
% hold on
% plot(F_wx_real(:, 3))
% legend('F_w_x_,_R_L TMEasy', 'F_w_x_,_R_L Pacejka')
% title('TMEasy vs Pacejka')
% 
% figure
% plot(F_wx_TME(:, 4))
% hold on
% plot(F_wx_real(:, 4))
% legend('F_w_x_,_R_R TMEasy', 'F_w_x_,_R_R Pacejka')
% title('TMEasy vs Pacejka')
% 
% %% Calculate SR from TMEasy
% sr_est = zeros(n, 4);
% sr_est(1, :) = sr_real(1, :);
% 
% dF_x0 = px.dMu_x0 * F_wz_real;
% F_x_M = px.Mu_x_M * F_wz_real;
% F_x_S = px.Mu_x_S * F_wz_real;
% s_x_M = px.s_x_M;
% s_x_S = px.s_x_S;
% 
% for i = 2:n
%     sr = zeros(4, 1);
%     for j = 1:4
%         % First piece
%         a = 1;
%         b = dF_x0(i,j) * s_x_M * (1/F_x_M(i,j) - 1/F_wx_real(i,j)) -2;
%         c = 1;
% 
%         if(b^2 - 4*a*c < 0) % --> F_wx > F_x_m --> sr ~ s_x_M
%             s1 = sign(F_wx_real(i,j)) * s_x_M;
%         else
%             sigma1 = [(-b +sqrt(b^2 - 4*a*c))/(2*a); (-b - sqrt(b^2 - 4*a*c))/(2*a)];
% 
%             s1 = sigma1 * s_x_M;                                % Obtain SR
%             s1 = s1(abs(s1) <= s_x_M);                          % Check domain of definition
%         end
% 
%         % Second piece
%         a = 2;
%         b = -3;
%         c = 0;
%         d = (F_wx_TME(i,j) - F_x_M(i,j)) / (F_x_S(i,j) - F_x_M(i,j));
% 
%         p = (3*a*c - b^2)/(3*a^2);
%         q = (2*b^3 - 9*a*b*c + 27*a^2*d)/(27*a^3);
%         D = (q/2)^2 + (p/3)^3;
% 
%         if(D<0)
%             r = sqrt(abs(p/3)^3);
%             theta = acos(-q/(2*r));
%             sigma2 = -b/(3*a) + 2*sqrt(-p/3)*[cos(theta/3); cos((theta+2*pi)/3); cos((theta+4*pi)/3)];
%         else
%             alpha = nthroot(-q/2 + sqrt(D), 3);
%             beta = nthroot(-q/2 - sqrt(D), 3);
%             sigma2 = alpha + beta;
%         end
% 
%         s2 = (s_x_S - s_x_M) * sigma2 + s_x_M;               % Obtain SR
%         s2 = s2((s_x_M <= abs(s2)) & (abs(s2) <= s_x_S));    % Check domain of definition
% 
%         % Choose solution
%         if(abs(F_wx_real(i,j)) < F_x_S(i,j) && ~isempty(s1))
%             [~,k] = min(abs(s1 - sr_est(i-1,j)));
%             sr(j) = s1(k);
%         elseif(~isempty([s1; s2]))
%             s = [s1; s2];
%             [~,k] = min(abs(s - sr_est(i-1,j)));
%             sr(j) = s(k);
%         end
%     end
% 
%     sr_est(i,:) = sr;
% end
% 
% % Compare results
% figure
% plot(sr_est(:, 1))
% hold on
% plot(sr_real(:, 1))
% legend('sr_F_L est', 'sr_F_L reference')
% title('TMEasy inverse SR')
% 
% figure
% plot(sr_est(:, 2))
% hold on
% plot(sr_real(:, 2))
% legend('sr_F_R est', 'sr_F_R reference')
% title('TMEasy inverse SR')
% 
% figure
% plot(sr_est(:, 3))
% hold on
% plot(sr_real(:, 3))
% legend('sr_R_L est', 'sr_R_L reference')
% title('TMEasy inverse SR')
% 
% figure
% plot(sr_est(:, 4))
% hold on
% plot(sr_real(:, 4))
% legend('sr_R_R est', 'sr_R_R reference')
% title('TMEasy inverse SR')
% 
% %% Validate TMEasy (F_wy)
% paramsY = load('fitted_parameters_lat_sim33.mat');
% py = paramsY.params;
% 
% mu_scalar_y = @(p, s) -sign(s) .* ((abs(s) <= p.s_y_M) .* (p.s_y_M*p.dMu_y0*(abs(s)/p.s_y_M) / (1 + (abs(s)/p.s_y_M) * ((abs(s)/p.s_y_M) + p.dMu_y0*p.s_y_M/p.Mu_y_M -2))) ...
%  + (p.s_y_M <= abs(s)) .* (abs(s) <= p.s_y_S) .* (p.Mu_y_M - (p.Mu_y_M - p.Mu_y_S) * ((abs(s) - p.s_y_M)/(p.s_y_S - p.s_y_M))^2 * (3 - 2*(abs(s) - p.s_y_M)/(p.s_y_S - p.s_y_M))) ...
%  + (abs(s) > p.s_y_S) .* (p.Mu_y_S));
% 
% mu_y = @(p, s) arrayfun(@(s) mu_scalar_y(p, s), s);
% 
% F_wy_TME = F_wz_real .* [mu_y(py, sa_real(:, 1)), ...
%             mu_y(py, sa_real(:, 2)), ...
%             mu_y(py, sa_real(:, 3)), ...
%             mu_y(py, sa_real(:, 4))];
% 
% figure
% plot(F_wy_TME(:, 1))
% hold on
% plot(F_wy_real(:, 1))
% legend('F_w_y_,_F_L TMEasy', 'F_w_y_,_F_L Pacejka')
% title('TMEasy vs Pacejka')
% 
% figure(10)
% plot(F_wy_TME(:, 2))
% hold on
% plot(F_wy_real(:, 2))
% legend('F_w_y_,_F_R TMEasy', 'F_w_y_,_F_R Pacejka')
% title('TMEasy vs Pacejka')
% 
% figure(11)
% plot(F_wy_TME(:, 3))
% hold on
% plot(F_wy_real(:, 3))
% legend('F_w_y_,_R_L TMEasy', 'F_w_y_,_R_L Pacejka')
% title('TMEasy vs Pacejka')
% 
% figure(12)
% plot(F_wy_TME(:, 4))
% hold on
% plot(F_wy_real(:, 4))
% legend('F_w_y_,_R_R TMEasy', 'F_w_y_,_R_R Pacejka')
% title('TMEasy vs Pacejka')
% 
% %% Calculate SA from TMEasy
% dF_y0 = py.dMu_y0 * F_wz_real;
% F_y_M = py.Mu_y_M * F_wz_real;
% F_y_S = py.Mu_y_S * F_wz_real;
% s_y_M = py.s_y_M;
% s_y_S = py.s_y_S;
% 
% sa_est = zeros(n, 4);
% sa_est(1, :) = sa_real(1, :);
% 
% 
% for i = 2:n
%     sa = zeros(4,1);
%     for j = 1:4
%         % First piece
%         a = 1;
%         b = dF_y0(i,j) * s_y_M * (1/F_y_M(i,j) - 1/F_wy_real(i,j)) -2;
%         c = 1;
% 
%         if(b^2 - 4*a*c < 0) % --> F_wy > F_y_m --> sa ~ s_y_M
%             s1 = sign(F_wy_real(i,j)) * s_y_M;
%         else
%             sigma1 = [(-b +sqrt(b^2 - 4*a*c))/(2*a); (-b - sqrt(b^2 - 4*a*c))/(2*a)];
% 
%             s1 = sigma1 * s_y_M;                                % Obtain SA
%             s1 = s1(abs(s1) <= s_y_M);                          % Check domain of definition
%         end
% 
%         % Second piece
%         a = 2;
%         b = -3;
%         c = 0;
%         d = (F_wy_real(i,j) - F_y_M(i,j)) / (F_y_S(i,j) - F_y_M(i,j));
% 
%         p = (3*a*c - b^2)/(3*a^2);
%         q = (2*b^3 - 9*a*b*c + 27*a^2*d)/(27*a^3);
%         D = (q/2)^2 + (p/3)^3;
% 
%         if(D<0)
%             r = sqrt(abs(p/3)^3);
%             theta = acos(-q/(2*r));
%             sigma2 = -b/(3*a) + 2*sqrt(-p/3)*[cos(theta/3); cos((theta+2*pi)/3); cos((theta+4*pi)/3)];
%         else
%             alpha = nthroot(-q/2 + sqrt(D), 3);
%             beta = nthroot(-q/2 - sqrt(D), 3);
%             sigma2 = alpha + beta;
%         end
% 
%         s2 = (s_y_S - s_y_M) * sigma2 + s_y_M;               % Obtain SA
%         s2 = s2((s_y_M <= abs(s2)) & (abs(s2) <= s_y_S));    % Check domain of definition
% 
%         % Choose solution
%         if(abs(F_wy_real(i,j)) < F_y_S(i,j) && ~isempty(s1))
%             [~, k] = min(abs(s1 + sa_est(i-1,j)));
%             sa(j) = s1(k); 
%         elseif(~isempty([s1; s2]))
%             s = [s1; s2];
%             [~, k] = min(abs(s + sa_est(i-1,j)));
%             sa(j) = s(k);
%         end
%         sa(j) = -sa(j);
%     end
% 
%     sa_est(i,:) = sa;
% end
% 
% %% Compare results
% figure(13)
% plot(sa_est(:, 1))
% hold on
% plot(sa_real(:, 1))
% legend('sa_F_L est', 'sa_F_L reference')
% title('TMEasy inverse SA')
% 
% figure(14)
% plot(sa_est(:, 2))
% hold on
% plot(sa_real(:, 2))
% legend('sa_F_R est', 'sa_F_R reference')
% title('TMEasy inverse SA')
% 
% figure(15)
% plot(sa_est(:, 3))
% hold on
% plot(sa_real(:, 3))
% legend('sa_R_L est', 'sa_R_L reference')
% title('TMEasy inverse SA')
% 
% figure(16)
% plot(sa_est(:, 4))
% hold on
% plot(sa_real(:, 4))
% legend('sa_R_R est', 'sa_R_R reference')
% title('TMEasy inverse SA')


%% Validate TMEasy (combined F)
paramsComb = load('fitted_parameters_comb_sim7_y.mat');
p = paramsComb.params;

dF_x0 = p.dMu_x0 .* F_wz_real;
F_x_M = p.Mu_x_M .* F_wz_real;
F_x_S = p.Mu_x_S .* F_wz_real;
s_x_M = p.s_x_M;
s_x_S = p.s_x_S;

dF_y0 = p.dMu_y0 .* F_wz_real;
F_y_M = p.Mu_y_M .* F_wz_real;
F_y_S = p.Mu_y_S .* F_wz_real;
s_y_M = p.s_y_M;
s_y_S = p.s_y_S;

sx_norm = s_x_M./(s_x_M + s_y_M) + (F_x_M./dF_x0)./(F_x_M./dF_x0 + F_y_M./dF_y0);
sy_norm = s_y_M./(s_x_M + s_y_M) + (F_y_M./dF_y0)./(F_x_M./dF_x0 + F_y_M./dF_y0);

F_real = sqrt(F_wx_real.^2 + F_wy_real.^2);
phi_real = atan2(F_wy_real, F_wx_real);
s_real = sqrt((sr_real ./ sx_norm).^2 + (sa_real ./ sy_norm).^2);

dF0 = sqrt((dF_x0 .* sx_norm .* cos(phi_real)).^2 + (dF_y0 .* sy_norm .* sin(phi_real)).^2);
F_M = sqrt((F_x_M .* cos(phi_real)).^2 + (F_y_M .* sin(phi_real)).^2);
F_S = sqrt((F_x_S .* cos(phi_real)).^2 + (F_y_S .* sin(phi_real)).^2);
s_M = sqrt((s_x_M ./ sx_norm .* cos(phi_real)).^2 + (s_y_M ./ sy_norm .* sin(phi_real)).^2);
s_S = sqrt((s_x_S ./ sx_norm .* cos(phi_real)).^2 + (s_y_S ./ sy_norm .* sin(phi_real)).^2);
p = [dF0 ./ F_wz_real; F_M ./ F_wz_real; F_S ./ F_wz_real; s_M; s_S];


mu_scalar = @(p, s) ((s <= p(4)) .* (p(4)*p(1)*(s/p(4)) / (1 + (s/p(4)) * ((s/p(4)) + p(1)*p(4)/p(2) -2))) ...
 + (p(4) < s) .* (s <= p(5)) .* (p(2) - (p(2) - p(3)) * ((s - p(4))/(p(5) - p(4)))^2 * (3 - 2*(s - p(4))/(p(5) - p(4)))) ...
 + (s > p(5)) .* (p(3)));

mu = @(p, s) arrayfun(@(s) mu_scalar(p, s), s);

F_TME = F_wz_real .* [mu(p, s_real(:, 1)), ...
            mu(p, s_real(:, 2)), ...
            mu(p, s_real(:, 3)), ...
            mu(p, s_real(:, 4))];

close all;

figure(17)
plot(F_TME(:, 1))
hold on
plot(F_real(:, 1))
legend('F_F_L TMEasy', 'F_F_L Pacejka')
title('TMEasy vs Pacejka (combined)')

figure(18)
plot(F_TME(:, 2))
hold on
plot(F_real(:, 2))
legend('F_F_R TMEasy', 'F_F_R Pacejka')
title('TMEasy vs Pacejka (combined)')

figure(19)
plot(F_TME(:, 3))
hold on
plot(F_real(:, 3))
legend('F_R_L TMEasy', 'F_R_L Pacejka')
title('TMEasy vs Pacejka (combined)')

figure(20)
plot(F_TME(:, 4))
hold on
plot(F_real(:, 4))
legend('F_R_R TMEasy', 'F_R_R Pacejka')
title('TMEasy vs Pacejka (combined)')

%% Calculate combined slip
sr_est = zeros(n, 4);
sr_est(1, :) = sr_real(1, :);

sa_est = zeros(n, 4);
sa_est(1, :) = sa_real(1, :);

s_est = zeros(n, 4);
s_est(1, :) = sqrt((sr_real(1,:) .* sx_norm(1,:)).^2 + (sa_real(1,:) .* sy_norm(1,:)).^2);
for i = 2:n
    for j = 1:4
        % First piece
        a = 1;
        b = dF0(i,j) * s_M(i,j) * (1/F_M(i,j) - 1/F_real(i,j)) -2;
        c = 1;

        if(b^2 - 4*a*c < 0) % --> F > F_m --> s ~ s_M
            s1 = s_M(i,j);
        else
            sigma1 = [(-b +sqrt(b^2 - 4*a*c))/(2*a); (-b - sqrt(b^2 - 4*a*c))/(2*a)];

            s1 = sigma1 * s_M(i,j);                                % Obtain combined slip
            s1 = s1((0 <= s1) & (s1 <= s_M(i,j)));                          % Check domain of definition
        end

        % Second piece
        a = 2;
        b = -3;
        c = 0;
        d = (F_real(i,j) - F_M(i,j)) / (F_S(i,j) - F_M(i,j));

        p = (3*a*c - b^2)/(3*a^2);
        q = (2*b^3 - 9*a*b*c + 27*a^2*d)/(27*a^3);
        D = (q/2)^2 + (p/3)^3;

        if(D<0)
            r = sqrt(abs(p/3)^3);
            theta = acos(-q/(2*r));
            sigma2 = -b/(3*a) + 2*sqrt(-p/3)*[cos(theta/3); cos((theta+2*pi)/3); cos((theta+4*pi)/3)];
        else
            alpha = nthroot(-q/2 + sqrt(D), 3);
            beta = nthroot(-q/2 - sqrt(D), 3);
            sigma2 = alpha + beta;
        end

        s2 = (s_S(i,j) - s_M(i,j)) * sigma2 + s_M(i,j);               % Obtain combined slip
        s2 = s2((s_M(i,j) < s2) & (s2 <= s_S(i,j)));    % Check domain of definition

        % Choose solution
        if(F_real(i,j) < F_S(i,j) && ~isempty(s1))
            [~, k] = min(abs(s1 - s_est(i-1,j))); 
            s_est(i,j) = s1(k); 
        elseif(~isempty([s1; s2]))
            ss = [s1; s2];
            [~, k] = min(abs(ss - s_est(i-1,j)));
            s_est(i,j) = ss(k);
        end

        sr_est(i,j) = s_est(i,j) * cos(phi_real(i,j)) * sx_norm(i,j);
        sa_est(i,j) = -s_est(i,j) * sin(phi_real(i,j)) * sy_norm(i,j);
    end
end

%% Compare results
legend_entries = cell(1,2);

figure(21)
plot(time, s_est(:, 1))
hold on
plot(time, s_real(:, 1))
legend_entries{1} = '$s_{FL}$ TMEasy';
legend_entries{2} = 'Reference';
legend(legend_entries, 'Interpreter', 'latex', 'FontSize', 10, 'Location','northeast');
title('TMEasy inverse $s_{FL}$ estimation', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Time (s)', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Combined slip', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor
hold off

figure(22)
plot(time, s_est(:, 2))
hold on
plot(time, s_real(:, 2))
legend_entries{1} = '$s_{FR}$ TMEasy';
legend(legend_entries, 'Interpreter', 'latex', 'FontSize', 10, 'Location','northeast');
title('TMEasy inverse $s_{FR}$ estimation', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Time (s)', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Combined slip', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor
hold off

figure(23)
plot(time, s_est(:, 3))
hold on
plot(time, s_real(:, 3))
legend_entries{1} = '$s_{RL}$ TMEasy';
legend(legend_entries, 'Interpreter', 'latex', 'FontSize', 10, 'Location','northeast');
title('TMEasy inverse $s_{RL}$ estimation', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Time (s)', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Combined slip', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor
hold off

figure(24)
plot(time, s_est(:, 4))
hold on
plot(time, s_real(:, 4))
legend_entries{1} = '$s_{RR}$ TMEasy';
legend(legend_entries, 'Interpreter', 'latex', 'FontSize', 10, 'Location','northeast');
title('TMEasy inverse $s_{RR}$ estimation', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Time (s)', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Combined slip', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor
hold off

figure(25)
plot(time, sr_est(:, 1))
hold on
plot(time, sr_real(:, 1))
legend_entries{1} = '$\lambda_{FL}$ TMEasy';
legend(legend_entries, 'Interpreter', 'latex', 'FontSize', 10, 'Location','northeast');
title('TMEasy inverse $\lambda_{FL}$ estimation', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Time (s)', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Slip ratio', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor
hold off

figure(26)
plot(time, sr_est(:, 2))
hold on
plot(time, sr_real(:, 2))
legend_entries{1} = '$\lambda_{FR}$ TMEasy';
legend(legend_entries, 'Interpreter', 'latex', 'FontSize', 10, 'Location','northeast');
title('TMEasy inverse $\lambda_{FR}$ estimation', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Time (s)', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Slip ratio', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor
hold off

figure(27)
plot(time, sr_est(:, 3))
hold on
plot(time, sr_real(:, 3))
legend_entries{1} = '$\lambda_{RL}$ TMEasy';
legend(legend_entries, 'Interpreter', 'latex', 'FontSize', 10, 'Location','northeast');
title('TMEasy inverse $\lambda_{RL}$ estimation', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Time (s)', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Slip ratio', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor
hold off

figure(28)
plot(time, sr_est(:, 4))
hold on
plot(time, sr_real(:, 4))
legend_entries{1} = '$\lambda_{RR}$ TMEasy';
legend(legend_entries, 'Interpreter', 'latex', 'FontSize', 10, 'Location','northeast');
title('TMEasy inverse $\lambda_{RR}$ estimation', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Time (s)', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Slip ratio', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor
hold off

figure(29)
plot(time, sa_est(:, 1))
hold on
plot(time, sa_real(:, 1))
legend_entries{1} = '$\alpha_{FL}$ TMEasy';
legend(legend_entries, 'Interpreter', 'latex', 'FontSize', 10, 'Location','northeast');
title('TMEasy inverse $\alpha_{FL}$ estimation', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Time (s)', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Slip angle (rad)', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor
hold off

figure(30)
plot(time, sa_est(:, 2))
hold on
plot(time, sa_real(:, 2))
legend_entries{1} = '$\alpha_{FR}$ TMEasy';
legend(legend_entries, 'Interpreter', 'latex', 'FontSize', 10, 'Location','northeast');
title('TMEasy inverse $\alpha_{FR}$ estimation', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Time (s)', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Slip angle (rad)', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor
hold off

figure(31)
plot(time, sa_est(:, 3))
hold on
plot(time, sa_real(:, 3))
legend_entries{1} = '$\alpha_{RL}$ TMEasy';
legend(legend_entries, 'Interpreter', 'latex', 'FontSize', 10, 'Location','northeast');
title('TMEasy inverse $\alpha_{RL}$ estimation', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Time (s)', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Slip angle (rad)', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor
hold off

figure(32)
plot(time, sa_est(:, 4))
hold on
plot(time, sa_real(:, 4))
legend_entries{1} = '$\alpha_{RR}$ TMEasy';
legend(legend_entries, 'Interpreter', 'latex', 'FontSize', 10, 'Location','northeast');
title('TMEasy inverse $\alpha_{RR}$ estimation', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('Time (s)', 'Interpreter', 'latex', 'FontSize', 12);
ylabel('Slip angle (rad)', 'Interpreter', 'latex', 'FontSize', 12);
set(gcf, 'Color', 'w')
grid on
grid minor
hold off