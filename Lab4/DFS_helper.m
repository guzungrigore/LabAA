clc; 
clear;

function DFS_helper(graph, node, visited)
    visited(node) = 1;
    disp(node);
    neighbors = graph{node};
    for i = 1:length(neighbors)
        if visited(neighbors(i)) == 0
            DFS_helper(graph, neighbors(i), visited);
        end
    end
end
