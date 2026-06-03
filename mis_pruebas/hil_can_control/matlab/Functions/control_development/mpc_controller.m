function u_out = mpc_controller(state_x, sensors, param_vdc, pac, u_prev)
    % 1. Objetivo
    yaw_ref = calculate_target_yaw(sensors.delta, state_x(1)); 
    X_ref = repmat([0; 0; yaw_ref], Np, 1); % Rellenar el horizonte
    
    % 2. Linealización (Tu TV_MPC.m)
    [Ac, Bc] = TV_MPC(state_x, u_prev, sensors, param_vdc, pac);
    
    % 3. Discretización de Euler
    Ts = 0.01; 
    Ak = eye(3) + Ac * Ts;
    Bk = Bc * Ts;
    
    % 4. Matrices de Predicción (Phi y Gamma)
    [Phi, Gamma] = build_prediction_matrices(Ak, Bk, Np);
    
    % 5. Función de coste QP (Minimizar 1/2 U^T H U + f^T U)
    Q_weight = diag([100, 10, 10]); % Pesos para vx, vy, yaw_rate
    R_weight = diag([0.002, 0.002, 0.002, 0.002]);   % Peso para el esfuerzo de control
    
    Q_bar = kron(eye(Np), Q_weight);
    R_bar = kron(eye(Np), R_weight);
    
    H = 2 * (Gamma' * Q_bar * Gamma + R_bar);
    f = 2 * Gamma' * Q_bar * (Phi * state_x - X_ref);
    
    % 6. Restricciones Físicas (Inversores y Agarre)
    % A_ineq * U <= b_ineq
    [A_ineq, b_ineq] = get_constraints(sensors, param_vdc, ...);
    
    % 7. Solver
    coder.extrinsic('quadprog');
    options = optimoptions('quadprog', 'Display', 'off');
    U_opt = quadprog(H, f, A_ineq, b_ineq, [], [], [], [], u_prev, options);
    
    % 8. Aplicar la primera actuación
    u_out = U_opt(1:4);
end