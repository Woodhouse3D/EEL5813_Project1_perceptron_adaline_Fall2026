function [weights, bias, MSE] = train_adaline(init_weights, init_bias, patterns, targets, total_epochs, learning_rate, modelname)


% must be in project folder
% cd('')

weights = init_weights;
bias = init_bias;


% inputs are a 20x25 matrix. each column is a different pattern



[~,total_patterns] = size(patterns);

% preallocate tracking matricies
[~, sizey] = size(weights)
weights_history = zeros(25 * total_epochs, sizey, "double");
errors = zeros(total_patterns,1);
MSE = zeros(total_epochs,1,"double");

update_cycles = 0;
weight_adjustments = 0;

for currentepoch = 1:total_epochs
    
    for c = 1:total_patterns
        input = patterns(:,c);
        weighted_sum = 0;

        [prediction, weighted_sum] = activate_adaline( weights, bias, input );

        error = targets(:,c) - weighted_sum;
        if error ~= 0
            weight_adjustments = weight_adjustments + 1;
        end
    
        % adjust weights
        [m,n] = size(weights);
        for j = 1:n
            old_weight = weights(:,j);
            
            new_weight = old_weight + learning_rate * error * input(j);
            weights(:,j) = new_weight;
        
        
        end
    
        % record result
        index = c + total_patterns * (currentepoch - 1);
        weights_history(index,:) =  weights_history(index,:) + weights;
        errors(c) = error;
        
    
        % adjust bias
        bias = bias + learning_rate * error;
        update_cycles = update_cycles + 1;
    end

    mse_currentepoch = mean(errors .^ 2);
    MSE(currentepoch) = mse_currentepoch;
end

update_cycles
weight_adjustments

figure;
plot(weights_history, 'LineWidth', 1.5);

xlabel('Time Step');
ylabel('Value');
title( modelname + " (a = " + learning_rate + ") weights");
labels = "weight " + (1:20); 
legend(labels, 'Location', 'bestoutside');
grid on;


    
