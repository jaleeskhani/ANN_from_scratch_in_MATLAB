function accurracy = evaluate(layers, data, labels, batchSize)
    nSamples = size(data, 1);
    if mod(nSamples, batchSize) ~= 0
        fprintf('Error ! data mod batchSize != 0 \n');
        return;
    end
    miss = 0;
    for miniBatchCtr = 0:1:(nSamples/batchSize)-1
        stIdx = miniBatchCtr * batchSize + 1;
        endIdx = stIdx + batchSize - 1;
        batchImages = data(stIdx:endIdx, :);
        batchLabels = labels(stIdx:endIdx);
        layers = nwForward (layers, batchImages);
        for ii = 1:1:batchSize
           [~, idx] = max(layers(end).iActiv(ii, :));
           if idx ~= (batchLabels(ii)+1)
                miss = miss + 1;
           end
        end
    end
    miss = miss / size(data, 1);
    accurracy = (1 - miss) * 100;
end