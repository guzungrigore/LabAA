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

n = 150; % number of vertices
p = 0.1; % probability of an edge in a sparse graph
graph_sparse = sprand(n, n, p);
graph_sparse(graph_sparse ~= 0) = randi([1, 10], nnz(graph_sparse), 1);
graph_dense = randi([0, 10], n, n);

% Measure algorithm performance
tic;
[dijkstra_sparse_distances, dijkstra_sparse_path] = dijkstra(graph_sparse, 1);
dijkstra_sparse_time = toc;

tic;
[dijkstra_dense_distances, dijkstra_dense_path] = dijkstra(graph_dense, 1);
dijkstra_dense_time = toc;

tic;
[floyd_sparse_distances, floyd_sparse_path] = floyd_warshall(graph_sparse);
floyd_sparse_time = toc;

tic;
[floyd_dense_distances, floyd_dense_path] = floyd_warshall(graph_dense);
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
