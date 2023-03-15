clear;
clc;
close all;

% initialize variables
n = 10000;
c = true(1,n);

% algorithm 1
tic;
c(1) = false;
i=2;
while (i<=n)
    if (c(i))
        j=2*i;
        while (j<=n)
            c(j) = false;
            j=j+i;
        end
    end
    i=i+1;
end
algorithm1 = toc

% algorithm 2
tic;
C = true(1,n);
C(1) = false;
i=2;
while (i<=n)
    j=2*i;
    while (j<=n)
        C(j) = false;
        j=j+i;
    end
    i=i+1;
end
algorithm2 = toc

% algorithm 3
tic;
C = true(1,n);
C(1) = false;
i=2;
while (i<=n)
    if (C(i))
        j=i+1;
        while (j<=n)
            if (mod(j,i) == 0)
                C(j) = false;
            end
            j=j+1;
        end
    end
    i=i+1;
end
algorithm3 = toc

% algorithm 4
tic;
C = true(1,n);
C(1) = false;
i=2;
while (i<=n)
    j=1;
    while (j<i)
        if (mod(i,j) == 0)
            C(i) = false;
        end
        j=j+1;
    end
    i=i+1;
end
algorithm4 = toc

% algorithm 5
tic;
C = true(1,n);
C(1) = false;
i=2;
while (i<=n)
    j=2;
    while (j<=sqrt(i))
        if (mod(i,j) == 0)
            C(i) = false;
        end
        j=j+1;
    end
    i=i+1;
end
algorithm5 = toc

% plot the results
figure;
bar([algorithm1, algorithm2, algorithm3, algorithm4, algorithm5]);
xlabel('Algorithm');
ylabel('Time (s)');
set(gca, 'XTickLabel', {'1', '2', '3', '4', '5'});
