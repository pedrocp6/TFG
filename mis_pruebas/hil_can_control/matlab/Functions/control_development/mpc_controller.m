function u_out = mpc_controller(fx_request, x, u_prev, sensors, param_vdc, pac)
% MPC_CONTROLLER  LTV-MPC de torque vectoring (formulación paper Mikuláš 2018)
%
%   u_out = mpc_controller(x, u_prev, sensors, param_vdc, pac)
%
%   Estados:   x = [vx; vy; r]
%   Entradas:  u = [T_FL; T_FR; T_RL; T_RR]  (pares en cada rueda, Nm)

    %% --- Parámetros del MPC ---
    Np  = 20;       % Horizonte de predicción
    Ts  = 0.005;    % Tiempo de muestreo [s] — UN SOLO valor, consistente con 200Hz
    nx  = 3;
    nu  = 4;
    Kus = 0;        % Coeficiente de subviraje (0 = neutro, paper ec. 14)

    %% --- Estado actual ---
    vx = x.vx;
    vy = x.vy;
    r  = x.r;     % yaw_rate — nombre consistente en todo el código

    x_k = [vx;vy;r];

    ax        = sensors.IMU.ax;
    ay        = sensors.IMU.ay;
    delta_cmd = sensors.ext.steering;

    delta = calculate_steering(delta_cmd, param_vdc);

    %% --- 1. Cálculo de referencias (ec. 10-14 del paper) ---

    % Radio de curvatura cinemático
    delta_mean = mean([delta(1); delta(2)]);   % ángulo medio ruedas delanteras
    Rss_ref    = param_vdc.wheelbase / (tan(delta_mean) + eps);

    % Fuerza lateral máxima (Fy_max): evalúa Pacejka sin deslizamiento longitudinal
    vx_wheel = vx*ones(4,1) + r/2 * [-param_vdc.trackwidthF; ...
                                       param_vdc.trackwidthF; ...
                                      -param_vdc.trackwidthR; ...
                                       param_vdc.trackwidthR];
    vy_wheel = vy*ones(4,1) + r * [param_vdc.lf;  param_vdc.lf; ...
                                   -param_vdc.lr; -param_vdc.lr];
    slip_angle = atan2(vy_wheel, vx_wheel) - delta;
    tire_load  = calculate_tire_loads(ax, ay, vx, param_vdc);

    % slip_ratio = 0 para obtener la capacidad lateral máxima (ec. 11)
    [fy_tire, fx_tire] = calculate_tire_forces(tire_load, slip_angle, zeros(4,1), pac);
    force_fy_body = fx_tire .* sin(delta) + fy_tire .* cos(delta);
    Fy_max = sum(force_fy_body);   % fuerza lateral total disponible [N]

    % Velocidad máxima admisible (ec. 11): v²_max = Rss * Fy_max / m
    v2_max = Rss_ref * Fy_max / param_vdc.mass;
    v_max  = sqrt(max(v2_max, 0));

    % Velocidad longitudinal de referencia (ec. 12)
    % Incremento por par solicitado por el piloto a lo largo del horizonte
    v_actual   = sqrt(vx^2 + vy^2);
    % Aceleración media estimada del par total (aproximación lineal)
    a_driver   = fx_request / param_vdc.mass;
    v_predicted = v_actual + a_driver * Np * Ts;

    % Límite por capacidad lateral: sqrt(v²_max - vy²)
    vy_lat_limit = sqrt(max(v2_max - vy^2, 0));

    vx_ref = min(v_predicted, vy_lat_limit);
    vx_ref = max(vx_ref, 0);   % no negativo

    % Velocidad lateral de referencia (ec. 13): saturada por beta_max
    % Se usa beta_max del fabricante; aquí aproximamos con la elipse de fricción
    beta_max = atan2(Fy_max, abs(fx_request) + eps);
    vy_ref   = sign(vy) * min(abs(vy), tan(beta_max) * vx);

    % Referencia de yaw rate (ec. 14)
    r_ref = vx * tan(delta_mean) / (param_vdc.wheelbase + Kus * vx^2);

    % Vector de referencia para todo el horizonte
    X_ref = repmat([vx_ref; vy_ref; r_ref], Np, 1);   % (Np*nx x 1)

    %% --- 2. Linealización LTV en el punto de operación actual ---
    [Ak, Bk] = mpc_linealization(x_k, u_prev, param_vdc, pac, sensors);

    %% --- 4. Matrices de predicción ---
    [Phi, Gamma] = build_mpc_qp_matrices(Ak, Bk, Np);

    %% --- 5. Función de coste QP (ec. 15a del paper) ---
    % min_U  (1/2) U' H U + f' U
    % con  H = 2*(Gamma'*Q_bar*Gamma + R_bar)
    %       f = 2*Gamma'*Q_bar*(Phi*x_k - X_ref)

    Q_weight = diag([0, 0, 10]);                      % pesos estado
    R_weight = diag([0.002, 0.002, 0.002, 0.002]);       % pesos esfuerzo control

    Q_bar = kron(eye(Np), Q_weight);   % (Np*nx x Np*nx)
    R_bar = kron(eye(Np), R_weight);   % (Np*nu x Np*nu)

    H = 2 * (Gamma' * Q_bar * Gamma + R_bar);
    f = 2 * Gamma' * Q_bar * (Phi * x_k - X_ref);

    %% --- 6. Restricciones (ec. 15d del paper) ---
    % Límites de par por motor y por capacidad de agarre
    T_max = param_vdc.torque_limit_positive(1) * ones(Np*nu, 1);
    T_min = param_vdc.torque_limit_negative(1) * ones(Np*nu, 1);   % puede ser negativo (recuperación)

    % Restricción de suma: sum(u) <= T_driver (par total pedido por piloto)
    % A_eq * U <= b_eq  → una fila por paso del horizonte
    A_sum = kron(eye(Np), ones(1, nu));       % (Np x Np*nu)
    T_driver_total = sum(u_prev);             % par total actual como referencia
    b_sum_upper =  T_driver_total * ones(Np, 1);
    b_sum_lower = -T_driver_total * ones(Np, 1);

    A_ineq = [ A_sum; -A_sum];
    b_ineq = [b_sum_upper; -b_sum_lower];

    %% --- 7. Warm start: inicializa con la solución desplazada del paso anterior ---
    % Desplaza la secuencia óptima anterior un paso y rellena el último con u_prev
    U0 = repmat(u_prev, Np, 1);

    %% --- 8. Solver QP ---
    options = optimoptions('quadprog', 'Display', 'off', ...
                           'Algorithm', 'active-set', ...
                           'MaxIterations', 200, ...
                           'OptimalityTolerance', 1e-6);

    U_opt = quadprog(H, f, A_ineq, b_ineq, [], [], T_min, T_max, U0, options);

    if isempty(U_opt)
        % Si el QP falla, mantén la actuación anterior (safe fallback)
        u_out = u_prev;
%         warning('MPC QP infactible — manteniendo u_prev');
    else
        u_out = U_opt(1:nu);   % Solo la primera actuación (receding horizon)
    end

end