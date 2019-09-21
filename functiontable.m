function dydx = f(t,S,deriv) 
    if (deriv == 1) 
        dydx = (1/4) - (3/500)*S;
    end
    if (deriv == 2)
        dydx = (3/2500)* exp(-3*t/500);
    end
end