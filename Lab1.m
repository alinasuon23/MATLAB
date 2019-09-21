%Alina Suon
%013096991
%September 9, 2018
%Lab_1


%Prompt the user for the absolute relative approximate error value & store
%in absRelativeApproxError
%absRelativeApproxError = input('What is the absolute relative approximate error? ');

%Problem 1

rae_input = input('input an absolute approximate error: ');
rel_approx_error = rae_input + 1; %make relative approx error > user input (for while loop)
current_approx = 0;
n = 1; %n=1 starts at 1 rectangle

while (rel_approx_error > rae_input)
    dx = 2*pi/n; %width of each rectangle
    s = 0; %sum
    x = 0; %variable for e^cosx
   
    for i = 1:n
        s = s + exp(cos(x)); %length of rectangle
        x = x + dx;   %update x
    end
   
    previous_approx = current_approx;
    current_approx = s * dx; %area
   
    approx_error = current_approx - previous_approx;
    abs_approx_error = abs(approx_error);
    rel_approx_error = abs_approx_error  / current_approx;
   
    if (n > 1)
        fprintf('\n%d\t%f\t%f\t%f', n, current_approx, abs_approx_error, rel_approx_error);
    else
        fprintf('\n%d\t%f\t--------\t--------', n, current_approx);
        rel_approx_error = rae_input + 1; %make relative approx error > user input (for while loop)
  
       
    end
    n = n + 1;
end

fprintf('\n \n');
       


%Problem 2
k = input('Enter a positive number: '); %variable for constant
m = input('Enter a positive integer: '); %number of terms to display
p = input('Enter a positive integer: '); %last term in sequence

x(1) = 1;

a = p-m+1; %first number to start printing
x = 1:p ; %declare size of array

for i = 2:p %calculating x_n start loop at 2 because x1=1
    x(i) = ( x(i-1) )/(1 - 1/(i^k)) ;
end

for n = a:p %printing x(p-m+1) - x(p)
    fprintf('x[%d] = %f\n', n, x(n) );
 
end


