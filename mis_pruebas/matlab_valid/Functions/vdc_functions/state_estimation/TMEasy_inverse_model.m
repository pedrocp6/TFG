function [sr, sa] = TMEasy_inverse_model(F_wx, F_wy, F_wz, sr_prev, sa_prev, combined)

if ~combined
    %% PURE SLIP
    %% Estimate slip ratio
    paramsX = load('fitted_parameters_pure_test.mat');
    px = paramsX.params;
    dF_x0 = px.dMu_x0 * F_wz;
    F_x_M = px.Mu_x_M * F_wz;
    F_x_S = px.Mu_x_S * F_wz;
    s_x_M = px.s_x_M;
    s_x_S = px.s_x_S;
    
    sr = zeros(4, 1);
    for j = 1:4
        % First piece
        a = 1;
        b = dF_x0(j) * s_x_M * (1/F_x_M(j) - 1/F_wx(j)) -2;
        c = 1;
    
        if(b^2 - 4*a*c < 0) % --> F_wx > F_x_m --> sr ~ s_x_M
            s1 = sign(F_wx(j)) * s_x_M;
        else
            sigma1 = [(-b +sqrt(b^2 - 4*a*c))/(2*a); (-b - sqrt(b^2 - 4*a*c))/(2*a)];
    
            s1 = sigma1 * s_x_M;                                % Obtain SR
            s1 = s1(abs(s1) <= s_x_M);                          % Check domain of definition
        end
    
        % Second piece
        a = 2;
        b = -3;
        c = 0;
        d = (F_wx(j) - F_x_M(j)) / (F_x_S(j) - F_x_M(j));
    
        p = (3*a*c - b^2)/(3*a^2);
        q = (2*b^3 - 9*a*b*c + 27*a^2*d)/(27*a^3);
        D = (q/2)^2 + (p/3)^3;
    
        if(D<0)
            r = sqrt(abs(p/3)^3);
            theta = acos(-q/(2*r));
            sigma2 = -b/(3*a) + 2*sqrt(-p/3)*[cos(theta/3); cos((theta+2*pi)/3); cos((theta+4*pi)/3)];
        else
            alpha = nthroot(-q/2 + sqrt(D), 3);
            beta = nthroot(-q/2 - sqrt(D), 3);
            sigma2 = alpha + beta;
        end
    
        s2 = (s_x_S - s_x_M) * sigma2 + s_x_M;               % Obtain SR
        s2 = s2((s_x_M <= abs(s2)) & (abs(s2) <= s_x_S));    % Check domain of definition
    
        % Choose solution
        if(abs(F_wx(j)) < F_x_S(j) && ~isempty(s1))
            [~,k] = min(abs(s1 - sr_prev(j)));
            sr(j) = s1(k);
        elseif(~isempty([s1; s2]))
            s = [s1; s2];
            [~,k] = min(abs(s - sr_prev(j)));
            sr(j) = s(k);
        end
    end
    
    %% Estimate slip angle
    paramsY = load('fitted_parameters_pure_test.mat');
    py = paramsY.params;
    dF_y0 = py.dMu_y0 * F_wz;
    F_y_M = py.Mu_y_M * F_wz;
    F_y_S = py.Mu_y_S * F_wz;
    s_y_M = py.s_y_M;
    s_y_S = py.s_y_S;
    
    sa = zeros(4,1);
    for j = 1:4
        % First piece
        a = 1;
        b = dF_y0(j) * s_y_M * (1/F_y_M(j) - 1/F_wy(j)) -2;
        c = 1;
    
        if(b^2 - 4*a*c < 0) % --> F_wy > F_y_m --> sa ~ s_y_M
            s1 = sign(F_wy(j)) * s_y_M;
        else
            sigma1 = [(-b +sqrt(b^2 - 4*a*c))/(2*a); (-b - sqrt(b^2 - 4*a*c))/(2*a)];
    
            s1 = sigma1 * s_y_M;                                % Obtain SA
            s1 = s1(abs(s1) <= s_y_M);                          % Check domain of definition
        end
    
        % Second piece
        a = 2;
        b = -3;
        c = 0;
        d = (F_wy(j) - F_y_M(j)) / (F_y_S(j) - F_y_M(j));
    
        p = (3*a*c - b^2)/(3*a^2);
        q = (2*b^3 - 9*a*b*c + 27*a^2*d)/(27*a^3);
        D = (q/2)^2 + (p/3)^3;
    
        if(D<0)
            r = sqrt(abs(p/3)^3);
            theta = acos(-q/(2*r));
            sigma2 = -b/(3*a) + 2*sqrt(-p/3)*[cos(theta/3); cos((theta+2*pi)/3); cos((theta+4*pi)/3)];
        else
            alpha = nthroot(-q/2 + sqrt(D), 3);
            beta = nthroot(-q/2 - sqrt(D), 3);
            sigma2 = alpha + beta;
        end
    
        s2 = (s_y_S - s_y_M) * sigma2 + s_y_M;               % Obtain SA
        s2 = s2((s_y_M <= abs(s2)) & (abs(s2) <= s_y_S));    % Check domain of definition
    
        % Choose solution
        if(abs(F_wy(j)) < F_y_S(j) && ~isempty(s1))
            [~, k] = min(abs(s1 + sa_prev(j)));
            sa(j) = s1(k); 
        elseif(~isempty([s1; s2]))
            s = [s1; s2];
            [~, k] = min(abs(s + sa_prev(j)));
            sa(j) = s(k);
        end
        sa(j) = -sa(j);
    end

