function p_critical = compute_strauss_exponent(d)
    if d == 4
        p_critical = 2.0;
    elseif d == 5
        p_critical = (3 + sqrt(17))/4;
    elseif d == 6
        p_critical = (2 + sqrt(10))/2;
    else
        a = d-1; b = -(d+1); c = -2;
        p_critical = (-b + sqrt(b^2 - 4*a*c)) / (2*a);
    end
end
