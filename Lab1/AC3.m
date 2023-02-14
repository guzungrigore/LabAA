% Fibonacci sequence generation using iteration
clc
clear
close
% Initialize variables
n = 50000; % Number of elements in the sequence
fib = zeros(n,1); % Preallocate memory for the sequence
time_taken = zeros(n,1); % Preallocate memory for timing results

% Iterative algorithm to calculate the nth Fibonacci number
tic;
a = 0;
b = 1;
for i = 1 : n
temp = a;
a = b;
b = temp + b;
time_taken(i) = toc();
end
fib = a;

% Plot the results
plot(1:n, time_taken)
xlabel('Element Number')
ylabel('Time (s)')
title('Time taken by iterative algorithm for each element of the Fibonacci sequence')

