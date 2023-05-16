clc;
clear;
close all;

function [distances, path] = dijkstra(graph, start_vertex)
    n = size(graph, 1);
    distances = inf(1, n);
    distances(start_vertex) = 0;
    path = zeros(1, n);

    for i = 1:n-1
        [~, u] = min(distances);
        distances(u) = Inf;

        for v = 1:n
            if graph(u, v) ~= 0
                if distances(u) + graph(u, v) < distances(v)
                    distances(v) = distances(u) + graph(u, v);
                    path(v) = u;
                end
            end
        end
    end
end

function [distances, path] = floyd_warshall(graph)
    n = size(graph, 1);
    distances = graph;
    path = zeros(n);

    for k = 1:n
        for i = 1:n
            for j = 1:n
                if distances(i, j) > distances(i, k) + distances(k, j)
                    distances(i, j) = distances(i, k) + distances(k, j);
                    path(i, j) = k;
                end
            end
        end
    end
end

% Graphs with 4 nodes
sparse_graph = zeros(4, 4);
sparse_graph(1, 2) = 10;
sparse_graph(2, 4) = 5;
sparse_graph(3, 4) = 9;

dense_graph = ones(4, 4) - eye(4);
dense_graph(1, 2) = 10;
dense_graph(2, 4) = 5;
dense_graph(3, 4) = 9;

% Graphs with 8 nodes
n = 8;
sparse_graph = zeros(n, n);
sparse_graph(1, 2) = 3;
sparse_graph(1, 3) = 7;
sparse_graph(1, 6) = 2;
sparse_graph(2, 3) = 2;
sparse_graph(2, 4) = 4;
sparse_graph(2, 6) = 6;
sparse_graph(3, 4) = 5;
sparse_graph(3, 5) = 10;
sparse_graph(4, 5) = 3;
sparse_graph(4, 7) = 8;
sparse_graph(5, 7) = 2;
sparse_graph(6, 7) = 5;

dense_graph = ones(n, n) - eye(n);
dense_graph(1, 2) = 3;
dense_graph(1, 3) = 7;
dense_graph(1, 6) = 2;
dense_graph(2, 3) = 2;
dense_graph(2, 4) = 4;
dense_graph(2, 6) = 6;
dense_graph(3, 4) = 5;
dense_graph(3, 5) = 10;
dense_graph(4, 5) = 3;
dense_graph(4, 7) = 8;
dense_graph(5, 7) = 2;
dense_graph(6, 7) = 5;

n = 1000; % number of vertices
p = 0.1; % probability of an edge in a sparse graph
graph_sparse = sprand(n, n, p);
graph_sparse(graph_sparse ~= 0) = randi([1, 10], nnz(graph_sparse), 1);
graph_dense = randi([0, 10], n, n);

% Measure algorithm performance
tic;
[dijkstra_sparse_distances, dijkstra_sparse_path] = dijkstra(sparse_graph, 1);
dijkstra_sparse_time = toc;

tic;
[dijkstra_dense_distances, dijkstra_dense_path] = dijkstra(dense_graph, 1);
dijkstra_dense_time = toc;

tic;
[floyd_sparse_distances, floyd_sparse_path] = floyd_warshall(sparse_graph);
floyd_sparse_time = toc;

tic;
[floyd_dense_distances, floyd_dense_path] = floyd_warshall(dense_graph);
floyd_dense_time = toc;

% Plot the running times of the algorithms for the sparse and dense graphs
x = [1, 2, 3, 4];
y = [dijkstra_sparse_time, dijkstra_dense_time, floyd_sparse_time, floyd_dense_time];

figure;
bar(x, y);
set(gca, 'XTick', x);
set(gca, 'XTickLabel', {'Dijkstra (sparse)', 'Dijkstra (dense)', 'Floyd-Warshall (sparse)', 'Floyd-Warshall (dense)'});
ylabel('Running Time (seconds)');
title(sprintf("Performance of Dijkstra and Floyd-Warshall Algorithms on %d vertices", n));
