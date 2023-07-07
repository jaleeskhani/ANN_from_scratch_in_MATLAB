function [ layers ] = backProp( layers )
    
    for i = length(layers) : -1 : 2
        
        %% error calculation
        errCal (layers(i), layers);              
        
        %% Weights clearing and calculating delta weight
        deltaWeight(layers(i));
        
        %% Weights Updation
        weigthUpdat (layers(i-1));
        
    end
end
