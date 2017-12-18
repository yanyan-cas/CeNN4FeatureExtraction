function [CeNN] = CeNN_network(CeNN, x, y, val_x, val_y, opts)

m = size(train_x, 3);
CeNN.batchsize = opts.batchsize;

%% Initialization
[CeNN] = CeNN_init(CeNN);

[CeNN.val_acc]=CeNN_eval(CeNN, train_x, train_y, val_x, val_y, CeNN.lambda);
disp([' Original Val accurate is ' num2str(CeNN.val_acc)]);

%% Training
numepochs = opts.numepochs;
numbatches = m / CeNN.batchsize;
CeNN.testval_acc = [];

n = 1;
for i = 1 : numepochs
    tic;
    kk = randperm(m);

    for I = 1 : numbatches
        batch_x = train_x(:,:,kk((l - 1) * CeNN.batchsize + 1 : l * CeNN.batchsize));        
        batch_y = train_y(:,kk((l - 1) * CeNN.batchsize + 1 : l * CeNN.batchsize));
        CeNN=CeNN_feedforward(CeNN,batch_x);
        CeNN=CeNN_backPropagation(CeNN,batch_x, batch_y);
        CeNN = CeNN_applyGrads(CeNN);
        n = n + 1;
    end
    
    t = toc;
    CeNN.val_acc = [CeNN.val_acc, CeNN_eval(CeNN, train_x, train_y, val_x, val_y, CeNN.lambda)];
    
    
end














end
