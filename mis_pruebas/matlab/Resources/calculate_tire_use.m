mux_max = 1.1976;
muy_max = 1.3323;

combined_max = sqrt(muy_max^2 + mux_max^2);

FY = out.tire_bus.signals.values(:,13:16);
FX = out.tire_bus.signals.values(:,17:20);
Fz = out.tire_bus.signals.values(:,9:12);

sa = out.tire_bus.signals.values(:,1:4);
sr = out.tire_bus.signals.values(:,5:8);

tire_max = combined_max * Fz;
tire_use = sqrt(FY.^2+FX.^2);

plot(tire_max,'--k')
hold on
plot(tire_use,'r')

%% Tire overuse

sr_overuse = [(sign(diff(movmean(FX,50)./movmean(Fz,50))).*sign(diff(movmean(sr,50)))) > 0; false false false false];
sa_overuse = [movmean((sign(movmean(diff(movmean(FY,100)./movmean(Fz,100)),100)).*sign(diff(movmean(sr,100)))),100) > 0; false false false false];

slip = sqrt(sa.^2+sr.^2);
tire_overuse = [(sign(diff(movmean(tire_use,50)./movmean(Fz,50))).*sign(diff(movmean(slip,50)))) > 0; false false false false];
