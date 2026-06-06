function [force_fy, force_fx, Mz, force_fx_rolling] = calculate_tire_forces_vdc(tire_load, slip_angle, slip_ratio)

pac = struct( ...
    'Dlat',  -1.5323, ...
    'Clat',   1.7230, ...
    'Blat',  12.7081,    ...
    'Elat',   0.4035, ...
    'Dlon',   1.0976,  ...
    'Clon',   1.9503, ...
    'Blon',  17.4910,   ...
    'Elon',   0.999,  ...
    'Gx1',  24968,    ...
    'bx',     0.2366, ...
    'ax',  93733,     ...
    'cx',     0.1689, ...
    'Gy1',   38.2112,   ...
    'by',     0.5365, ...
    'Slat',   0,      ...
    'Slon',   0);

alpha_s = slip_angle;
kappa_s = slip_ratio;

Gx_alpha = (1 - pac.bx) .* exp(-pac.Gx1 .* exp(-abs(pac.ax .* kappa_s).^pac.cx) .* alpha_s.^2) + pac.bx;
Gy_kappa = pac.by + (1 - pac.by) .* exp(-pac.Gy1 .* kappa_s.^2);

fy_pure = tire_load .* pac.Dlat .* sin(pac.Clat .* atan(pac.Blat .* alpha_s - ...
         pac.Elat .* (pac.Blat .* alpha_s - atan(pac.Blat .* alpha_s)))) + pac.Slat;

fx_pure = tire_load .* pac.Dlon .* sin(pac.Clon .* atan(pac.Blon .* kappa_s - ...
         pac.Elon .* (pac.Blon .* kappa_s - atan(pac.Blon .* kappa_s)))) + pac.Slon;

force_fy = Gy_kappa .* fy_pure;
force_fx = Gx_alpha .* fx_pure;

Mz = 0;
force_fx_rolling = 0;



