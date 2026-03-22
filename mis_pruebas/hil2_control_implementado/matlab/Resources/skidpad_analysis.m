%% Calculations
time_limit = interp1(k_calc,time,1/9.625);

v_limit = interp1(time,v,time_limit)
ay_limit = interp1(time,ay,time_limit)
time_skidpad = 2*pi*9.625/v_limit

%% Visualization

figure('Name','Skidpad trajectory')
hold on
axis equal
plot(9.125*cos(time)-0.7,9.125*sin(time)+9.125,'--k')
plot(7.625*cos(time)-0.7,7.625*sin(time)+9.125,'k')
plot(10.625*cos(time)-0.7,10.625*sin(time)+9.125,'k')
plot(out.logsout{10}.Values.Data,out.logsout{11}.Values.Data,'r')
plot(9.625*cos(time)-0.7,9.625*sin(time)+9.125,'-.b')
plot(8.625*cos(time)-0.7,8.625*sin(time)+9.125,'-.b')

figure('Name','Skidpad k limits')
hold on
plot(v,v*0+1/9.125,'--k')
plot(v,v*0+1/8.625,'-.b')
plot(v,v*0+1/9.625,'-.b')
plot(v,k_calc,'r')