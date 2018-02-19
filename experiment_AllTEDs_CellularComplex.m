max_dimension = 2;

stream = streams.impl.ExplicitCellStream();

vertices = zeros(size(allTEDs,2));
for i = 1:size(vertices,1)
    vertices(i) = stream.addNewVertex();
end

for i = 1:size(allTEDs,1)
    vertexInCell = [];
    for j = 1:size(allTEDs,2)
        if (allTEDs(i,j) == 1)
            vertexInCell = [vertexInCell; j];
        end
    end
    edgesInCell = [];
    for j = 1:size(vertexInCell,1)
        for k = j:size(vertexInCell,1)
            edge = stream.attachNewCell(1, [vertices(vertexInCell(j)), vertices(vertexInCell(k))] );
            edgesInCell = [edgesInCell; edge];
        end
    end
    stream.attachNewCell(2, edgesInCell);
end
stream.finalizeStream();
num_cells = stream.getSize()

persistence = api.Plex4.getModularCellularAlgorithm(max_dimension + 1,2);
intervals = persistence.computeIntervals(stream);
intervals.getBettiNumbers()

% options.filename = 'CellularMathTEDBarcodes';
% options.max_filtration_value = 2.0;
% options.max_dimension = max_dimension;
% plot_barcodes(intervals, options);