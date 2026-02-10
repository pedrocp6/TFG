function [force_fy, force_fx, Mz, force_fx_rolling] = calculate_tire_forces(tire_load,slip_angle,slip_ratio,pac)

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

end