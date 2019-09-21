
function poly_newton = poly_newton(b,x,z)

    poly_newton = b(1);
    n = length(b); %n = length(x);
    
    % add for the whole equation recursively
    for i=2:n
        product = 1;
        for j=1:i-1 % calculating the product inside parenthesis(z-x_0)
            product = product * ( z - x(j) );
        end
        %  multiply product with coefficient and add to old poly_newton
        poly_newton = poly_newton + ( b(i) * product );
        %fprintf('\n%d    %f', i, poly_newton);
    end
    
    fprintf('\nP[%d](%f) = %f\n', n-1, z, poly_newton);
end
