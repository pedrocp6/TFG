fileID = fopen('simulation_log.txt','w');

[sensor_time, time_index] = sort([timeIMU; timeEncoder; timeExt; timeApps; timeGSS]);
I = [1:length(timeIMU) 1:length(timeEncoder) 1:length(timeExt) 1:length(timeApps) 1:length(timeGSS)];
I = I(time_index);

for i = 1:length(sensor_time)-1

    if time_index(i) < length(timeIMU)
        % Accelerations
        data_ax = sim2can(int16(100*outsensor.ax(I(i))),4);
        data_ay = sim2can(int16(100*outsensor.ay(I(i))),4);
        data_az = sim2can(int16(0),4);
        data = [data_ax data_ay data_az];
        current_time = sensor_time(i);
        fprintf(fileID,'%1.5f 1 %s Rx %1.0d %s \n', current_time, '1A3', length(data)/2 - 3, data);
        
        % Gyro
        data_rollrate = sim2can(int16(0),4);
        data_pitchrate = sim2can(int16(0),4);
        data_yawrate = sim2can(int16(1000*outsensor.r(I(i))),4);
        data = [data_rollrate data_pitchrate data_yawrate];
        current_time = sensor_time(i)+0.0001;
        fprintf(fileID,'%1.5f 1 %s Rx %1.0d %s \n', current_time, '1A8', length(data)/2 - 3, data);        

    elseif time_index(i) < length(timeIMU)+length(timeEncoder)
        % Encoders
        data_ws_fl = sim2can(int32(outsensor.wFL(I(i))*30/pi*10000*12.48),8);
        data_ws_fr = sim2can(int32(outsensor.wFR(I(i))*30/pi*10000*12.48),8);
        data_ws_rl = sim2can(int32(outsensor.wRL(I(i))*30/pi*10000*12.48),8);
        data_ws_rr = sim2can(int32(outsensor.wRR(I(i))*30/pi*10000*12.48),8);

        current_time = sensor_time(i);

        fprintf(fileID,'%1.5f 1 %3d Rx %1.0d %s \n', current_time, 102, 4, data_ws_fl);
        fprintf(fileID,'%1.5f 1 %3d Rx %1.0d %s \n', current_time+0.0001, 106, 4, data_ws_fr);
        fprintf(fileID,'%1.5f 1 %3d Rx %1.0d %s \n', current_time+0.0002, 110, 4, data_ws_rl);
        fprintf(fileID,'%1.5f 1 %3d Rx %1.0d %s \n', current_time+0.0003, 114, 4, data_ws_rr);

    elseif time_index(i) < length(timeIMU)+length(timeEncoder)+length(timeExt)
        % Steer
        data_steer = sim2can(int16(100*outsensor.steer(I(i))),4);
        current_time = sensor_time(i);
        fprintf(fileID,'%1.5f 1 %3d Rx %1.0d %s \n', current_time, 134, 2, data_steer);

    elseif time_index(i) < length(timeIMU)+length(timeEncoder)+length(timeExt)+length(timeApps)
        % APPS
        data_apps = sim2can(int16(100*apps(I(i))),4);
        current_time = sensor_time(i);
        fprintf(fileID,'%1.5f 1 %3d Rx %1.0d %s \n', current_time, 130, 2, data_apps);
        fprintf(fileID,'%1.5f 1 %3d Rx %1.0d %s \n', current_time, 131, 2, data_apps);

    else
        % GSS
        data_gss_vx = sim2can(int16(50*3.6*outsensor.vx_gss(I(i))),4);
        data_gss_vy = sim2can(int16(50*3.6*outsensor.vy_gss(I(i))),4);
        data_gss = [data_gss_vx data_gss_vy];
        current_time = sensor_time(i);
        fprintf(fileID,'%1.5f 1 %s Rx %1.0d %s \n', current_time, '1A0', 4, data_gss);
        
    end

    % Codigo de escritura del txt
    % fprintf(fileID,'%1.5f 1 %3d Rx %1d %s', current_time, ID, length(data)/2, data);
end

fclose(fileID);

function littleEndianHex = sim2can(decimalValue,nbits)
hexValue = dec2hex(decimalValue, nbits);
littleEndianHex = [];
    for k = nbits:-2:2
        littleEndianHex = [littleEndianHex, hexValue(k-1:k), ' '];
    end
end