num_landmark_points = 40;
max_dimension = 2;
max_filtration_value = 0.3;
num_divisions = 300;
nu = 1;

explicit_metric_space = metric.impl.ExplicitMetricSpace(math_space);

landmark_selector = api.Plex4.createMaxMinSelector(explicit_metric_space, num_landmark_points);
R = landmark_selector.getMaxDistanceFromPointsToLandmarks();
R
stream = streams.impl.LazyWitnessStream(landmark_selector.getUnderlyingMetricSpace(), landmark_selector,  max_dimension + 1, max_filtration_value, nu, num_divisions);
stream.finalizeStream();
num_simplicies = stream.getSize()

algorithm = api.Plex4.getModularSimplicialAlgorithm(max_dimension + 1,2);
intervals = algorithm.computeAnnotatedIntervals(stream)


options.filename = 'mathTEDBarcodesLazyWitness';
options.max_filtration_value = max_filtration_value;
options.max_dimension = max_dimension;
plot_barcodes(intervals, options);