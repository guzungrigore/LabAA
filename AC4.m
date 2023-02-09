% Fibonacci sequence generation using matrix exponentiation
clc
clear
close
% Initialize variables
n = 50000; % Number of elements in the sequence
fib = zeros(n,1); % Preallocate memory for the sequence
time_taken = zeros(n,1); % Preallocate memory for timing results

% Matrix exponentiation algorithm to calculate the nth Fibonacci number
tic;
fib(1) = 1;
for i = 2:n
    A = [0, 1; 1, 1]; % The matrix used in matrix exponentiation
    fib_matrix = A^(i-1); % Raise the matrix to the power of i-1
    fib(i) = fib_matrix(1,2); % The nth Fibonacci number is in the second column of the first row
    time_taken(i) = toc;
end

% Plot the results
plot(1:n, time_taken)
xlabel('Element Number')
ylabel('Time (s)')
title('Time taken by matrix exponentiation algorithm for each element of the Fibonacci sequence')

