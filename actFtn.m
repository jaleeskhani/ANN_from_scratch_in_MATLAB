function [ ftnOut ] = actFtn( vect, ftnType )
    switch ftnType
        case 'Sigmoid'
            ftnOut  = 1 ./ (1 + exp(-vect));
            if or(sum(isnan(ftnOut(:))) > 0, sum(isnan(vect(:))) > 0)
                fprintf('Drifted!\n');
            end
        case 'Relu'
            ftnOut = poslin(vect);
        case 'Tanh'
            ftnOut = tanh(vect);
        case 'Linear'
            ftnOut = vect;
        case 'Softmax'            
            ftnOut = exp(vect)./sum(exp(vect));
            if or(sum(isnan(ftnOut(:))) > 0, sum(isnan(vect(:))) > 0)
                fprintf('Drifted!\n');
            end
    end
end

