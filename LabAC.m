clear
clc
close
% Define the number of elements in the fibonacci sequence
n = 1;

% Define the 6 algorithms
algorithms = { "Dynamic Programming", "Iteration", "Matrix exponentiation", "Golden ratio formula", "Closed-form formula"};

% Initialize the results array to store the time taken by each algorithm
results = zeros(length(algorithms), 1);


n = 100000;
% Implement the Dynamic Programming algorithm
tic();
function fib = fib_dp(n)
  fib = zeros(n + 1, 1);
fib(1) = 0;
fib(2) = 1;
for i = 3 : n + 1
fib(i) = fib(i - 1) + fib(i - 2);
end
end
fib_dp(n);
results(1) = toc();

% Implement the Iteration algorithm
tic();
function fib = fib_iteration(n)
a = 0;
b = 1;
for i = 1 : n
temp = a;
a = b;
b = temp + b;
end
fib = a;
end
fib_iteration(n);
results(2) = toc();

% Implement the Matrix Exponentiation algorithm
tic();
function fib = fib_matrix(n)
if (n == 0)
fib =0;
else
A = [1, 1; 1, 0];
result = [1, 0];
for i = n - 1 : -1 : 0
result = result * (A^i);
end
fib = result(1);
end
end
fib_matrix(n);
results(3) = toc();

% Implement the Golden Ratio algorithm
tic();
function fib = fib_golden_ratio(n)
phi = (1 + sqrt(5)) / 2;
fib = round((phi^n - (1 - phi)^n) / sqrt(5));
end
fib_golden_ratio(n);
results(4) = toc();

% Implement the Closed-form formula algorithm
tic();
function fib = fib_closed_form(n)
sqrt5 = sqrt(5);
fib = round(((1 + sqrt5) / 2)^n / sqrt5);
end
fib_closed_form(n);
results(5) = toc();

% Print the results
for i = 1 : length(algorithms)
fprintf("Time taken by %s algorithm: %f\n", algorithms{i}, results(i));
end

% Generate the graph
bar(results);
xticks(1 : length(algorithms));
xticklabels(algorithms);
xlabel("Algorithms");
ylabel("Time (seconds)");
title("Comparison of time taken by different algorithms for generating fibonacci sequence");
