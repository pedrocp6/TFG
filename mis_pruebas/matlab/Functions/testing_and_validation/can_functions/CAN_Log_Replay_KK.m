function CAN_Log_Replay_KK(filename, canChannel)
    % CAN_Log_Replay: Reproduce un log de mensajes CAN.
    % filename: Nombre del archivo log.
    % canChannel: Objeto de canal CAN configurado previamente.
% fid = fopen(filename, 'r');
% lines = {};
% tline = fgetl(fid);
% while ischar(tline)
%     if ~contains(tline, 'ErrorFrame')
%         lines{end+1} = tline; %#ok<AGROW>
%     end
%     tline = fgetl(fid);
% end
% fclose(fid);
% 
% % Escribe las líneas válidas en un archivo temporal
% fid = fopen('temp.txt', 'w');
% fprintf(fid, '%s\n', lines{:});
% fclose(fid);

fid=fopen(filename,'r');
data=textscan(fid,'%f %f %s %*s %s %s %s %s %s %s %s %s %s %*u','Treatasempty','ErrorFrame','CollectOutput',1,'Headerlines',15);
fclose(fid);

%% Bucle de construcción de variables

CAN1=find(data{1}(:,2)==1);
ID_CAN1=data{2}(CAN1,1);

tiempo=data{1}(CAN1,1);
informacion=data{2}(CAN1,:);
t0=[];
% Transmisión de mensajes
tic
i0 = 1;
for i = 1:length(tiempo)
% for i = 1:round(length(tiempo)/5)
% for i = 1:round(length(tiempo)/30)
% i0 = 60000; iEnd = 87000;
% for i=i0:iEnd
    %Calcular el retraso respecto al mensaje anterior
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

    if(~isnan(str2double(informacion{i,2})))
        info = [];
        for k = 3:str2double(informacion{i,2})+2
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
