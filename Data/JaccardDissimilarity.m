function distance = JaccardDissimilarity(arr1, arr2)
    distance = 1.0 - ArrayIntersection(arr1,arr2) / ArrayUnion(arr1, arr2);
    