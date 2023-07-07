function [  ] = deltaWeight( layer )

    % in the reverse path layer end is current and layer end-1 is previous   
    layer.Prev.dweights = zeros(size(layer.Prev.iActiv, 2), size(layer.error, 2));
    batchSize = size(layer.iActiv, 1);
    for batchCtr = 1 : batchSize
        temp = layer.Prev.iActiv(batchCtr, :)' * layer.error(batchCtr,:);
        %% Debugging
        if sum(isnan(temp(:))) > 0
            fprintf('Drifted!\n');
        end
        layer.Prev.dweights = (layer.Prev.dweights + temp);
    end
    layer.Prev.dweights = layer.Prev.dweights * layer.LRate;
end

