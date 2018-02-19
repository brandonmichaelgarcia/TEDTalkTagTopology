dataframe = allTEDs;
nrows = size(dataframe,1);
metric_space = zeros(nrows, nrows);
for i = 1:nrows
    for j = i:nrows
        metric_space(i,j) = JaccardDissimilarity(dataframe(i,:), dataframe(j,:));
        metric_space(j,i) = metric_space(i,j);
    end
end

dataframe = MathTEDs;
nrows = size(dataframe,1);
math_space = zeros(nrows, nrows);
for i = 1:nrows
    for j = i:nrows
        math_space(i,j) = JaccardDissimilarity(dataframe(i,:), dataframe(j,:));
        math_space(j,i) = math_space(i,j);
    end
end

dataframe = TechTEDs;
nrows = size(dataframe,1);
tech_space = zeros(nrows, nrows);
for i = 1:nrows
    for j = i:nrows
        tech_space(i,j) = JaccardDissimilarity(dataframe(i,:), dataframe(j,:));
        tech_space(j,i) = tech_space(i,j);
    end
end