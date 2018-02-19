allTEDs = cell2mat(TEDtagMatrix);

MathIndicies = [];
n = 2550;
for i = 1:n
    if allTEDs(i,248) == 1
        MathIndicies = [MathIndicies; i];
    end
end


MathTEDs = zeros(size(MathIndicies,1), size(allTEDs,2));

for i = 1:size(MathIndicies,1)
    MathTEDs(i,:) = allTEDs(MathIndicies(i),:);
end



TechIndicies = [];
for i = 1:size(allTEDs,1)
    if allTEDs(i,378) == 1
        TechIndicies = [TechIndicies; i];
    end
end


TechTEDs = zeros(size(TechIndicies,1), size(allTEDs,2));

for i = 1:size(TechIndicies,1)
    TechTEDs(i,:) = allTEDs(TechIndicies(i),:);
end



DesignIndicies = [];
for i = 1:size(allTEDs,1)
    if allTEDs(i,150) == 1
        DesignIndicies = [DesignIndicies; i];
    end
end


DesignTEDs = zeros(size(DesignIndicies,1), size(allTEDs,2));

for i = 1:size(DesignIndicies,1)
    DesignTEDs(i,:) = allTEDs(DesignIndicies(i),:);
end

