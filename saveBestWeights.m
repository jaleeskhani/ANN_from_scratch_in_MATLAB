function [ bestWeights ] = saveBestWeights( layers )
    bestWeights = {};
    for ii = 1 : size(layers, 2) - 1
        bestWeights{1,ii} = layers(ii).weights;
    end
end

