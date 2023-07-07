function [ layers ] = randOut( layers )
    desOut = zeros(1,layers(end).LNeur);
    randIndx = randi([1 length(desOut)]);
    desOut(randIndx) = 1;
    layers(end).desOut = desOut;
end

