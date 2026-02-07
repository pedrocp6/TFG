%% Create CAN Channel
% clear
txch = canChannel('PEAK-System','PCAN_USBBUS1');
% txch = canChannel("Kvaser","U100 1",1);
% txch = canChannel("Kvaser","Leaf Light v2 1",1);
configBusSpeed(txch,1000000)
% configBusSpeed(txch,500000)

start(txch);

%% RESTART PCB CODE

%% Replay log
tic
CAN_Log_Replay_PC('logs_pc/test_manual_30_07/can1_candump_2025-07-30_13-21-08(primera_run_salva).txt',txch);
toc
% Esperar a que terminen de llegar mensajes
pause(1);

stop(txch);

% Recortar buffer
received_msgs = receive(txch,Inf);
% received_msgs = received_msgs(1:idx-1);
% received_msgs = [received_msgs{:}];
can_reader

% Mostrar resumen
fprintf('Mensajes recibidos: %d\n', numel(received_msgs));