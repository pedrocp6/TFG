function [mu] = mu_TME(p, s)

if(abs(s)<=p(4))
    sigma = abs(s)/p(4);
    mu = p(4)*p(1)*sigma/(1 + sigma*(sigma + p(1)*p(4)/p(2) - 2));
elseif(p(4)<abs(s) && abs(s)<=p(5))
    sigma = (abs(s) - p(4))/(p(5)-p(4));
    mu =  p(2) - (p(2)-p(3))*sigma^2*(3-2*sigma);
else
    mu = p(3);
end

mu = sign(s)*mu;

