% Fibonacci sequence generation using the golden ratio

% Initialize variables
n = 50000; % Number of elements in the sequence
fib = zeros(n,1); % Preallocate memory for the sequence
time_taken = zeros(n,1); % Preallocate memory for timing results

% Golden ratio algorithm to calculate the nth Fibonacci number
tic;
phi = (1 + sqrt(5))/2; % The golden ratio
fib(1) = 1;
for i = 2:n
    fib(i) = round((phi^i - (1-phi)^i)/sqrt(5)); % The formula for the nth Fibonacci number using the golden ratio
    time_taken(i) = toc;
end

% Plot the results
plot(1:n, time_taken)
xlabel('Element Number')
ylabel('Time (s)')
title('Time taken by golden ratio algorithm for each element of the Fibonacci sequence')

