clc;
clear;

function DFS(graph, start_node)
    visited = zeros(1, length(graph));
    DFS_helper(graph, start_node, visited);
end
