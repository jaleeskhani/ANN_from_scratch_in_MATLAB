function [ ] = oneHotEncode( layers, batchLabels, nClasses, batchSize )
    layers(end).desOut = zeros([batchSize nClasses]);
    for i = 1 : batchSize
        layers(end).desOut(i, batchLabels(i) + 1) = 1;
    end
end

