function [ bestAcc, bestWeights ] = findBestAcc( accurracy, layers )
    bestAcc = accurracy;
    % saving best accurracy weights in a cell array
    bestWeights = saveBestWeights(layers);
end

