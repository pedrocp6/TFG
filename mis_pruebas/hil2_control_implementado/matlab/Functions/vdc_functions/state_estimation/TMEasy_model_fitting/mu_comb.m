function mu_comb = mu_comb(p,in)

sr = in(1);
sa = in(2);
px = p(1:5);
py = p(6:10);

sr_norm = p(4)/(p(4)+p(9)) + (p(2)/p(1))/(p(2)/p(1)+p(7)/p(6));
sa_norm = p(9)/(p(4)+p(9)) + (p(7)/p(6))/(p(2)/p(1)+p(7)/p(6));
s_comb = sqrt((sr/sr_norm)^2 + (sa/sa_norm)^2);
phi = atan2(sa/sa_norm, sr/sr_norm);
cos_phi = cos(phi);
sin_phi = sin(phi);

p_comb = [sqrt((px(1)*sr_norm*cos_phi)^2 + (py(1)*sa_norm*sin_phi)^2);
        sqrt((px(2)*cos_phi)^2 + (py(2)*sin_phi)^2);
        sqrt((px(3)*cos_phi)^2 + (py(3)*sin_phi)^2);
        sqrt((px(4)*cos_phi/sr_norm)^2 + (py(4)*sin_phi/sa_norm)^2);
        sqrt((px(5)*cos_phi/sr_norm)^2 + (py(5)*sin_phi/sa_norm)^2)];

mu_comb = mu_TME(p_comb, s_comb);

end

