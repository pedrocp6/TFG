%% Sensor configuration
sensor = struct();

% Encoder (ART24 wheelspeed data)
sensor.encoder_sigma = 0.2765;
sensor.encoder_hz = 0.014;

% IMU
sensor.IMU_sigma_accel = 0.04;
sensor.IMU_sigma_gyro = 0.001;
sensor.IMU_hz = 0.005;

% Linear potentiometers
sensor.ext_sigma = 0.0255;
sensor.ext_hz = 0.014;

param.sensors = sensor;

%% Sensor bus 

imu.r = 0;
imu.ax = 0;
imu.ay = 0;

encoder.wFL = 0;
encoder.wFR = 0;
encoder.wRL = 0;
encoder.wRR = 0;

ext.steering = 0;

sensor_struct.IMU = imu;
sensor_struct.encoder = encoder;
sensor_struct.ext = ext;