function output = CeNN_stateCalculation(input, synaptic, feedback, threshold)
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
    %
    % Zero-input (Autonomous) class CNN, if and only if the inputSynapticMatrix
    % (B) =0;
    %
    % Uncoupled (scalar) class CNN, if and only if the feedbackMatrix A =
    % 0 except the center weights, each cell of an uncoupled CNN is described 
    % by a scalar nonlienar ODE which is not coupled with its neighbors.
    %  -stateX(:, 5) 
    
    %%
    bouTempRow = zeros(1, size(input, 2));
    bouTempColumn = zeros(size(input, 1) + 2, 1);
    Z = horzcat(bouTempColumn,  vertcat(bouTempRow, input, bouTempRow), bouTempColumn);
    [m, n] = size(Z);
% the whole neighborhood state vectors form the input data-set as:
    matrixToState = zeros((m-2) * (n-2), 9);
for i = 2 : m-1
    for j = 2 : n-1
        % get the neighbor cells' states
        temp = [ Z(i-1, j-1),  Z(i-1, j),   Z(i-1, j+1);...
                        Z(i, j-1),     Z(i, j),      Z(i, j+1); ...
                        Z(i+1, j-1), Z(i+1, j) ,  Z(i+1, j+1)];
        temp2 = reshape(temp', 9, 1); % pay attention to the reshape is column-wise arrangement!
        matrixToState((i-2) * (n-2) + j-1, :) = temp2';
    end
end
    %% output
    output = threshold * ones(size(matrixToState, 1), 1); + matrixToState * reshape(synaptic', 9, 1);
    
end



