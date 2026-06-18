function tire_load = calculate_tire_loads_vdc(ax,ay,v,param)

F_L = 0.5*param.rho*param.CLA*v^2;
F_D = 0.5*param.rho*param.CDA*v^2;

%% Lateral Load Transfer
% nonsuspended weight transfer (N)
y_WT_ns_f = param.nsm_f * ay * param.h_cdg_nsm_f / param.trackwidthF;        % nonsuspended weight transfer front (N)
y_WT_ns_r = param.nsm_r * ay * param.h_cdg_nsm_r / param.trackwidthR;        % nonsuspended weight transfer rear (N)

% suspended geometric weight transfer (N)
y_WT_s_g_f = param.sm_f * ay * param.h_RC_f / param.trackwidthF;     % suspended geometric weight transfer front (N)
y_WT_s_g_r = param.sm_r * ay * param.h_RC_r / param.trackwidthR;     % suspended geometric weight transfer rear (N)

% susp. elastic WT (N)
y_WT_s_e_f = param.sm * ay * (param.h_cdg_sm - param.h_RA) * param.RS_f/param.RS /param.trackwidthF;  % susp. elastic WT front (N)
y_WT_s_e_r = param.sm * ay * (param.h_cdg_sm - param.h_RA) * param.RS_r/param.RS /param.trackwidthR;  % susp. elastic WT rear (N)

%% Long. Load Transfer
% long. nonsuspended weight transfer (N)
x_WT_ns = (param.nsm_f * ax * param.h_cdg_nsm_f + param.nsm_r * ax * param.h_cdg_nsm_r) / param.wheelbase;

% long. suspended weight transfer (N)
x_WT_s = param.sm * ax * param.h_cdg_sm / param.wheelbase;

% long. suspended elastic weight transfer (N)
% x_WT_s_e_f = -x_WT_s * (1-param.AD_f) * (ax < 0) -x_WT_s * (1-param.AL_f) * (ax > 0); % VA
% x_WT_s_e_r = x_WT_s * (1-param.AR_r) * (ax < 0) + x_WT_s * (1-param.AS_r) * (ax > 0); % HA
x_WT_s_e_f = -x_WT_s * (ax < 0) - x_WT_s * (ax > 0); % VA
x_WT_s_e_r = x_WT_s * (ax < 0) + x_WT_s * (ax > 0); % HA

%% Wheel loads

tire_load = zeros(4,1);

tire_load(1,1) = 0.5 * param.mass *param.g* param.lf/param.wheelbase + 0.5 *param.r_cdp * F_L...
    - 0.5 * param.h_cdp/param.wheelbase * F_D - y_WT_ns_f - y_WT_s_g_f - y_WT_s_e_f...
    - 0.5 * (x_WT_ns + x_WT_s);
tire_load(2,1) = 0.5 * param.mass *param.g* param.lf/param.wheelbase + 0.5 * param.r_cdp * F_L...
    - 0.5 * param.h_cdp/param.wheelbase * F_D + y_WT_ns_f + y_WT_s_g_f + y_WT_s_e_f...
    - 0.5 * (x_WT_ns + x_WT_s);
tire_load(3,1) = 0.5 * param.mass *param.g* param.lr/param.wheelbase + 0.5 * (1-param.r_cdp) * F_L...
    + 0.5 * param.h_cdp/param.wheelbase * F_D - y_WT_ns_r - y_WT_s_g_r - y_WT_s_e_r...
    + 0.5 * (x_WT_ns + x_WT_s);
tire_load(4,1) = 0.5 * param.mass *param.g* param.lr/param.wheelbase + 0.5 * (1-param.r_cdp) * F_L...
    + 0.5 * param.h_cdp/param.wheelbase * F_D + y_WT_ns_r + y_WT_s_g_r + y_WT_s_e_r...
    + 0.5 * (x_WT_ns + x_WT_s);

%% Negative tire load recalculation

