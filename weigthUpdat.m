function [ ] = weigthUpdat( currLayer )
    if or(sum(isnan(currLayer.weights(:))) > 0, sum(isnan(currLayer.dweights(:))) > 0)
        fprintf('Drifted!\n');
    end

    currLayer.weights = currLayer.weights + currLayer.dweights;

    if or(sum(isnan(currLayer.weights(:))) > 0, sum(isnan(currLayer.dweights(:))) > 0)
        fprintf('Drifted!\n');
    end

end

