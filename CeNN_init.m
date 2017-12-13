function [ CeNN] = CeNN_init( CeNN)
%rand('state',0)

for j = 1:CeNN.n-1
    switch CeNN.layers{j}.type      
        case 'CONV'
            CeNN.layers{j}.input = 0;
            CeNN.layers{j}.state = 0;
            CeNN.layers{j}.output = 0;
            CeNN.layers{j}.threshold = 0;
            CeNN.layers{j}.feedback = 0;
            CeNN.layers{j}.synaptic = 0;    
        case 'NMPP'
            CeNN.layers{j}.input = 0;
            CeNN.layers{j}.state = 0;
            CeNN.layers{j}.output = 0;
            CeNN.layers{j}.threshold = 0;
            CeNN.layers{j}.feedback = 0;
            CeNN.layers{j}.synaptic = 0;  
        case 'POOLING'
             CeNN.layers{j}.input = 0;
            CeNN.layers{j}.state = 0;
            CeNN.layers{j}.output = 0;
            CeNN.layers{j}.threshold = 0;
            CeNN.layers{j}.feedback = 0;
            CeNN.layers{j}.synaptic = 0;   
    end
    
%     if strcmp(CeNN.layers{j}.type, 'g')
%         for i = 1:CeNN.equ
%            
%             CeNN.a{j}{i}=zeros(1,CeNN.a_num);
%             
%         end
%     end
%     
    
end
end
