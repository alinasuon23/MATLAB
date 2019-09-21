
function sumPolyPrime = primePoly(a,x)

    n = length(a);
    a_prime = 1:n-1; %length of prime
    
      
    % find the prime coefficient    
    for i=1:n-1
        a_prime(i)=(n-i)*a(i);
    end
    
    sumPolyPrime = polynomial(a_prime,x);
 
    
end