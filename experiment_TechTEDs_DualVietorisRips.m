max_dimension = 2;
max_filtration_value = 0.96;
num_divisions = 300;

explicit_metric_space = metric.impl.ExplicitMetricSpace(tech_dual_space);

stream = api.Plex4.createVietorisRipsStream(explicit_metric_space,  max_dimension + 1, max_filtration_value, num_divisions);
stream.finalizeStream();
num_simplicies = stream.getSize()

algorithm = api.Plex4.getModularSimplicialAlgorithm(max_dimension + 1,2);

intervals = algorithm.computeAnnotatedIntervals(stream)


options.filename = 'TechTagsVietorisRips';
options.max_filtration_value = max_filtration_value;
options.max_dimension = max_dimension;
plot_barcodes(intervals, options);