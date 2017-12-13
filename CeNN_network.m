function [CeNN] = CeNN_network(CeNN, x, y, val_x, val_y, opts)

    m = size(train_x, 3);
    CeNN.batchsize = opts.batchsize;
    
    %% Initialization
    [CeNN] = CeNN_init(CeNN);
    
    [CeNN.val_acc]=CeNN_eval(CeNN, train_x, train_y, val_x, val_y, CeNN.lambda);
    














end
