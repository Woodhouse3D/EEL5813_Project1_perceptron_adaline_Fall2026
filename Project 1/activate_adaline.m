% perceptron function with heavyside activation function
function [value, weighted_sum] = activate_adaline(weights, bias, input)

% calculate weighted sum
weighted_sum = weights * input + bias;

% calculate activation
if weighted_sum >= 0
    value = 1;
else
    value = -1;
end