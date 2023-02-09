% Fibonacci sequence generation using dynamic programming
clc
clear
close
% Initialize variables
n = 50000; % Number of elements in the sequence
fib = zeros(n,1); % Preallocate memory for the sequence
time_taken = zeros(n,1); % Preallocate memory for timing results

% Dynamic programming algorithm to calculate the nth Fibonacci number
tic;
fib(1) = 1;
fib(2) = 1;
for i = 3:n
    fib(i) = fib(i-1) + fib(i-2);
    time_taken(i) = toc;
end

% Plot the results
plot(1:n, time_taken)
xlabel('Element Number')
ylabel('Time (s)')
title('Time taken by dynamic programming algorithm for each element of the Fibonacci sequence')
