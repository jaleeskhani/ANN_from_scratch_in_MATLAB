function [ ] = halfingLRate( layers )
    for ii = 1 : size(layers, 2)
        layers(ii).LRate = layers(ii).LRate/2;
    end
end

