function P = Pn(t, c, d, n)%n=degree of the trig polynomial
    P = c(1); %c0
    %this is for c0 and keeps going for the number of degreees
    for m= 1:n
       P = P + c(m+1)*cos(m*t) + d(m+1)*sin(m*t);
 
    end 

end