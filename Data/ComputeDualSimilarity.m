dataframe = allTEDs;
nrows = size(dataframe,2);
metric_dual_space = zeros(nrows, nrows);
for i = 1:nrows
    for j = i:nrows
        metric_dual_space(i,j) = JaccardDissimilarity(dataframe(:,i), dataframe(:,j));
        metric_dual_space(j,i) = metric_dual_space(i,j);
    end
end

dataframe = MathTEDs;
nrows = size(dataframe,2);
math_dual_space = zeros(nrows, nrows);
for i = 1:nrows
    for j = i:nrows
        math_dual_space(i,j) = JaccardDissimilarity(dataframe(:,i), dataframe(:,j));
        math_dual_space(j,i) = math_dual_space(i,j);
    end
end

dataframe = TechTEDs;
nrows = size(dataframe,2);
tech_dual_space = zeros(nrows, nrows);
for i = 1:nrows
    for j = i:nrows
        tech_dual_space(i,j) = JaccardDissimilarity(dataframe(:,i), dataframe(:,j));
        tech_dual_space(j,i) = tech_dual_space(i,j);
    end
end