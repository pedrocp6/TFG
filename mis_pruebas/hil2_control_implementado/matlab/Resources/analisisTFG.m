res = zeros(length(out.debug2.signals.values),1);


for i=3:length(out.debug2.signals.values)
    res(i) = out.debug2.signals.values(i,1)-out.debug2.signals.values(i-1,1);
end

mean(res(:))

