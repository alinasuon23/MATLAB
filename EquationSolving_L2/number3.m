
a = input ('Input an array of coefficients: ');
b = input ('Input left endpoint: ');
c = input ('Input right endpoint: ');
d = input ('Input method(1=bisection, 2=newton, 3=secant): ');
n = 1;
rae_input = input ('Input max allowable absRel approx error: ');

new_X = b;
old_oldX = b-1;
abs_rel_approx_error = rae_input + 1; %make relative approx error > user input (for while loop)


while (abs_rel_approx_error > rae_input)
    if (n>1)
        %save old x into old_old x
        old_oldX=old_X;
    end
    
    %save current x into old x
    old_X = new_X;
    
    % bisection
    if (d==1)
        new_X= (b+c)/2;
        if((polynomial(a,b)<0) && (polynomial(a,c)>0) && (polynomial(a,new_X)>0))
            c=new_X;
        end
        if((polynomial(a,b)<0) && (polynomial(a,c)>0) && (polynomial(a,new_X)<0))
            b=new_X;
        end
        if((polynomial(a,b)>0) && (polynomial(a,c)<0) && (polynomial(a,new_X)>0))
            b=new_X;
        end
        if((polynomial(a,b)>0) && (polynomial(a,c)<0) && (polynomial(a,new_X)<0))
            c=new_X;
        end
    end
    % newton
    if (d==2)
       new_X= old_X - polynomial(a,old_X) / primePoly(a,old_X);
       if ((new_X < b) || (new_X > c))
           old_X=c; %set old_x = c to recalculate within bounds
           new_X= old_X - polynomial(a,old_X) / primePoly(a,old_X);
       end
    end
    % secant
    if (d==3)
        new_X = old_X - ((polynomial(a, old_X)* (old_X-old_oldX)) / ((polynomial(a, old_X)- polynomial(a, old_oldX))));
        if ((new_X < b) || (new_X > c))
           old_X = c; %set old_x = c to recalculate within bounds
           old_oldX= c-1;
           new_X = old_X - ((polynomial(a, old_X)* (old_X-old_oldX)) / ((polynomial(a, old_X)- polynomial(a, old_oldX))));
        end
    end
    
    

    %finds the absolute approximate relative error
    
    approx_error = new_X - old_X;
    %abs_approx_error = abs(approx_error);
    rel_approx_error = approx_error  / new_X ;
    abs_rel_approx_error = abs(rel_approx_error);

    
    if (n > 1)
        fprintf('\n%f\t%f\t%d\t%f', new_X, polynomial(a,new_X), n, abs_rel_approx_error);
    else
        fprintf('\nx\t\t\tpoly(a,x)\tn\tabs_rel_approx_error');
        fprintf('\n%f\t%f\t%d\t------------------', new_X, polynomial(a,new_X), n);
        abs_rel_approx_error = rae_input + 1; %make relative approx error > user input (for while loop)
    end
    
    if(polynomial(a,new_X) == 0)
        fprintf('<<< The solution of the polynomial is found\n' );
        break;
    end
    
    n = n+1; %keeping track of runs
end
    
