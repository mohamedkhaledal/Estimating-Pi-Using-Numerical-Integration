% Define the function for the quarter circle
f = @(x) sqrt(1 - x.^2);

% Integration limits
a = 0;  % Lower limit
b = 1;  % Upper limit
n = 1000;  % Number of intervals (must be even for Simpson's rule)

% -------------------------
% Trapezoidal Rule
% -------------------------
h_trap = (b - a) / n;  % Step size for trapezoidal rule
x_trap = a:h_trap:b;   % Points on the x-axis
y_trap = f(x_trap);    % Function values

% Trapezoidal Rule formula
area_trap = h_trap * (y_trap(1)/2 + sum(y_trap(2:end-1)) + y_trap(end)/2);
pi_trap = 4 * area_trap;  % Multiply by 4 to approximate pi

% -------------------------
% Simpson's Rule
% -------------------------
if mod(n, 2) ~= 0
    error('n must be even for Simpson''s rule');
end

h_simp = (b - a) / n;  % Step size for Simpson's rule
x_simp = a:h_simp:b;   % Points on the x-axis
y_simp = f(x_simp);    % Function values

% Simpson's Rule formula
area_simp = (h_simp / 3) * (y_simp(1) + 4 * sum(y_simp(2:2:end-1)) + 2 * sum(y_simp(3:2:end-2)) + y_simp(end));
pi_simp = 4 * area_simp;  % Multiply by 4 to approximate pi

% -------------------------
% Exact pi value and errors
% -------------------------
pi_exact = pi;
error_trap = abs(pi_exact - pi_trap);
error_simp = abs(pi_exact - pi_simp);

% -------------------------
% Display results
% -------------------------
fprintf('pi              : %.18f\n', pi_exact);
fprintf('Trapezoidal Approximation : %.18f\n', pi_trap);
fprintf('Simpson''s Approximation    : %.18f\n', pi_simp);
fprintf('Trapezoidal Error         : %g\n', error_trap);
fprintf('Simpson''s Error           : %g\n', error_simp);
