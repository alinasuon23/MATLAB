n = input('Input an integer n > 0, n: ');
m = input('Input an integer m > 0, m: ');

a = 0;
b=2*pi;
dx= (b-a)/m;

mode=1;
if(mode==1)
    c = 0:n;
    c(0+1) = 1/(2*pi)* simpsons(a,b,100, mode, 0);
    for v = 1:n
      c(v+1)=1/(pi) * simpsons(a,b,100, mode, v);  
    end
    
    %fprintf('c(%d) = %f', k, c(k+1));
end 

mode=0;
if(mode==0)
    d = 0:n;
    d(0+1) = 0;
    for v = 1:n
      d(v+1)=1/(pi) * simpsons(a,b,100, mode, v);  
    end
    
   % fprintf('d(%d) = %f', k, d(k+1));
end

x = a:dx:b; %x values
y_real = 1:m+1; %setting the size of y real
y = 1:m+1; %setting size of y 

%calculating and saving the real y values
for i=1:m+1
    y_real(i) = f(x(i),-2,-2);
end
%calculating and saving the approx 
for i=1:m+1
    y(i) = Pn(x(i), c, d, n);
end

hold on
linspace(0,2*pi,m);
plot(x,y,'Color', [1 0 0]); %y i approx red
plot(x,y_real, 'Color', [0 0 0]);% y is true value black

hold off
