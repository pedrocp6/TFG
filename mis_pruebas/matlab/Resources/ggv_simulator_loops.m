N = length(k);
ds = diff(s);

v0 = 10;

params.g = 9.81;
params.muy = 1.2;
params.mux = 1.0;
params.mux_brake = 1.4;
params.Clift = 0.5*1.2*4.0;
params.Cdrag = 0.5*1.2*1.2;
params.m = 300;

vmax = 40;
v_grip = min(vmax,calculate_apex(k,params));
vel = zeros(N,1);
vel(1) = v0;

for i = 1:N-1
    ax_max = ggv_ax_max(vel(i),k(i),params);
    vel(i+1) = sqrt(vel(i)^2 + 2*abs(ax_max)*ds(i));
    if vel(i+1)>v_grip(i+1)
        vel(i+1) = v_grip(i+1);
    end
end

vel(1) = vel(end);
for i = 1:N-1
    ax_max = ggv_ax_max(vel(i),k(i),params);
    vel(i+1) = sqrt(vel(i)^2 + 2*abs(ax_max)*ds(i));
    if vel(i+1)>v_grip(i+1)
        vel(i+1) = v_grip(i+1);
    end
end

for j = N:-1:2
    ax_brake_max = ggv_ax_brake(vel(j),k(j),params);
    vel_brake = sqrt(vel(j)^2 + 2*abs(ax_brake_max)*ds(j-1));
    if vel_brake < vel(j-1)
        vel(j-1) = vel_brake;
    end
end

%% Check acceleration

% ax = [diff(vel.^2)./ds/2;0];
% ay = k.*vel.^2;
% 
% % scatter(ay,ax,5,vel)
% plot(vel)