clc; 
clear;
close all;

% Define the balanced graph
graph_balanced = cell(1, 12);
edges_balanced = [1 2; 1 3; 1 4; 2 5; 2 6; 2 7; 3 8; 3 9; 3 10; 4 11; 4 12];
for i = 1:size(edges_balanced, 1)
    graph_balanced{edges_balanced(i, 1)} = [graph_balanced{edges_balanced(i, 1)} edges_balanced(i, 2)];
    graph_balanced{edges_balanced(i, 2)} = [graph_balanced{edges_balanced(i, 2)} edges_balanced(i, 1)];
end

% Define the unbalanced graph
graph_unbalanced = cell(1, 12);
edges_unbalanced = [1 2; 1 3; 2 4; 2 5; 4 6; 4 7; 5 8; 5 9; 6 10; 6 11; 10 12];
for i = 1:size(edges_unbalanced, 1)
    graph_unbalanced{edges_unbalanced(i, 1)} = [graph_unbalanced{edges_unbalanced(i, 1)} edges_unbalanced(i, 2)];
    graph_unbalanced{edges_unbalanced(i, 2)} = [graph_unbalanced{edges_unbalanced(i, 2)} edges_unbalanced(i, 1)];
end

% Choose a start node
start_node = 1;

% Run DFS and measure the running times for both graphs
tic;
DFS(graph_balanced, start_node);
dfs_time_balanced = toc;

tic;
BFS(graph_balanced, start_node);
bfs_time_balanced = toc;

tic;
DFS(graph_unbalanced, start_node);
dfs_time_unbalanced = toc;

tic;
BFS(graph_unbalanced, start_node);
bfs_time_unbalanced = toc;

% Plot the results in a bar graph
x_values = 1:2;
x_labels = {'Balanced Graph', 'Unbalanced Graph'};
y1 = [dfs_time_balanced bfs_time_balanced; dfs_time_unbalanced bfs_time_unbalanced];
bar(x_values, y1);
legend('DFS', 'BFS');
xlabel('Graph');
ylabel('Running time (seconds)');
set(gca, 'XTickLabel', x_labels);
