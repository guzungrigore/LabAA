clc; clear; close all;

% Generate a random adjacency matrix for testing
n = 500;  % Number of vertices
adjMatrix = rand(n, n);  % Random weights between 0 and 1
adjMatrix = adjMatrix + adjMatrix';  % Make the matrix symmetric

% Run Prim's algorithm
[MST_Prim, totalCost_Prim, elapsedTime_Prim] = prim(adjMatrix);

% Run Kruskal's algorithm
[MST_Kruskal, totalCost_Kruskal, elapsedTime_Kruskal] = kruskal(adjMatrix);

disp('Prim''s Algorithm:')
disp('Minimum Spanning Tree:')
for i = 1:size(MST_Prim, 1)
    disp(['Edge: ' num2str(MST_Prim(i, 1)) ' - ' num2str(MST_Prim(i, 2))])
end
disp(['Total Cost: ' num2str(totalCost_Prim)])
disp(['Elapsed Time: ' num2str(elapsedTime_Prim) ' seconds'])

disp('Kruskal''s Algorithm:')
disp('Minimum Spanning Tree:')
for i = 1:size(MST_Kruskal, 1)
    disp(['Edge: ' num2str(MST_Kruskal(i, 1)) ' - ' num2str(MST_Kruskal(i, 2))])
end
disp(['Total Cost: ' num2str(totalCost_Kruskal)])
disp(['Elapsed Time: ' num2str(elapsedTime_Kruskal) ' seconds'])


% Plotting the results in a graph
x = [1, 2];
y = [elapsedTime_Prim, elapsedTime_Kruskal];
labels = {'Prim''s Algorithm', 'Kruskal''s Algorithm'};

figure;
bar(x, y);
set(gca, 'xticklabel', labels);
ylabel('Elapsed Time (seconds)');
title('Comparison of Execution Time');
