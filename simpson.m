clc; clear;
f = @(x) 5*x.^2 + x + 1; 
a = -3; b = 0; n = 6;
dx = (b - a) / n; 

% Midpoint Rule
x_mid = a + dx/2 : dx : b - dx/2;
midpoint_result = dx * sum(f(x_mid)); 

% Simpson's Rule
x = linspace(a, b, n+1); % n+1 points for Simpson's rule
simpson_result = (dx/3) * (f(x(1)) + 4*sum(f(x(2:2:end-1))) + 2*sum(f(x(3:2:end-2))) + f(x(end)));

% Exact value of the integral
exact_value = (5*b^3/3 + b^2/2 + b) - (5*a^3/3 + a^2/2 + a); 

% Errors
error_mid = abs(exact_value - midpoint_result); % Error for Midpoint Rule
error_simp = abs(exact_value - simpson_result); % Error for Simpson's Rule

% Display Results
disp('Task 1 Results:');
fprintf('Exact Value: %.5f\n', exact_value);
fprintf('Midpoint Rule: %.5f (Error: %.5f)\n', midpoint_result, error_mid);
fprintf('Simpson''s Rule: %.5f (Error: %.5f)\n', simpson_result, error_simp); 
