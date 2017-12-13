function CeNN = CeNN_feedforward(CeNN, x)

    n = CeNN.n;
    equ = CeNN.equ;
%% the initialization is all x (input)
for i = 1: equ
    CeNN.U{1}{i} = x;
end

%% feedforward pass
for i = 2 : n
    for j = 1: equ


        if strcmp(CeNN.layers{i-1}.type, 'CONV')
            CeNN.layers{i}.input = input;
            CeNN.layers{i}.state = input;
            CeNN.layers{i}.output = 0;
            CeNN.layers{i}.threshold = randomvalue;
            CeNN.layers{i}.feedback = 0;
            CeNN.layers{i}.synaptic = randomvalue;  
            
             CeNN.layers{i}.input = CeNN.layers{i}.threshold + CeNN.layers{i}.synaptic *  CeNN.layers{i}.input;
        end


        if strcmp(CeNN.layers{i-1}.type, 'NMPP')

        end
        
        % pooling corresponding 
       if strcmp(CeNN.layers{i-1}.type, 'POOLING')
           
       end

    end
end

    
    
end
