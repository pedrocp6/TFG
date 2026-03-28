%% True state
time = out.true_state.time;
vx = out.true_state.signals.values(:,1);
vy = out.true_state.signals.values(:,2);
v = hypot(vx,vy);

yaw_rate = out.true_state.signals.values(:,3);
ax = out.true_state.signals.values(:,8);
ay = out.true_state.signals.values(:,9);

beta = atan(vy./vx);
steer = out.steer.signals.values(:,:)';
k_calc = yaw_rate./vx;

wFL =  out.true_state.signals.values(:,4);
wFR =  out.true_state.signals.values(:,5);
wRL =  out.true_state.signals.values(:,6);
wRR =  out.true_state.signals.values(:,7);

FY = out.tire_bus.signals.values(:,13:16);
FX = out.tire_bus.signals.values(:,17:20);
FZ = out.tire_bus.signals.values(:,9:12);

slip_angle = out.tire_bus.signals.values(:,1:4);
slip_ratio = out.tire_bus.signals.values(:,5:8);

x_pos = out.pos.signals.values(:,1);
y_pos = out.pos.signals.values(:,2);

% time_vdc = out.logsout{21}.Values.Time;
% torque_out = squeeze(out.logsout{21}.Values.Data)';

%% Sensor output
outsensor = struct();

outsensor.ax = squeeze(out.sensor_out.IMU.ax.Data);
outsensor.ay = squeeze(out.sensor_out.IMU.ay.Data);
outsensor.r = squeeze(out.sensor_out.IMU.yaw_rate.Data);
timeIMU = out.sensor_out.IMU.ax.Time;

outsensor.wFL = squeeze(out.sensor_out.encoder.wFL.Data);
outsensor.wFR = squeeze(out.sensor_out.encoder.wFR.Data);
outsensor.wRL = squeeze(out.sensor_out.encoder.wRL.Data);
outsensor.wRR = squeeze(out.sensor_out.encoder.wRR.Data);
timeEncoder = out.sensor_out.encoder.wFL.Time;

outsensor.steer = squeeze(out.sensor_out.ext.steering.Data);
timeExt = out.sensor_out.ext.steering.Time;

outsensor.vx_gss = squeeze(out.sensor_out.gss.vx.Data);
outsensor.vy_gss = squeeze(out.sensor_out.gss.vy.Data);
timeGSS = out.sensor_out.gss.vx.Time;


% apps = out.logsout{22}.Values.Data;
% timeApps = out.logsout{22}.Values.Time;