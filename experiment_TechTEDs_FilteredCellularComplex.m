max_dimension = 2;

stream = streams.impl.ExplicitCellStream();

vertex_frequency = zeros(size(TechTEDs,2));
vertices = [];
vertex_labels = [];
for i = 1:size(TechTEDs,1)
    for j = 1:size(TechTEDs,2)
        if (TechTEDs(i,j) == 1)
            vertex_frequency(j) = vertex_frequency(j) + 1;
            if (vertex_frequency(j) == 1)
                vertices = [vertices; homology.chain_basis.Cell()];
                vertex_labels = [vertex_labels; j];
            end
        end
    end
end

vertex_label_map = zeros(size(TechTEDs,2));
for i = 1:size(vertices,1)
    filtration_value = 1/( vertex_frequency(vertex_labels(i)) );
    stream.addElement(vertices(i), filtration_value);
    vertex_label_map(vertex_labels(i)) = i;
end
num_cells = stream.getSize()

numVertices = size(vertices,1);
edge_frequency = zeros(numVertices, numVertices);
for i = 1:size(TechTEDs,1)
    vertexInCell = [];
    for j = 1:size(TechTEDs,2)
        if (TechTEDs(i,j) == 1)
            vertexInCell = [vertexInCell; j];
        end
    end
    for j = 1:size(vertexInCell,1)
        for k = j+1:size(vertexInCell,1)
            m = vertex_label_map(vertexInCell(j));
            n = vertex_label_map(vertexInCell(k));
            edge_frequency(m, n) = edge_frequency(m, n) + 1;
        end
    end
end

count = 0;
edge_created = zeros(numVertices, numVertices);
TwoCells = [];
TwoCell_filtration_values = [];
for i = 1:size(TechTEDs,1)
    vertexInCell = [];
    for j = 1:size(TechTEDs,2)
        if (TechTEDs(i,j) == 1)
            vertexInCell = [vertexInCell; j];
        end
    end
    edgesInCell = [];
    filtrationValuesOfEdges = [];
    for j = 1:size(vertexInCell,1)
        for k = j+1:size(vertexInCell,1)
            m = vertex_label_map(vertexInCell(j));
            n = vertex_label_map(vertexInCell(k));
            if (edge_created(m, n) == 0)
                edge = homology.chain_basis.Cell(1, [vertices(m), vertices(n)] );
                filtrationValue = 1/edge_frequency(m, n) + 1.0;
                stream.addElement(edge, filtrationValue );
                filtrationValuesOfEdges = [filtrationValuesOfEdges; filtrationValue];
                edgesInCell = cat(2, edgesInCell, edge);
                edge_created(m, n) = 1;
            end
        end
    end
    
    if (size(edgesInCell, 1) > 1)
        maxEdgeFiltration = filtrationValuesOfEdges(1);
        for j = 2:size(filtrationValuesOfEdges, 1)
            if (filtrationValuesOfEdges(j) > maxEdgeFiltration)
                maxEdgeFiltration = filtrationValuesOfEdges(j);
            end
        end
        TwoCells = [TwoCells; homology.chain_basis.Cell(2, edgesInCell)];
        TwoCell_filtration_values = [TwoCell_filtration_values; maxEdgeFiltration];
    else
        count = count + 1;
    end
end
num_cells = stream.getSize()

for i = 1: size(TwoCells, 1)
    stream.addElement(TwoCells(i), TwoCell_filtration_values(i));
end

stream.finalizeStream();
num_cells = stream.getSize()

persistence = api.Plex4.getModularCellularAlgorithm(max_dimension + 1,2);
intervals = persistence.computeIntervals(stream);
Betti_numbers = intervals.getBettiNumbers()


options.filename = 'FilteredCellularTechTEDBarcodes';
options.max_filtration_value = 3.0;
options.max_dimension = max_dimension;
plot_barcodes(intervals, options);