function CAN_Log_Replay_PC(filename, canChannel)
    % CAN_Log_Replay: Reproduce un log de mensajes CAN.
    % filename: Nombre del archivo log.
    % canChannel: Objeto de canal CAN configurado previamente.

fid=fopen(filename,'r');
data=textscan(fid,'(%f) %s %s [%f] %s %s %s %s %s %s %s %s %*u','Treatasempty','ErrorFrame','CollectOutput',1,'Headerlines',0);
fclose(fid);

%% Bucle de construcción de variables

CAN1=find(strcmp(data{2}(:,1), 'can0'));
CAN1 = CAN1(1:max(1,end-5));
ID_CAN1=data{2}(CAN1,2);

tiempo=data{1}(CAN1,1);
dlcs=data{3}(CAN1,:);
informacion=data{4}(CAN1,:);
t0=[];
% Transmisión de mensajes
tic
% for i = 1:length(tiempo)
% for i = 1:round(length(tiempo)/10)
% for i = 277000:400000
% for i = 900000:1000000
% for i=850000:length(tiempo)
i0 = 2983630; iEnd = 3107940;
for i=i0:iEnd
    % Calcular el retraso respecto al mensaje anterior
    % if i > 1
    %     delay = tiempo(i) - tiempo(i - 1);
    %     % pause(delay);
    % end
    if isempty(t0)
        t0 = tic;
    end

    % elapsed = toc(t0);
    delay = tiempo(i) - toc(t0) - tiempo(i0);

    if delay > 0
        % while toc(t0)<tiempo(i)
        %     % msg = receive(canChannel, 1); 
        %     % if ~isempty(msg)
        %     %     received_msgs{idx} = msg;
        %     %     idx = idx + 1;
        %     % end
        % %     pause(0.001)
        % end
        pause(delay);  % Respetar tiempo del log
    end

    if(~isnan(dlcs(i)))
        info = [];
        for k = 1:dlcs(i)
            info = [info, hex2dec(informacion{i,k})];
        end
    
        % Crear el mensaje CAN
        message = canMessage(uint16(hex2dec(ID_CAN1{i})), false, length(info));
        message.Data = uint8(info);
    
        % Transmitir el mensaje
        transmit(canChannel, message);
        
        fprintf('Mensaje enviado: ID=%s, Datos=[%s]\n', ID_CAN1{i}, sprintf('%02X ', info));
    end
end
toc

fprintf('Reproducción del log completada.\n');

end
