function [ layers ] = nwForward( layers, data )
    
    layers(1).iActiv = data;
    
    for i = 1 : length(layers) - 1
        
        %% Calculating each two connected layers (layer feed forward function)
        activations = lForward (layers(i).iActiv, layers(i).weights, layers(i).bias);
        netOut = actFtn (activations, layers(i).actFtn);
        if or(sum(isnan(activations(:))) > 0, sum(isnan(netOut(:))) > 0)
            fprintf('Drifted!\n');
        end
        layers(i+1).iActiv = netOut; % saving this layer netOut to this node(layer) of linked list   
    end
end