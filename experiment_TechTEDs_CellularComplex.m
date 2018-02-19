max_dimension = 2;

stream = streams.impl.ExplicitCellStream();

used_tags = zeros(size(TechTEDs,2));
vertices = zeros(size(TechTEDs,2));
for i = 1:size(TechTEDs,1)
    for j = 1:size(TechTEDs,2)
        if (TechTEDs(i,j) == 1 && used_tags(j) ~= 1)
            used_tags(j) = 1;
            vertices(j) = stream.addNewVertex();
        end
    end
end

for i = 1:size(TechTEDs,1)
    vertexInCell = [];
    for j = 1:size(TechTEDs,2)
        if (TechTEDs(i,j) == 1)
            vertexInCell = [vertexInCell; j];
        end
    end
    edgesInCell = [];
    for j = 1:size(vertexInCell,1)
        for k = j+1:size(vertexInCell,1)
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
Betti_numbers = intervals.getBettiNumbers()


% options.filename = 'CellularMathTEDBarcodes';
% options.max_filtration_value = 5.0;
% options.max_dimension = max_dimension;
% plot_barcodes(intervals, options);