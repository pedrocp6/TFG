nmsgs = length(received_msgs);
time = zeros(nmsgs,1);

%% Variables
torque_out_fl = [];
torque_out_fr = [];
torque_out_rl = [];
torque_out_rr = [];

vx_out = [];
vy_out = [];
r_out = [];
% exec_time_out = [];

time_torque_fl = [];
time_torque_fr = [];
time_torque_rl = [];
time_torque_rr = [];

time_state = [];

time_amk_data = [];
time_isabelino_current = [];
time_isabelino_voltage = [];
amk_speed = [];
amk_torque = [];
isabelino_current = [];
isabelino_voltage = [];
isabelino_power = [];
time_isabelino_power = [];

ids = [];
srTC_RL = [];
srTC_RR = [];
TCout_RL = [];
TCout_RR = [];


%% Lectura
for i=1:nmsgs
    time(i) = received_msgs(i).Timestamp;
    ID = received_msgs(i).ID;
    data = received_msgs(i).Data;
    
    ids = [ids, ID];

    switch ID
        case 0x200
            time_torque_fl = [time_torque_fl; time(i)];
            torque_out_fl = [torque_out_fl; 9.8*0.001*double(typecast(uint8(data(3:4)),'int16'))];
        case 0x203
            time_torque_fr = [time_torque_fr; time(i)];
            torque_out_fr = [torque_out_fr; 9.8*0.001*double(typecast(uint8(data(3:4)),'int16'))];
        case 0x206
            time_torque_rl = [time_torque_rl; time(i)];
            torque_out_rl = [torque_out_rl; 9.8*0.001*double(typecast(uint8(data(3:4)),'int16'))];
        case 0x209
            time_torque_rr = [time_torque_rr; time(i)];
            torque_out_rr = [torque_out_rr; 9.8*0.001*double(typecast(uint8(data(3:4)),'int16'))];
        case 0x122
            time_state = [time_state; time(i)];
            vx_out = [vx_out; 0.01*double(typecast(uint8(data(1:2)),'int16'))];
            vy_out = [vy_out; 0.01*double(typecast(uint8(data(3:4)),'int16'))];
            r_out = [r_out; 0.001*double(typecast(uint8(data(5:6)),'int16'))];
        case 0x129
            srTC_RL = [srTC_RL; 0.01*double(typecast(uint8(data(1:2)),'int16'))];
            srTC_RR = [srTC_RR; 0.01*double(typecast(uint8(data(3:4)),'int16'))];
            TCout_RL = [TCout_RL; 0.01*double(typecast(uint8(data(5:6)),'int16'))];
            TCout_RR = [TCout_RR; 0.01*double(typecast(uint8(data(7:8)),'int16'))];
        % case 0x102
        %     time_amk_data = [time_amk_data; time(i)];
        %     amk_speed = [amk_speed; 0.0001*double(typecast(uint8(data(1:4)), 'int32'))];
        %     amk_torque = [amk_torque; 9.8/100*0.1*double(typecast(uint8(data(5:6)), 'int16'))];
        % case 0x190
        %     time_isabelino_current = [time_isabelino_current; time(i)];
        %     isabelino_current = [isabelino_current; - double(typecast(uint8(data(3:6)), 'int32'))];
        % case 0x192
        %     time_isabelino_voltage = [time_isabelino_voltage; time(i)];
        %     isabelino_voltage = [isabelino_voltage; 0.001*double(typecast(uint8(data(3:6)), 'int32'))];
        % case 0x195
        %     time_isabelino_power = [time_isabelino_power; time(i)];
        %     isabelino_power = [isabelino_power; -double(typecast(uint8(data(3:6)), 'int32'))];
    end
end

%% Tratamiento final

% time_torque = time_torque - time_torque(1);
% 
% t = datetime('now', 'Format', 'yyyyMMdd_HHmmss');
% ts = char(t);
% filename = sprintf('canlog_AMK_%s.mat', ts);
% save(filename);