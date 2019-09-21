%if mode is one you do cos coeffi and if mode is 0 you do the sin
%coeffecients
%cos(mx) or sin(mx)
function ft= f(t, mode, m)
    ft = t^2; 
    if (mode == 1)
        ft= ft*cos(m*t);
    end 
    if (mode == 0)
        ft= ft*sin(m*t);
    end
end
    



%lab 4
% function dydx = f(t,S,deriv) 
%     if (deriv == 1) 
%         dydx = (1/4) - (3/500)*S;
%     end
%     if (deriv == 2)
%         dydx = (3/2500)* exp(-3*t/500);
%     end
% end

