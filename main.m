tic
clear; clc;
rng('default');

%% Load MNIST dataset
allImages = loadMNISTImages('train-images.idx3-ubyte');
allLabels = loadMNISTLabels('train-labels.idx1-ubyte');
testImages  = loadMNISTImages('t10k-images.idx3-ubyte');
testLabels  = loadMNISTLabels('t10k-labels.idx1-ubyte');
validImages = allImages(:,50001:60000);
validLabels = allLabels(50001:60000);
trainImages = allImages(:,1:50000);
trainLabels = allLabels(1:50000);
nClasses    = 10;
inpUnits    = trainImages(:,1)';

%% Promping user and Initializing Doubly Linked List
layers = prompt2(inpUnits, nClasses);

%% Weight array random initialization
initWeights(layers);

miniBatchSize = 100;
trainSetSize = size(trainImages, 2);
MaxEpochs = 10;

%% intializing the input layer size
layers(1).iActiv = zeros([miniBatchSize, size(trainImages, 1)]);
layers(end).desOut = zeros(miniBatchSize,nClasses);
tempAcc = 0;
count   = 0;

%% training the network
for epochCtr = 1:1:MaxEpochs
    %shuffle the dataset before each epoch
    for miniBatchCtr = 0:1:floor(trainSetSize/miniBatchSize)-1
       stIdx = miniBatchCtr * miniBatchSize + 1;
       endIdx = stIdx + miniBatchSize - 1;
       batchImages = trainImages(:, stIdx:endIdx);
       batchLabels = trainLabels(stIdx:endIdx);
       %% To set desire output according to labels
       oneHotEncode(layers, batchLabels, nClasses, miniBatchSize);
    
       %% Feed Forward Propagation
       nwForward (layers, batchImages');
         
       %% Back Propagation Error Caluculation
       backProp (layers);
        
    end
    %% Checking accuracy after each epoch
    testBatch = 100;
    resetLayers(layers, testBatch, nClasses);
    accurracy = evaluate(layers, validImages', validLabels, testBatch);
    fprintf('%d. Accracy after epoch number %d is : %d\n', epochCtr, epochCtr, accurracy);
    
    %% search for best accurracy
    if tempAcc < accurracy
        [bestAcc, bestWeights] = findBestAcc(accurracy, layers);
    end
    %% check for constant accurracy
    if tempAcc == accurracy
        count = count + 1;
    end
    %% If accurracy does not improve further
    if count >= 3
        halfingLRate(layers);
        % replacing best accurracy weights with repeating accurracy
        layers = saveBackWeights(bestWeights, layers);
        count = 0;
    end
    tempAcc = accurracy;
    
    %% reseting layers value accoriding to training set and training batch size
    layers(1).iActiv = zeros([miniBatchSize, size(trainImages, 1)]);
    layers(end).desOut = zeros(miniBatchSize,nClasses);
    
end

%% reset layers and evalute with the pre-trained networks
testBatch = 100;
resetLayers(layers, testBatch, nClasses);
accurracy = evaluate(layers, testImages', testLabels, testBatch);
fprintf('Accracy on Testing set is : %d\n', accurracy);

%% END
toc