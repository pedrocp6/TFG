clear 
clc
simulation_setup

%Keep in the same level logs and DIN-DataAcquisition and add to the
%matlab path

data = Protocolo_Carga_PC('can0_candump_2025-07-22_20-54-26(corrida_manual_1).txt');
extensometer_calibration(data);

%Rearrengements of data.vxGSS and data.vyGSS due to an error on the
%measurements

p = polyfit(data.vxGSS, data.vyGSS, 1);
theta=atan(p(1));
R = [cos(theta), sin(theta); -sin(theta),  cos(theta)];

P = [data.vxGSS(:), data.vyGSS(:)];
Prot = P * R.';

data.vxGSS = Prot(:,1);
data.vyGSS = Prot(:,2);

%Calculations of the dynamic variables

ackerman_steer=zeros(length(data.tiempo),4);
for i=1:length(data.tiempo)
    ackerman=calculate_steering(data.steer(i), param);
    ackerman_steer(i,:)=ackerman;
end

vx_wheel = data.vxGSS + data.yawRateGSS .* [-param.trackwidthF/2, param.trackwidthF/2, -param.trackwidthR/2, param.trackwidthR/2];
vy_wheel = data.vyGSS + data.yawRateGSS .* [param.lf, param.lf, -param.lr, -param.lr];
v_wx = vx_wheel .* cos(ackerman_steer) + vy_wheel .* sin(ackerman_steer);

w = [data.wFL, data.wFR, data.wRL, data.wRR];
SR = (w * param.rdyn - v_wx) ./ (v_wx + 0.001);
SA = atan2(vy_wheel, vx_wheel);

tire_load=zeros(length(data.axGSS),4);

for i=1:length(data.tiempo)
    tire_load(i,:)=calculate_tire_loads(data.axGSS(i), data.ayGSS(i), data.vGSS(i), param);
end

%Longitudinal force Calculation from the pacejka formula

Fx_mod = zeros(length(data.tiempo),4);
Fy_mod = zeros(length(data.tiempo),4);

for i=1:length(data.tiempo)
    [fy_i,fx_i, ~, ~] = calculate_tire_forces(tire_load(i,:), -SA(i,:), SR(i,:),pac);
    Fx_mod(i,:) = fx_i;
    Fy_mod(i,:) = fy_i;
end

%Force stacking to just one

Fxt_mod=zeros(length(data.tiempo),1);
Fyt_mod=zeros(length(data.tiempo),1);
for i=1:length(data.tiempo)
    Fxt_mod(i)= Fx_mod(i, 1)*cos(ackerman_steer(i, 1))-Fy_mod(i, 1)*sin(ackerman_steer(i, 1))...
        +Fx_mod(i, 2)*cos(ackerman_steer(i, 2))-Fy_mod(i, 2)*sin(ackerman_steer(i, 2))+Fx_mod(i, 3)+Fx_mod(i, 4);
    Fyt_mod(i)=  Fx_mod(i, 1)*sin(ackerman_steer(i, 1))+Fy_mod(i, 1)*cos(ackerman_steer(i, 1))...
        +Fx_mod(i, 2)*sin(ackerman_steer(i, 2))+Fy_mod(i, 2)*cos(ackerman_steer(i, 2))+Fy_mod(i, 3)+Fy_mod(i, 4);
end
   
%Longitudinal force Calculation of the from the equation of reference

tire_load_total= sum(tire_load,2);
SA_total=atan2(data.vyGSS, data.vxGSS);
Fxt_ref= param.mass*data.axGSS+1/2*param.rho*param.CDA*data.vGSS.^2.*cos(SA_total);
Fyt_ref= param.mass*data.ayGSS+1/2*param.rho*param.CDA*data.vGSS.^2.*sin(SA_total);

%Graphs of interest

figure
plot(data.tiempo,Fxt_mod, "b")
hold on
plot(data.tiempo, Fxt_ref, "r")
xlabel('Time (s)')
ylabel('Longitudinal Force (N)')
title("Relation of Fx with time")
legend("Simulation model (Fx)", "Equation of reference (Fx)")

figure
plot(data.tiempo,Fyt_mod, "b")
hold on
plot(data.tiempo, Fyt_ref, "r")
xlabel('Time (s)')
ylabel('Lateral Force (N)')
title("Relation of Fy with time")
legend("Simulation model (Fy)", "Equation of reference (Fy)")