function [MST, totalCost, elapsedTime] = kruskal(adjMatrix)
    n = size(adjMatrix, 1);  % Number of vertices
    numEdges = nnz(triu(adjMatrix));  % Number of edges
    edges = zeros(numEdges, 3);  % List of edges: [src, dest, weight]
    idx = 1;

    % Create a list of all edges in the graph
    for i = 1:n
        for j = i+1:n
            if adjMatrix(i, j) > 0
                edges(idx, :) = [i, j, adjMatrix(i, j)];
                idx = idx + 1;
            end
        end
    end

    % Sort the edges in non-decreasing order of weight
    edges = sortrows(edges, 3);

    MST = zeros(n-1, 2);  % Minimum Spanning Tree
    totalCost = 0;  % Total cost of the MST
    parent = 1:n;  % Array to track parent of each vertex

    tic;  % Start the timer

    k = 1;  % Index for MST edges
    mstEdges = 0;  % Number of edges in MST

    while k <= numEdges && mstEdges < n-1
        src = edges(k, 1);
        dest = edges(k, 2);
        weight = edges(k, 3);

        % Find the root parent of src and dest vertices
        if src > 0
            rootSrc = findParent(parent, src);
        else
            rootSrc = 0;
        end

        if dest > 0
            rootDest = findParent(parent, dest);
        else
            rootDest = 0;
        end

        % Check if including the edge creates a cycle
        if rootSrc ~= rootDest
            MST(mstEdges+1, :) = [src, dest];  % Add the edge to the MST
            totalCost = totalCost + weight;  % Update the total cost
            mstEdges = mstEdges + 1;  % Increment the number of edges in MST

            % Union the sets of src and dest vertices
            if rootSrc > 0 && rootDest > 0
                parent(rootSrc) = rootDest;
            elseif rootSrc > 0
                parent(rootSrc) = dest;
            elseif rootDest > 0
                parent(rootDest) = src;
            else
                parent(src) = dest;
            end
        end

        k = k + 1;  % Move to the next edge
    end

    elapsedTime = toc;  % Stop the timer

    MST = MST(1:mstEdges, :);  % Remove any unused entries in MST
end

function root = findParent(parent, vertex)
    if vertex == 0
        root = 0;
    elseif parent(vertex) ~= vertex
        parent(vertex) = findParent(parent, parent(vertex));
        root = parent(vertex);
    else
        root = vertex;
    end
end