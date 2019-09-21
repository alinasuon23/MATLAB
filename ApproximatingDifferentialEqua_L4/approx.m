T = input('input a time T > 0: ');
n = input('input a partition size n: ');
fprintf('input a method \n');

x = 0:T/n:T;
h = T/n;
y = zeros(5,n);
for i = 1:5
    y(i,1) = 75;
end

% 75 0 0 0 
% 75 0 0 0
% 75 0 0 0


y_true = 1:n+1;

for i = 1:n+1
    y_true(i) = S(x(i));
end

%euler's method

for i = 1:n
    y(1,i+1) = y(1,i) + h*f(x(i),y(1,i),1);
end


%predictor correction

for i = 1:n
    y(2,i+1) = y(2,i) + h*f(x(i),y(2,i),1);
    y(2,i+1) = y(2,i) + (h/2) * (f(x(i),y(2,i),1) + f(x(i+1),y(2,i+1),1));
end


%exact second order method

for i = 1:n
    y(3,i+1) = y(3,i) + h*f(x(i),y(3,i),1)+ ((h^2)/2)*f(x(i),y(3,i),2);        
end


%midpoint method

for i = 1:n
    y(4,i+1) = y(4,i) + (h*f(x(i),y(4,i),1))/2;
    y(4,i+1) = y(4,i) + h * (f(x(i)+ h/2,y(4,i+1),1));
end


%Ralston's method

for i = 1:n
    y(5,i+1) = y(5,i) + 3*h/4*f(x(i),y(5,i),1);
    y(5,i+1) = y(5,i) + h*( 1/3*f(x(i),y(5,i),1) + 2/3*f(x(i)+3/4*h,y(5,i+1),1) );
end


distance = 1:5;
for m=1:5
    sum = 0;
    for i = 2: n + 1
        sum = sum + (y(m,i) - y_true(i))^2;
    end
    distance(m)= sqrt(sum);
end

fprintf('\nMethod name:\t\t\tApproximate distance:');
for m=1:5
    fprintf('\n');
    if(m==1) 
        fprintf('Euler''s---------------\t');
    end
    if(m==2) 
        fprintf('predictor-correction--\t');
    end
    if(m==3) 
        fprintf('exact second-order----\t');
    end
    if(m==4) 
        fprintf('midpoint--------------\t');
    end
    if(m==5) 
        fprintf('Ralston''s-------------\t');
    end
    fprintf('%f', distance(m));
end


