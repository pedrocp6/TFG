load("tirParamsv2025.mat")
pac = tirParams;

fields = fieldnames(pac);
for i = 1:numel(fields)
    if ischar(pac.(fields{i})) || isstring(pac.(fields{i}))
        pac = rmfield(pac, fields{i});
    end
end
clear fields i tirParams;

%% 5 pac pacejka pure force with combined fit
pac.Dlat = -1.5323;
pac.Clat = 1.7230;
pac.Blat = 12.7081;
pac.Elat = 0.4035;
pac.Slat = 0;

pac.Dlon = 1.0976;
pac.Clon = 1.9503;
pac.Blon = 17.4910;
pac.Elon = 0.999;
pac.Slon = 0;

pac.Gx1 = 2.4968e+04;
pac.bx = 0.2366;
pac.ax = 93733;
pac.cx =  0.1689;
pac.Gy1 = 38.2112;
pac.by = 0.5365;