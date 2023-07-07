function [ deriv ] = derivative( choice, x )
    switch choice
        case 'Sigmoid'
            % deriv = (exp(-x))./((1+exp(-x)).^2);  % what is x ? is it input to the neuron ?
            deriv = x .* (1 - x);
        case 'Relu'
            deriv = poslin(x);
        case 'Tanh'
            deriv = 1 - (tanh(x).*tanh(x));
    end
end

