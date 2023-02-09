% Fibonacci sequence generation using recursion
clear
clc
close
% Initialize variables
n = 32; % Number of elements in the sequence
fib = zeros(n,1); % Preallocate memory for the sequence
time_taken = zeros(n,1); % Preallocate memory for timing results

% Recursive function to calculate the nth Fibonacci number
function res = fibonacci(n)
    if n <= 2
        res = 1;
    else
        res = fibonacci(n-1) + fibonacci(n-2);
    end
end

% Calculate the Fibonacci sequence using recursion
for i = 1:n
    tic;
    fib(i) = fibonacci(i);
    time_taken(i) = toc;
end

% Plot the results
plot(1:n, time_taken)
xlabel('Element Number')
ylabel('Time (s)')
title('Time taken by recursive algorithm for each element of the Fibonacci sequence')