tire_loadneg = tire_load .* (sign(tire_load) == -1); 
tire_load = tire_load - tire_load .* (sign(tire_load) == -1);  
if (tire_loadneg(1)<0 && tire_loadneg(2)<0) || (tire_loadneg(3)<0 && tire_loadneg(4)<0) 
    tire_loadty = 0.5* [(tire_loadneg(3)-tire_loadneg(4));-(tire_loadneg(3)-tire_loadneg(4));(tire_loadneg(1)-tire_loadneg(2));-(tire_loadneg(1)-tire_loadneg(2))];
    tire_loadtx = 0.5* [(tire_loadneg(3)+tire_loadneg(4));(tire_loadneg(3)+tire_loadneg(4));(tire_loadneg(1)+tire_loadneg(2));(tire_loadneg(1)+tire_loadneg(2))];
    tire_load = tire_load + tire_loadty + tire_loadtx;
elseif (tire_loadneg(1)<0 && tire_loadneg(3)<0) || (tire_loadneg(2)<0 && tire_loadneg(4)<0) 
    tire_loadty = 0.5* [(tire_loadneg(2)+tire_loadneg(4));(tire_loadneg(1)+tire_loadneg(3));(tire_loadneg(2)+tire_loadneg(4));(tire_loadneg(1)+tire_loadneg(3))];
    tire_loadtx = 0.5* [(tire_loadneg(2)-tire_loadneg(4));(tire_loadneg(1)-tire_loadneg(3));-(tire_loadneg(2)-tire_loadneg(4));-(tire_loadneg(1)-tire_loadneg(3))];
    tire_load = tire_load + tire_loadty + tire_loadtx;
elseif tire_loadneg(1)<0 || tire_loadneg(2)<0 
    WT_x = 0.5* (x_WT_ns + x_WT_s);
    WT_y = (y_WT_ns_f + y_WT_s_g_f + y_WT_s_e_f);   
    tire_loadtx = WT_x/(WT_x + abs(WT_y) +eps) * tire_loadneg;
    tire_loadty = WT_y/(WT_x + abs(WT_y) +eps) * tire_loadneg * sign(ay);
    tire_load = tire_load + [0;0;tire_loadty(1);tire_loadty(2)] + [tire_loadtx(2);tire_loadtx(1);0;0];
    tire_loadneg2 = tire_load .* (sign(tire_load) == -1);  
    tire_load = tire_load - tire_load .* (sign(tire_load) == -1);  
    if tire_loadneg2(3)<0 || tire_loadneg2(4)<0
        tire_load = tire_load + [tire_loadneg2(4);tire_loadneg2(3);0;0];
    end
    if tire_loadneg2(1)<0 || tire_loadneg2(2)<0
        tire_load = tire_load + 0.5*[0;0;tire_loadneg2(1)+tire_loadneg2(2);tire_loadneg2(1)+tire_loadneg2(2)];
    end
elseif tire_loadneg(3)<0 || tire_loadneg(4)<0  
    WT_x = 0.5* (x_WT_ns + x_WT_s);
    WT_y = (y_WT_ns_f + y_WT_s_g_f + y_WT_s_e_f);  
    tire_loadtx = -WT_x/(-WT_x + abs(WT_y)) * tire_loadneg;
    tire_loadty = WT_y/(-WT_x + abs(WT_y)) * tire_loadneg * sign(ay);
    tire_load = tire_load + [tire_loadty(3);tire_loadty(4);0;0] + [0;0;tire_loadtx(4);tire_loadtx(3)];
    tire_loadneg2 = tire_load .* (sign(tire_load) == -1);  
    tire_load = tire_load - tire_load .* (sign(tire_load) == -1);  
    if tire_loadneg2(1)<0 || tire_loadneg2(2)<0 
        tire_load = tire_load + [0;0;tire_loadneg2(2);tire_loadneg2(1)];
    end
    if tire_loadneg2(3)<0 || tire_loadneg2(4)<0 
        tire_load = tire_load + 0.5*[tire_loadneg2(3)+tire_loadneg2(4);tire_loadneg2(3)+tire_loadneg2(4);0;0];
    end
end

end