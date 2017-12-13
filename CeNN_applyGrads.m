    function CeNN = CeNN_applyGrads(CeNN)
    
    
    momentum = CeNN.momentum;
    weightPenaltyL2 = CeNN.weightPenaltyL2;
    
        for i = 1 : (CeNN.n - 1)
            if   strcmp(CeNN.layers{i}.type, 'g')           
                
                for j = 1:CeNN.equ
                    
                    if(momentum>0)                        
                        CeNN.a_old{i}{j}= (1 - momentum) * CeNN.da{i}{j} + momentum * CeNN.a_old{i}{j};
                        CeNN.da{i}{j} =   CeNN.a_old{i}{j};
                    end

                    if(weightPenaltyL2>0)                   
                        CeNN.da{i}{j}  =     CeNN.da{i}{j}  + weightPenaltyL2 *  CeNN.da{i}{j} ;
                    end

                    CeNN.a{i}{j}  =  CeNN.a{i}{j}  - CeNN.learningRate *  CeNN.da{i}{j} ;

                end
                
                
            end
        end
        
          
        
    end
