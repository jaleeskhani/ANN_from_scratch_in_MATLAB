function [ layers ] = initNetwork( iLNeur, hNeur, outNeur, NType, LRate, actFtn, errType )
%% Prompting User

%% Initiliazing doubly linked list
    layers = dlnode.empty;
    for i = 1 : length(hNeur) + 2
        if i == 1
            layers(i) = dlnode('Input Layer','Fully Connected',NType,iLNeur,0,0,0,0,actFtn,errType,0,LRate,0);
        elseif i > length(hNeur) + 1
            layers(i) = dlnode('Output Layer','Fully Connected',NType,outNeur,0,0,0,0,'Sigmoid',errType,0,LRate,0);
        else
            layers(i) = dlnode(['Hidden Layer ' num2str(i-1)],'Fully Connected',NType,hNeur(i-1),0,0,0,0,actFtn,errType,0,LRate,0);
        end
    end

%% Linking the structure of list to Neural Network (Fully Connected)
    for i = 1 : length(layers) - 1
        layers(i+1).insertAfter(layers(i));
    end
end