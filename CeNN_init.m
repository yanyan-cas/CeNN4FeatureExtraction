function [ CeNN] = CeNN_init( CeNN)
%rand('state',0)

    for j = 1:CeNN.n-1
            for i = 1 : CeNN.equ           
                CeNN.synaptic{j}{i} = zeros(3, 3) ;
                CeNN.z{j}{i}= zeros(1, 1);       
            end
    end
    
end
