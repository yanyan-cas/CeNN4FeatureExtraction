function CeNN = CeNN_feedforward(CeNN, x)
% Input u_kl is usually the pixel intensity of image, normalized with
% -1 to 1 according to Chua's ; for a still iamge, u_kl is constant all
% the time, for video u_kl will be a function of time.
% normally, the inputSynaptic, feedback and bias could vary as position
% changes, here we assum they are time invariant.
% 
%
% A feedback synaptic weight in feedbackMatrix (A) is said to be
% excitatory if and only if it is positive,  (inhibitory if and only if it is negative)
%
% Zero-feedback (feedforward) class CNN: feedbackMatrix (A) = 0;
% Here is the Zero-feedback CeNN
%
% Zero-input (Autonomous) class CNN, if and only if the inputSynapticMatrix
% (B) =0;
%
% Uncoupled (scalar) class CNN, if and only if the feedbackMatrix A =
% 0 except the center weights, each cell of an uncoupled CNN is described 
% by a scalar nonlienar ODE which is not coupled with its neighbors.
%  -stateX(:, 5) 
    
n = CeNN.n;
equ = CeNN.equ;

%% the initialization is all x (input)
for i = 1: equ
    CeNN.U{1}{i} = x;
end

%% feedforward pass
for i = 2 : n
    for j = 1: equ

        %% the convolution operator is quite similar to the
        %  CoNN learning structure
        if strcmp(CeNN.layers{i-1}.type, 'CONV')
            input = CeNN.U{i-1}{j};
            threshold = CeNN.threshold{i-1}{j};
            % feedback = 0;
            synaptic = CeNN.synaptic{i-1}{j};
            CeNN.U{i}{j}= CeNN_stateCalculation(input, synaptic, feedback, threshold);              
        end

        %%  For the nonlinear mapping in the CoNN strucuture, the nonlinear
        %  template can be used.  Chua proved that all non-linear
        %  templates can be implemented as a series of linear templates
        %  using the standard CeNN non-linearity. The Rectified linear unit (ReLU) is a
        %  quite popular mapping function, one can execute the feed-forward
        %  template below to implement ReLU operator.
        % First, use synaptic B = [0 0 0; 0 1 0; 0 0 0], threshold Z = -1;
        % this make all values between -1 and 0 are simply set to -1.
        % Then one can shift the values back, increase by 1 and applyying
        % the template operation B = [0 0 0; 0 1 0; 0 0 0], Z = 1. As the
        % non-linearity thresholds a given value, these two linear
        % operations impement the required ReLU operator, which leaves all
        % positive values unchanged, and thresholds all values below 0.
        
        if strcmp(CeNN.layers{i-1}.type, 'NMPP')
            input = CeNN.U{i-1}{j};
            threshold = CeNN.threshold{i-1}{j};
            synaptic = CeNN.synaptic{i-1}{j};
            CeNN.U{i}{j}= CeNN_stateCalculation(input, synaptic, feedback, threshold);       
        end
        
        %%  pooling operations are employed to decrease the amount
        % of information between consecutive layers in a deep neural
        % network to compensate for the effects of small translations.
        % A pooling operation selects the maximum element in a region
        % around every value P(i, j) = max(f(i-k, j-l)). One can use the
        % template of GlobalMaximumFinder (Old names: GLOBMAX) to get
        % the 
       if strcmp(CeNN.layers{i-1}.type, 'POOLING')
            input = CeNN.U{i-1}{j};
            threshold = CeNN.threshold{i-1}{j};
            synaptic = CeNN.synaptic{i-1}{j};
            CeNN.U{i}{j}= CeNN_stateCalculation(input, synaptic, feedback, threshold);                  
       end

    end
end

    
    
end