else
    %% COMBINED SLIP
    paramsComb = load('fitted_parameters_comb_test.mat');
    p = paramsComb.params;

    dF_x0 = p.dMu_x0 .* F_wz;
    F_x_M = p.Mu_x_M .* F_wz;
    F_x_S = p.Mu_x_S .* F_wz;
    s_x_M = p.s_x_M;
    s_x_S = p.s_x_S;

    dF_y0 = p.dMu_y0 .* F_wz;
    F_y_M = p.Mu_y_M .* F_wz;
    F_y_S = p.Mu_y_S .* F_wz;
    s_y_M = p.s_y_M;
    s_y_S = p.s_y_S;

    sx_norm = s_x_M./(s_x_M + s_y_M) + (F_x_M./(dF_x0 + eps))./(F_x_M./(dF_x0 + eps) + F_y_M./(dF_y0 + eps) + eps);
    sy_norm = s_y_M./(s_x_M + s_y_M) + (F_y_M./(dF_y0 + eps))./(F_x_M./(dF_x0 + eps)+ F_y_M./(dF_y0 + eps) + eps);

    F = sqrt(F_wx.^2 + F_wy.^2);
    phi = atan2(F_wy, F_wx);

    dF0 = sqrt((dF_x0 .* sx_norm .* cos(phi)).^2 + (dF_y0 .* sy_norm .* sin(phi)).^2);
    F_M = sqrt((F_x_M .* cos(phi)).^2 + (F_y_M .* sin(phi)).^2);
    F_S = sqrt((F_x_S .* cos(phi)).^2 + (F_y_S .* sin(phi)).^2);
    s_M = sqrt((s_x_M ./ sx_norm .* cos(phi)).^2 + (s_y_M ./ sy_norm .* sin(phi)).^2);
    s_S = sqrt((s_x_S ./ sx_norm .* cos(phi)).^2 + (s_y_S ./ sy_norm .* sin(phi)).^2);
    s_prev = sqrt((sr_prev ./ sx_norm .* cos(phi)).^2 + (sa_prev ./ sy_norm .* sin(phi)).^2);

    s = zeros(4,1);
    sr = zeros(4,1);
    sa = zeros(4,1);


    for j = 1:4
        % First piece
        a = 1;
        b = dF0(j) * s_M(j) * (1/F_M(j) - 1/F(j)) -2;
        c = 1;

        if(b^2 - 4*a*c < 0) % --> F > F_m --> s ~ s_M
            s1 = s_M(j);
        else
            sigma1 = [(-b +sqrt(b^2 - 4*a*c))/(2*a); (-b - sqrt(b^2 - 4*a*c))/(2*a)];
            s1 = sigma1 * s_M(j);                        % Obtain combined slip
            s1 = s1((0 <= s1) & (s1 <= s_M(j)));                  % Check domain of definition
        end

        % Second piece
        a = 2;
        b = -3;
        c = 0;
        d = (F(j) - F_M(j)) / (F_S(j) - F_M(j));

        p = (3*a*c - b^2)/(3*a^2);
        q = (2*b^3 - 9*a*b*c + 27*a^2*d)/(27*a^3);
        D = (q/2)^2 + (p/3)^3;

        if(D<0)
            r = sqrt(abs(p/3)^3);
            theta = acos(-q/(2*r));
            sigma2 = -b/(3*a) + 2*sqrt(-p/3)*[cos(theta/3); cos((theta+2*pi)/3); cos((theta+4*pi)/3)];
        else
            alpha = nthroot(-q/2 + sqrt(D), 3);
            beta = nthroot(-q/2 - sqrt(D), 3);
            sigma2 = alpha + beta;
        end

        s2 = (s_S(j) - s_M(j)) * sigma2 + s_M(j);               % Obtain combined slip
        s2 = s2((s_M(j) < s2) & (s2 <= s_S(j)));    % Check domain of definition

        % Choose solution
        if(F(j) < F_S(j) && ~isempty(s1))
            [~, k] = min(abs(s1 - s_prev(j))); 
            s(j) = s1(k);
        elseif(~isempty([s1; s2]))
            ss = [s1; s2];
            [~, k] = min(abs(ss - s_prev(j)));
            s(j) = ss(k);
        end

        sr(j) = s(j) * cos(phi(j)) * sx_norm(j);
        sa(j) = -s(j) * sin(phi(j)) * sy_norm(j);
    end
end

end

