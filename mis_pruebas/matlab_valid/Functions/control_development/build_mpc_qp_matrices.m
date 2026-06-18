function [Phi, Gamma] = build_mpc_qp_matrices(Ak, Bk, Np)
% BUILD_MPC_QP_MATRICES  Construye las matrices de predicción para el LTV-MPC
%
%   [Phi, Gamma] = build_mpc_qp_matrices(Ak, Bk, Np)
%
%   Entradas:
%     Ak  : Matriz de estado discretizada (nx x nx)
%     Bk  : Matriz de entrada discretizada (nx x nu)
%     Np  : Horizonte de predicción
%
%   Salidas:
%     Phi   : Matriz de evolución libre   (Np*nx x nx)
%     Gamma : Matriz de respuesta forzada (Np*nx x Np*nu)
%
%   Formulación (ec. 9 y 15 del paper):
%     X = Phi * x_k + Gamma * U
%
%     donde X = [x(k+1); x(k+2); ...; x(k+Np)]
%           U = [u(k);   u(k+1); ...; u(k+Np-1)]

    nx = size(Ak, 1);   % número de estados
    nu = size(Bk, 2);   % número de entradas

    % --- Matrices de predicción ---
    Phi   = zeros(Np*nx, nx);
    Gamma = zeros(Np*nx, Np*nu);

    % Precalcula potencias de Ad para evitar Ad^(i-j) repetido en el bucle
    % Ad_powers{k} = Ak^k, con Ad_powers{0} = I
    Ad_powers = cell(Np+1, 1);
    Ad_powers{1} = eye(nx);         % Ak^0
    for k = 2:Np+1
        Ad_powers{k} = Ad_powers{k-1} * Ak;  % Ak^(k-1)
    end

    % Construcción de Phi y Gamma
    % Phi(i)   = Ak^i
    % Gamma(i,j) = Ak^(i-j) * Bk   para j <= i,  0 para j > i
    for i = 1:Np
        % Phi: fila i es Ak^i
        Phi((i-1)*nx+1 : i*nx, :) = Ad_powers{i+1};

        % Gamma: bloque (i,j) es Ak^(i-j)*Bk para j=1..i
        for j = 1:i
            col_idx = (j-1)*nu+1 : j*nu;
            row_idx = (i-1)*nx+1 : i*nx;
            Gamma(row_idx, col_idx) = Ad_powers{i-j+1} * Bk;  % Ak^(i-j)*Bk
        end
    end

end