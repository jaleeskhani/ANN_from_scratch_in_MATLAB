function [ ] = errCal( layer, layers )
    batchSize = size(layer.iActiv, 1);
    if layer == layers(end)
        if layer.errType == 'MSE'  % if erro type is MSE in outer layer
            for batchCtr = 1 : batchSize
                for jj = 1 : layer.LNeur
                    layer.error(batchCtr, jj) = meanSqrErr(layer.iActiv(batchCtr, jj), layer.desOut(batchCtr, jj), layer.actFtn);
                end
            end
        elseif layer.errType == 'CEE' % if erro type is CEE in outer layer
            for batchCtr = 1 : batchSize
                for jj = 1 : layer.LNeur
                    layer.error(batchCtr,jj) = crossentropy(layer.iActiv(batchCtr,jj),layer.desOut(batchCtr,jj));
                end
            end
        end
        
        %% Debugging
        if or(sum(isnan(layer.error(:))) > 0, sum(isnan(layer.weights(:))) > 0)
            fprintf('Drifted!\n');
        end
    else
        summation = [];
        for batchCtr = 1 : batchSize
                summation(batchCtr,:) = layer.Next.error(batchCtr,:) * layer.weights';
        end
        layer.error = [];
        for batchCtr = 1 : batchSize
            layer.error(batchCtr,:) = layer.iActiv(batchCtr,:) .* (1 - layer.iActiv(batchCtr,:)) .* summation(batchCtr,:);
        end
        %% No need of taking derivative now as formula has calculated derivated inside itself
        % layer.error = derivative(layer.actFtn, layer.error); % U R throwing stones in the dark
        %layer.error = layer.error .* derivative(layer.actFtn, layer.iActiv);
        
        %% Debugging
        if or(sum(isnan(layer.error(:))) > 0, sum(isnan(layer.weights(:))) > 0)
            fprintf('Drifted!\n');
        end
    end
end