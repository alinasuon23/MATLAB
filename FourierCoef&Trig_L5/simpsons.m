function int_app= simpsons (a, b, n, mode, m)
    dx = (b-a)/n;
    x = a:dx:b; %intializes all the x, x0-xn
    sum = f(x(1), mode, m) + f(x(n+1), mode, m);
    for i =2:n %checks if its even 
        if (mod(i,2)==0) %even then its multipled
            sum= sum +4*f(x(i), mode, m);
        end 
        
        if (mod(i,2)==1)%odd mulipled by 2
            sum = sum+2*f(x(i), mode, m);
        end 
    end 
   int_app= sum*(b-a)/(3*n); %

end 
