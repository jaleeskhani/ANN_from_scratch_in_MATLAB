function [ error ] = meanSqrErr( output, target, actFtn )
    switch actFtn
        case 'Sigmoid'
            error = output * (1 - output) * (target - output);
        case 'Relu'
            
        case 'Tanh'
            
        case 'Softmax'
            error = (target - output);
    end
end

