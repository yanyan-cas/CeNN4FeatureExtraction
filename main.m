clear
close all;
load('yaleB.mat')

trainSize = 10;
[x, y, val_x, val_y] = CeNN_makeData(yaleB, trainSize);

CeNN.lambda = 10;
CeNN.learningRate = 1;

opts.numepochs = 10;
opts.batchsize = 38 * trainSize;
CeNN.complex = 0;
CeNN.t = 0.5;

CeNN.scalingLearningRate = 0.95;
CeNN.momentum = 0;
CeNN.weightPenaltyL2 = 0;
CeNN.layers = {
         struct('type', 'CONV');
         struct('type', 'NMPPING');
         struct('type', 'POOLING');
         struct('type', 'g');  
         struct('type', 'g');
};

CeNN.equ = 1;
CeNN.Beta = 1; %regular term

CeNN.n =  numel(CeNN.layers) + 1;
[CeNN] = CeNN_network(CeNN, x, y, val_x, val_y, opts);

