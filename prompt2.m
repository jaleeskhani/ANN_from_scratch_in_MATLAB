function [ layers ] = prompt2( inUnits, nClasses)
    %%  Default number of hidden layers and hidden neurons
    inNeur     = length(inUnits);
    hLayers    = 1;
    hNeur      = zeros(1,hLayers);
    hNeur(1)   = 30;
%     hNeur(2)   = 20;
%     hNeur(3)   = 15;
    LRate      = 0.01;
    NType      = 'R';         % Network type, R for real C for complex
    actFtn     = 'Sigmoid';   % Sigmoid, Relu, Tanh, Linear
    errType    = 'MSE';       % MSE, CEE
    %%  Initializing Doubly Linked List
    layers = initNetwork( inNeur, hNeur, nClasses, NType, LRate, actFtn, errType );
end