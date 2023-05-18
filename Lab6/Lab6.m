clear; clc; close all;

function digit = bbp_pi(n)
    s = 0;
    for k = 0:n
        s = s + ((1/16)^k) * ((4/(8*k+1)) - (2/(8*k+4)) - (1/(8*k+5)) - (1/(8*k+6)));
    end
    hex_str = dec2hex(floor(mod(16*s, 16^14)));
    digit = hex2dec(hex_str(end));
end

function digit = chudnovsky_pi(n)
    k = 0;
    s = 0;
    while k <= n
        numerator = (-1)^k * factorial(6*k) * (13591409 + 545140134*k);
        denominator = factorial(3*k) * factorial(k)^3 * 640320^(3*k+1.5);
        s = s + numerator/denominator;
        k = k + 1;
    end
    pi_squared = 426880*sqrt(10005);
    pi = pi_squared / s;
    digit = floor(mod(pi*10^(n-1), 10));
end

function digit = spigot_pi(n)
    a = 10^n;
    b = ones(1, n+1) * 2;
    c = ones(1, n+1);
    d = ones(1, n+1);
    e = ones(1, n+1);
    f = 0;
    for k = 1:n
        carry = 0;
        for i = n:-1:1
            tmp = carry * i + d(i+1) * a + f;
            d(i+1) = mod(tmp, i);
            carry = floor(tmp / i);
        end
        f = carry;
        carry = 0;
        for i = 1:n
            tmp = c(i) * a + carry + d(i+1);
            d(i+1) = mod(tmp, i+1);
            carry = floor(tmp / (i+1));
        end
        c = d;
        e(k) = mod(c(1), a);
        carry = 0;
        for i = n:-1:1
            tmp = carry * i + b(i+1) + e(k) * c(i+1);
            b(i+1) = mod(tmp, a);
            carry = floor(tmp / a);
        end
        b(1) = carry;
    end
    digit = b(1);
end

n = 5;

% time the execution of the algorithms
tic;
bbp_pi(n);
bbp_time = toc;

tic;
chudnovsky_pi(n);
chudnovsky_time = toc;

tic;
spigot_pi(n);
spigot_time = toc;

% create a bar chart of the runtimes
times = [bbp_time, chudnovsky_time, spigot_time];
labels = {'BBP formula', 'Chudnovsky algorithm', 'Spigot algorithm'};
bar(times);
set(gca, 'XTickLabel', labels);
ylabel('Time (s)');
