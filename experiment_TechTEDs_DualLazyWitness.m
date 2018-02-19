num_landmark_points = 70;
max_dimension = 2;
num_divisions = 500;
nu = 0;

explicit_metric_space = metric.impl.ExplicitMetricSpace(tech_dual_space);

landmark_selector = api.Plex4.createMaxMinSelector(explicit_metric_space, num_landmark_points);
R = landmark_selector.getMaxDistanceFromPointsToLandmarks();
max_filtration_value = R

stream = streams.impl.LazyWitnessStream(landmark_selector.getUnderlyingMetricSpace(), landmark_selector,  max_dimension + 1, max_filtration_value, nu, num_divisions);
stream.finalizeStream();
num_simplicies = stream.getSize()

algorithm = api.Plex4.getModularSimplicialAlgorithm(max_dimension + 1,2);
intervals = algorithm.computeAnnotatedIntervals(stream)

options.filename = 'TechTagLazyWitness';
options.max_filtration_value = max_filtration_value;
options.max_dimension = max_dimension;
options.side_by_side = false;
plot_barcodes(intervals, options);