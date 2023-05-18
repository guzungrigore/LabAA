function [MST, totalCost, elapsedTime] = prim(adjMatrix)
    n = size(adjMatrix, 1);  % Number of vertices
    visited = false(1, n);  % Mark all vertices as not visited
    MST = zeros(n-1, 2);  % Minimum Spanning Tree
    totalCost = 0;  % Total cost of the MST

    visited(1) = true;  % Start from vertex 1

    tic;  % Start the timer

    for k = 1:n-1
        minCost = Inf;
        minSrc = 0;
        minDest = 0;

        % Find the minimum cost edge from the visited vertices
        for i = 1:n
            if visited(i)
                for j = 1:n
                    if ~visited(j) && adjMatrix(i, j) < minCost
                        minCost = adjMatrix(i, j);
                        minSrc = i;
                        minDest = j;
                    end
                end
            end
        end

        MST(k, :) = [minSrc, minDest];  % Add the edge to the MST
        totalCost = totalCost + minCost;  % Update the total cost
        visited(minDest) = true;  % Mark the destination vertex as visited
    end

    elapsedTime = toc;  % Stop the timer
end