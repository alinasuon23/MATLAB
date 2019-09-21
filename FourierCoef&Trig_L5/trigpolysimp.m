n = input('Input an integer n > 0, n: ');

a = 0;
b=2*pi;

mode=1;
if(mode==1)
    c = 0:n;
    c(0+1) = 1/(2*pi)* simpsons(a,b,100, mode, 0);
    for m = 1:n
      c(m+1)=1/(pi) * simpsons(a,b,100, mode, m);  
    end
    
    %fprintf('c(%d) = %f', k, c(k+1));
end 

mode=0;
if(mode==0)
    d = 0:n;
    d(0+1) = 0;
    for m = 1:n
      d(m+1)=1/(pi) * simpsons(a,b,100, mode, m);  
    end
    
   % fprintf('d(%d) = %f', k, d(k+1));
end
%SSE is the same thing as simposns but with differnt functions
SSE = sse(a, b, c, d, n); %pass in the starting and ending point, c coeffencents, d coeffiencts and 
                            %number of segements

fprintf('sse = %f', SSE);

