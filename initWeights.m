function [ layers ] = initWeights( layers )
    weights = {};
    lrange = -0.1;
    urange = 0.1;
    for j = 1 : length(layers) - 1
        if layers(j).NType == 'C' || layers(j).NType == 'c'
            %% complex parameters
            % initiate random weights matrix between each two layers
            weights{j} = rand([layers(j).LNeur layers(j+1).LNeur]) + rand([layers(j).LNeur layers(j+1).LNeur])*1i;
            layers(j).weights = weights{1,j};                        
            %assign random weights matrix to current layer
            layers(j).bias  = rand([1 layers(j+1).LNeur]) + rand([1 layers(j+1).LNeur])*1i;%initiate random bias to each neuron in next layer
        else
            %% Real parameters
            weights{j} = lrange + (urange - lrange) .* rand([layers(j).LNeur layers(j+1).LNeur]);
            layers(j).weights = weights{1,j};
            lrange = 0;
            layers(j).bias  = lrange + (urange - lrange) .* rand([1 layers(j+1).LNeur]);
        end
    end
end