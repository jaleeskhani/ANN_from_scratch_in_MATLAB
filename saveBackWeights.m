function [ layers ] = saveBackWeights( bestWeights, layers )
    for ii = 1 : size(layers, 2) - 1
         layers(ii).weights = bestWeights{1,ii};
    end
end

