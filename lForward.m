function [ out ] = lForward( in, weights, bias )
    out = [];
    batchSize = size(in, 1);
    for batchCtr = 1  : batchSize
        out(batchCtr,:) = in(batchCtr,:) * weights;
        out(batchCtr,:) = out(batchCtr,:) + bias;
    end
end