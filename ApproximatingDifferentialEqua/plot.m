T = input('input a time T > 0: ');
n = input('input a partition size n: ');
fprintf('input a method \n');
method = input('(0=Euler, 1 = predictor-correction, 2=exact second-order, 3 = midpoint, 4 = Ralston’s): \n');

x = 0:T/n:T;
h = T/n;
y = 1:n+1;
y(1) = 75;
y_true = 1:n+1;

for i = 1:n+1
    y_true(i) = S(x(i));
end

%euler's method
if (method == 0)
    for i = 1:n
        y(i+1) = y(i) + h*f(x(i),y(i),1);
    end
end

%predictor correction
if (method == 1)
    for i = 1:n
        y(i+1) = y(i) + h*f(x(i),y(i),1);
        y(i+1) = y(i) + (h/2) * (f(x(i),y(i),1) + f(x(i+1),y(i+1),1));
    end
end

%exact second order method
if (method == 2)
    for i = 1:n
        y(i+1) = y(i) + h*f(x(i),y(i),1)+ ((h^2)/2)*f(x(i),y(i),2);        
    end
end

%midpoint method
if (method == 3)
    for i = 1:n
        y(i+1) = y(i) + (h*f(x(i),y(i),1))/2;
        y(i+1) = y(i) + h * (f(x(i)+ h/2,y(i+1),1));
    end
end

%Ralston's method
if (method == 4)
    for i = 1:n
        y(i+1) = y(i) + 3*h/4*f(x(i),y(i),1);
        y(i+1) = y(i) + h*( 1/3*f(x(i),y(i),1) + 2/3*f(x(i)+3/4*h,y(i+1),1) );
    end
end

hold on
plot(x,y,'Color', [1 0 0]);
plot(x,y_true, 'Color', [0 0 0]);

hold off


