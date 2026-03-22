function delta = calculate_steering(delta_sw, param)

% Function to calculate tire steer angle from steering rack data.
%
% We consider delta_outer = delta_sw, and then calculate delta_inner

delta_in_ackermann = atan(param.wheelbase*tan(delta_sw) / (param.wheelbase - tan(delta_sw)*param.trackwidthF));

if delta_sw > 0
    delta_fl = param.ackermann * (delta_in_ackermann - delta_sw) + delta_sw;
    delta_fr = delta_sw;
else 
    delta_fl = delta_sw;
    delta_fr = param.ackermann * (delta_in_ackermann - delta_sw) + delta_sw;
end

delta = [delta_fl; delta_fr; 0; 0];

end