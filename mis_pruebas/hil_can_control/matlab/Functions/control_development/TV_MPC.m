%% --- CÁLCULO NUMÉRICO DE A_c y B_c (DIFERENCIAS FINITAS) ---

% Definimos valores instantáneos de las variables

vx = 0;
vy = 0;
yaw_rate = 0;
wheel_torque = [0 0 0 0]';

% Definimos el estado actual y la actuación actual (punto de linealización)
x_k = [vx; vy; yaw_rate];
u_k = wheel_torque;

% Tamaños del sistema reducido para el MPC
nx = 3;
nu = 4;

Ac = zeros(nx, nx);
Bc = zeros(nx, nu);

% Definimos el valor de los sensores y su matriz
sensors = zeros(8,1);

wheel_speed = [0; 0; 0; 0];
delta_cmd = 0;
dvx = 0;
dvy = 0;

sensors = [wheel_speed; delta_cmd; dvx; dvy];

% Paso de perturbación (un valor muy pequeño pero mayor a epsilon)
delta = 1e-5;

% 1. Calcular la Matriz A_c (Jacobiano respecto a los estados 'x')
for j = 1:nx
    % Perturbación positiva
    x_plus = x_k;
    x_plus(j) = x_plus(j) + delta;
    
    % Evaluar función completa (necesitas adaptar la llamada a tu función)
    % f_dynamics debe devolver el vector dx (las derivadas de los estados)
    dx_plus = f_dynamics(x_plus, u_k, sensors, param_vdc, pac); 
    
    % Perturbación negativa
    x_minus = x_k;
    x_minus(j) = x_minus(j) - delta;
    dx_minus = f_dynamics(x_minus, u_k, sensors, param_vdc, pac);
    
    % Diferencia central para rellenar la columna 'j' de Ac
    % Nota: Solo cogemos las primeras 3 filas de dx correspondientes a vx, vy, yaw
    Ac(:, j) = (dx_plus(1:3) - dx_minus(1:3)) / (2 * delta);
end

% 2. Calcular la Matriz B_c (Jacobiano respecto a las entradas 'u')
for j = 1:nu
    % Perturbación positiva
    u_plus = u_k;
    u_plus(j) = u_plus(j) + delta;
    dx_plus = f_dynamics(x_k, u_plus, sensors, param_vdc, pac);
    
    % Perturbación negativa
    u_minus = u_k;
    u_minus(j) = u_minus(j) - delta;
    dx_minus = f_dynamics(x_k, u_minus, sensors, param_vdc, pac);
    
    % Diferencia central para rellenar la columna 'j' de Bc
    Bc(:, j) = (dx_plus(1:3) - dx_minus(1:3)) / (2 * delta);
end


