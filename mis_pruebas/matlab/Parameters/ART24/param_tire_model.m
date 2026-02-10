load("tirParamsv2025.mat")
pac = tirParams;

fields = fieldnames(pac);
for i = 1:numel(fields)
    if ischar(pac.(fields{i})) || isstring(pac.(fields{i}))
        pac = rmfield(pac, fields{i});
    end
end
clear fields i tirParams;

%% 3 pac pacejka pure force
pac.Dlat = -1.2;
pac.Clat = 2;
pac.Blat = 7.0;

pac.Dlon = 1.18;
pac.Clon = 1.3;
pac.Blon = 25;

pac.kAlphaP = 0.1809;
pac.kLambdaP = 0.1397;