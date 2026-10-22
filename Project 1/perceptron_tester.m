function [] = perceptron_tester()

% must be in project folder
% cd('')

% load input & test data
load("PP-1.mat");
load("TA-1.mat");

% empty weights & bias
% weights = [0;0;0;0;0; 0;0;0;0;0; 0;0;0;0;0; 0;0;0;0;0];
weights = zeros(1,20, "double");
bias = 1;
learning_rate = 1;


update_cycles = 0

[a,b] = size(PP);
for c = 1:b
    input = PP(:,c);

    prediction = activate_perceptron( weights, bias, input );
    prediction;

    error = TA(:,c) - prediction;

    % adjust weights
    [m,n] = size(weights);
    for j = 1:n
        old_weight = weights(:,j);
        
        new_weight = old_weight + learning_rate * error * input(j);
        weights(:,j) = new_weight;
    
    
    end
    
    % adjust bias
    bias = bias + learning_rate * error;
    update_cycles = update_cycles + 1;
end

update_cycles
weights
bias