    P = [0,0; 0.5,0.479; 1.3, 0.964; 3.14,0; 5,-11;];
    user_i = 4;
    user_j = 2;
 %is the matrix user inputs, i and j user inputs
    i = 1; %row 
    j = 1; %colum 
    
    %Fill m with zeros 
    m = zeros(user_i+1,user_i+1); 

    %this is to fill colum one with base case f[xn]=y_n
    for z=1:user_i+1
        m(z,1) = P(z,2);
    end
    
    %it fills the matrix recursively
    %i row tracker, j column tracker
    while(i < user_i + 1)
        while(j < user_i + 1)
            if(j > i)
                break;
            end
            m(i+1,j+1) = ( m(i+1, j) - m(i,j) ) / ( P(i+1,1) - P(i-j+1,1) );
            j = j + 1;
        end
        j = 1;
        i = i + 1;
    end
   
    % this prints everything
    fprintf('f[x%d', user_i);
    if(user_j ~= 0)
        for z=user_i-1:-1:user_i-user_j
            fprintf(',x%d', z);
        end
    end
    fprintf('] = %f\n', m(user_i+1,user_j+1));
    
    nddf = m(user_i+1,user_j+1);
    
