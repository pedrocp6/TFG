%% Generate estimation log
% Specify filename
if(param_vdc.gss_active)
    filename = 'Resources/estimation_with_gss_log.txt';
else
    filename = 'Resources/estimation_without_gss_log.txt';
end

% Open file for writing
fid = fopen(filename, 'w');

% Check if file opened successfully
if fid == -1
   error('Cannot open file for writing: %s', filename);
end

% Get the data
data = out.estimation_log.Data;

% Write each row of data
fprintf(fid, ['wz_IMU\t\tax_IMU\t\tay_IMU\t\tw_fl\t\tw_fr\t\tw_rl\t\tw_rr\t\t' ...
    'delta\t\tvx_GSS\t\tvy_GSS\t\tT_fl\t\tT_fr\t\tT_rl\t\tT_rr\t\t' ...
    'vx\t\t\tvy\t\t\twz\t\t\tsr_fl\t\tsr_fr\t\tsr_rl\t\tsr_rr\t\tsa_fl\t\tsa_fr\t\tsa_rl\t\tsa_rr' ...
    '\t\tFz_fl\t\tFz_fr\t\tFz_rl\t\tFz_rr\t\tphi_fl\t\tphi_fr\t\tphi_rl\t\tphi_rr']); 
fprintf(fid, '\n');
for i = 1:size(data,3)
   fprintf(fid, '%f\t', data(:,:,i)); % tab-separated, change '\t' to ' ' if you want space-separated
   fprintf(fid, '\n');
end

% Close file
fclose(fid);
disp(['Estimation log successfully written to ', filename]);