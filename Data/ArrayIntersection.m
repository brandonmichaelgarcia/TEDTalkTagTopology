  
function intersection = ArrayIntersection(arr1, arr2)
    intersection = 0.0;
    intersection = nnz(arr1 & arr2);
end