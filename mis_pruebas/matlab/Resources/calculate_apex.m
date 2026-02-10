function v_grip = calculate_apex(k,params)

g = params.g;
muy = params.muy;
Clift = params.Clift;
m = params.m;

k(abs(k)<muy*Clift/m+eps) = muy*Clift/m+eps;
v_grip = sqrt(muy*g./(abs(k)-muy*Clift/m));

end