  
function union = ArrayUnion(arr1, arr2)
    union = 0.0;
    union = nnz(arr1 | arr2);
end