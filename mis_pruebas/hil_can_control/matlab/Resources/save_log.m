%% 

run_data = struct();

%% Guardar datos de estado

run_data.time = time;
run_data.vx = vx;
run_data.vy = vy;
run_data.v = v; 

run_data.yaw_rate = yaw_rate;
run_data.ax = ax;
run_data.ay = ay;

run_data.beta = beta;
run_data.steer = steer;
run_data.k_calc = k_calc; 

run_data.wFL = wFL;
run_data.wFR = wFR;
run_data.wRL = wRL;
run_data.wRR = wRR;

run_data.FY = FY;
run_data.FX = FX;
run_data.FZ = FZ;
run_data.slip_angle = slip_angle;
run_data.slip_ratio = slip_ratio;

run_data.x = x_pos;
run_data.y = y_pos;

%% Guardar variables de control

run_data.torque_cmd = squeeze(out.torque_cmd.signals.values);

tv_fl = squeeze(out.debug.signals.values(:,6));
tv_fr = squeeze(out.debug.signals.values(:,7));
tv_rl = squeeze(out.debug.signals.values(:,8));
tv_rr = squeeze(out.debug.signals.values(:,9));
run_data.tv_out = [tv_fl,tv_fr,tv_rl,tv_rr];

run_data.time_control = out.torque_cmd.time;

run_data.time_debug = out.debug.time;

run_data.vx_ref = squeeze(out.debug.signals.values(:,2));
run_data.vy_ref = squeeze(out.debug.signals.values(:,3));
run_data.r_ref = squeeze(out.debug.signals.values(:,4));

run_data.accel = accelerator;
run_data.brake = brake;

run_data.hyd_brake = hyd_brake;
run_data.load_cell = load_cell;

run_data.mpc_sol = squeeze(out.debug.signals(1).values);



%% Guardar

control = '_mpc'; % _mpc o _pd
prueba = '_autox'; % _autox o _skidpad o _slalom

filename = ['C:\TFG_Vivado\mis_pruebas\hil_can_control\matlab\Simulation\Data\','resultados',control,prueba,'.mat'];
save(filename, 'run_data');
fprintf("Datos guardados\n")






