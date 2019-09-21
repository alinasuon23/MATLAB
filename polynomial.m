%function for polynomial
function sumPoly = polynomial(a,x)

    n = length(a); %checks length of array
    sumPoly = a(1); %sets first sumPoly = first array index

    for i=2:n; %for loop from i=2 to n
        sumPoly = a(i)+ sumPoly * x; %sum direct method
    end
    
end


