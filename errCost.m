function sErr = errCost( layer)
        
        sErr = 0;
        if layer.errType == 'MSE'  % if erro type is MSE in outer layer
            for ii = 1 : size(layer.iActiv, 1)
                for jj = 1 : layer.LNeur
                    layer.error(ii, jj) = (layer.iActiv(ii, jj) - layer.desOut(ii, jj)).^2;
                end                
            end
            sErr = sum(layer.error(:)) / (size(layer.error, 1) * size(layer.error, 2));
        elseif layer.errType == 'CEE' % if erro type is CEE in outer layer
            for ii = 1 : size(layer.iActiv, 1)
                for jj = 1 : layer.LNeur
                    layer.error(ii,jj) = crossentropy(layer.iActiv(ii,jj),layer.desOut(ii,jj));
                end
            end
        end
end