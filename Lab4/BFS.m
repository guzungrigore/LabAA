clc; 
clear;

function BFS(graph, start_node)
    visited = zeros(1, length(graph));
    queue = [start_node];
    visited(start_node) = 1;
    while ~isempty(queue)
        node = queue(1);
        disp(node);
        queue(1) = [];
        neighbors = graph{node};
        for i = 1:length(neighbors)
            if visited(neighbors(i)) == 0
                visited(neighbors(i)) = 1;
                queue = [queue neighbors(i)];
            end
        end
    end
end