% % Function to evaluate tire model and obtain forces on all 4 wheels
% % Input: 4x1 tire load Fz [N]
% %        4x1 slip angle [rad]
% %        4x1 slip ratio [-]
% %        struct pac 
% %
% % Output: 4x1 lateral force [N]
% %         4x1 longitudinal force [N]
% %         4x1 z moment [Nm]
% %         4x1 rolling resistance force [N]
% 
% F_z = tire_load;
% alp = slip_angle;
% kap = slip_ratio;
% camb = 0;
% 
% %% Pacejka calculation routine
%     F_z0 = pac.FNOMIN * pac.LFZO;
%     dfz = (F_z-pac.FNOMIN)/pac.FNOMIN;
% 
%     %Longitudinal Force (pure slip)
%     camb_x = camb;
%     S_Hx = (pac.PHX1 + pac.PHX2 * dfz) * pac.LHX;
%     S_Vx = F_z.* (pac.PVX1 + pac.PVX2 * dfz) * pac.LVX * pac.LMUX;
%     kap_x = kap + S_Hx;
%     mu_x = (pac.PDX1 + pac.PDX2 * dfz) .* (1 - pac.PDX3 * camb_x.^2) * pac.LMUX;
%     D_x = mu_x .* F_z;
%     K_xx = F_z .* (pac.PKX1 + pac.PKX2 * dfz) .* exp(pac.PKX3 * dfz) * pac.LKX;
%     C_x = pac.PCX1 * pac.LCX;
%     B_x = K_xx ./(C_x.*D_x + eps);
%     E_x = (pac.PEX1 + pac.PEX2*dfz + pac.PEX3*dfz.^2) .* (1-pac.PEX4 * sign(kap_x)) * pac.LEX;
% 
%     F_x0 = D_x .* sin(C_x .* atan(B_x .* kap_x - E_x.* (B_x .* kap_x - atan(B_x .* kap_x)))) + S_Vx;
%     % F_x_max = abs(D_x) + abs(S_Vx);
% 
%     %Lateral Force (pure slip)
%     camb_y = camb;
%     S_Hy = (pac.PHY1 + pac.PHY2*dfz ) * pac.LHY + pac.PHY3*camb_y;
%     S_Vy = F_z .* ((pac.PVY1 + pac.PVY2*dfz) * pac.LVY + (pac.PVY3 + pac.PVY4*dfz).*camb_y) * pac.LMUY;
%     alp_y = alp + S_Hy;
%     mu_y = (pac.PDY1 + pac.PDY2*dfz).*(1 - pac.PDY3 * camb_y.^2) * pac.LMUY;
%     D_y = mu_y .*F_z;
%     K_ya = pac.PKY1 * F_z0 * sin(2*atan(F_z/(pac.PKY2 * F_z0))) .* (1 - pac.PKY3 * abs(camb_y)) * pac.LKY;
%     C_y = pac.PCY1 * pac.LCY;
%     B_y = K_ya ./(C_y .* D_y + eps);
%     E_y = (pac.PEY1 + pac.PEY2 * dfz) .* (1 - (pac.PEY3 + pac.PEY4 * camb_y) .* sign(alp_y)) *pac.LEY;
% 
%     F_y0 = D_y.* sin(C_y.* atan(B_y .* alp_y - E_y.* (B_y .* alp_y - atan(B_y .* alp_y)))) + S_Vy;
%     % F_y_max = abs(D_y) + abs(S_Vy);
% 
%     %Longitudinal Force (combined slip)
%     S_Hxa = pac.RHX1;
%     C_xa = pac.RCX1;
%     B_xa = pac.RBX1 * cos(atan(pac.RBX2*kap)) * pac.LXAL;
%     E_xa = pac.REX1 + pac.REX2 * dfz;
%     D_xa = F_x0./(cos(C_xa * atan(B_xa * S_Hxa - E_xa .* (B_xa*S_Hxa - atan(B_xa * S_Hxa)))));
% 
%     F_x = D_xa .* cos(C_xa * atan(B_xa .* (alp +S_Hxa) - E_xa .* (B_xa .* (alp +S_Hxa) - atan(B_xa .* (alp +S_Hxa)))));
% 
%     % Rolling resistance
%     F_x_Roll = F_z .* ( pac.QSY1 + pac.QSY2 .* abs(F_x) ./ F_z0 );
% 
%     %Lateral Force (combined slip)
%     S_Hyk = pac.RHY1 + pac.RHY2 * dfz;
%     C_yk = pac.RCY1;
%     B_yk = pac.RBY1 * cos(atan(pac.RBY2*(alp - pac.RBY3))) * pac.LYKA;
%     E_yk = pac.REY1 + pac.REY2 * dfz;
%     D_yk = F_y0./cos(C_yk * atan(B_yk .* S_Hyk- E_yk.*(B_yk.*S_Hyk - atan(B_yk.*S_Hyk))));
%     D_Vyk = mu_y .* F_z .* (pac.RVY1 + pac.RVY2*dfz + pac.RVY3 * camb).* cos(atan(pac.RVY4 * alp));
%     S_Vyk = D_Vyk .* sin(pac.RVY5 * atan(pac.RVY6 * kap)) *pac.LVYKA;
% 
%     F_y = D_yk .* cos(C_yk * atan(B_yk.*(kap + S_Hyk) - E_yk.*(B_yk.*(kap + S_Hyk) - atan(B_yk.*(kap + S_Hyk))))) + S_Vyk;
% 
%     %Aligning Torque
%     camb_z = camb;
%     S_Hf = S_Hy + S_Vy./(K_ya + eps);
%     S_Ht = pac.QHZ1 + pac.QHZ2*dfz + (pac.QHZ3 + pac.QHZ4*dfz).*camb_z;
%     alp_t = alp + S_Ht;
%     alp_r = alp + S_Hf;
%     D_r = F_z.* ((pac.QDZ6 + pac.QDZ7*dfz) * pac.LRES + (pac.QDZ8 + pac.QDZ9*dfz).*camb_z)*pac.UNLOADED_RADIUS * pac.LMUY;
%     B_r = pac.QBZ9 * pac.LKY/pac.LMUY + pac.QBZ10*B_y.*C_y;
%     B_t = (pac.QBZ1 + pac.QBZ2*dfz + pac.QBZ3*dfz.^2).*(1 + pac.QBZ4*camb_z + pac.QBZ5*abs(camb_z))* pac.LKY/pac.LMUY;
%     C_t = pac.QCZ1;
%     D_t = F_z .* (pac.QDZ1 + pac.QDZ2*dfz).*(1 + pac.QDZ3*camb_z + pac.QDZ4*camb_z.^2)*pac.UNLOADED_RADIUS/F_z0 * pac.LTR;
%     E_t = (pac.QEZ1 + pac.QEZ2*dfz + pac.QEZ3*dfz.^2).*(1+(pac.QEZ4 + pac.QEZ5*camb_z).* 2/pi .* atan(B_t*C_t.*alp_t));
% 
%     %Aligning Torque (combined Slip)
%     s = (pac.SSZ1 + pac.SSZ2 * (F_y/F_z0) + (pac.SSZ3 + pac.SSZ4 * dfz) .* camb) * pac.UNLOADED_RADIUS * pac.LS;
%     alp_teq = atan(sqrt((tan(alp_t)).^2 + (K_xx./(K_ya + eps)).^2 .* kap.^2) .* sign(alp_t));
%     alp_req = atan(sqrt((tan(alp_r)).^2 + (K_xx./(K_ya + eps)).^2 .* kap.^2) .* sign(alp_r));
%     M_zr = D_r .* cos(atan(B_r .* alp_req)) .* cos(alp);
%     t = D_t .* cos(C_t*atan(B_t.*alp_teq - E_t.*(B_t.*alp_teq - atan(B_t.*alp_teq)))).*cos(alp);
%     F_y_ = F_y - S_Vyk;
% 
%     M_z = -t .* F_y_ + M_zr + s .* F_x;
% 
% 
% force_fx = F_x(:,1) + F_x_Roll(:,1);
% force_fx_rolling = F_x_Roll(:,1);
% force_fy = F_y(:,1);
% Mz = M_z(:,1);
end