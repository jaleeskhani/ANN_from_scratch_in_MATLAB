function layers = resetLayers(layers, batchSize, nClasses)

    for i = 1 : length(layers)              
        clear layers(1,i).iActiv; 
        layers(1,i).iActiv = zeros([batchSize, size(layers(i).iActiv, 2)]);        
    end
    
    clear layers(end).desOut;
    layers(end).desOut = zeros(batchSize,nClasses);
end

