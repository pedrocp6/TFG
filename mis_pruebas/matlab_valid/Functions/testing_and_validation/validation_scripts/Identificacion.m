%% Carga de datos 
T=0.01;

tiempo = epos.time;
real = epos.delta;
control = epos.cmd;

tiempo = tiempo(1681:end);
real = real(1681:end);
control = control(1681:end);

tiempo_spaced = tiempo(1):T:tiempo(end);

actual_log = interp1(tiempo,real,tiempo_spaced);
cmd_log = interp1(tiempo,control,tiempo_spaced);

%% Creamos objetos para el ajuste
data = iddata(actual_log',cmd_log',T);
sys_tv = tfest(data,2,0)

%% Comprobacion rapida
figure()
compare(data,sys_tv);