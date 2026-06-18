function ax_max = ggv_ax_max(v,k,params)

g = params.g;
muy = params.muy;
mux = params.mux;
Clift = params.Clift;
Cdrag = params.Cdrag;
m = params.m;

ay_max_v = muy*g + muy*Clift/m*v^2;
ax_max_v = mux*g + (mux*Clift-Cdrag)/m*v^2;

ax_max = ax_max_v*sqrt(1-abs(v^2*k/ay_max_v).^2);

end