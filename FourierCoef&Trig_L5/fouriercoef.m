k = input('Input an integer k >= 0, k: ');
mode = input('Enter 1 for cos and 0 for sin, mode: ');

a = 0; %starting value 
b=2*pi;%ending value 
n=100;%number of segements for simpsons 

if(mode==1)
    c = 0:k;
    c(0+1) = 1/(2*pi)* simpsons(a,b,n, mode, 0); %first coeffienct 
    for m = 1:k
      c(m+1)=1/(pi) * simpsons(a,b,n, mode, m);  %remaining of the coeffiecent 
    end
    
    fprintf('c(%d) = %f', k, c(k+1));
end 

%same thing as above but its for the d 
if(mode==0)
   d = 0:k;
    d(0+1) = 0;
    for m = 1:k
      d(m+1)=1/(pi) * simpsons(a,b,n, mode, m);  
    end
    
    fprintf('d(%d) = %f', k, d(k+1));
end

