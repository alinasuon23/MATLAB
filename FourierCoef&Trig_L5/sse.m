function int_app1= sse (a, b, c, d, n)
    dx = (b-a)/1000;
    x = a:dx:b;
    %passes in -2 because it doesnt go thru f.m
    sum = (f(x(1), -2, -2) - Pn(x(1),c,d,n))^2 + (f(x(n+1), -2, -2) - Pn(x(n+1),c,d,n))^2;
    for i =2:1000
        if (mod(i,2)==0) %even then its multipled
            sum= sum +4*(f(x(i), -2, -2) - Pn(x(i),c,d,n))^2;
        end 
        
        if (mod(i,2)==1)%odd mulipled by 2
            sum= sum +2*(f(x(i), -2, -2) - Pn(x(i),c,d,n))^2;
        end 
    end 
    %same thing as simpsons but just changed to the 2nd forumula 
   int_app1= sum*(b-a)/(3*1000);

end 
