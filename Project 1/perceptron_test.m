function [results, test_hitrate] = perceptron_test(weights, bias, test_data, ground_truth, adaline)


    [~,test_rowsize] = size(test_data);
    correct = 0;
    incorrect = 0;
    false_positive = 0;
    false_negative = 0;
    results = zeros(size(ground_truth));

    for pattern = 1:test_rowsize
        input = test_data(:,pattern);

        if adaline
            prediction = activate_adaline(weights, bias, input);
        else
            prediction = activate_perceptron(weights, bias, input);
        end
        
        %
        if prediction >= 0 & ground_truth(pattern) >= 0 | prediction < 0 & ground_truth(pattern) < 0
            correct = correct + 1;
            results(pattern) = 1;
        end

        if prediction >= 0 & ground_truth(pattern) < 0 % false positive
            incorrect = incorrect + 1;
            false_positive = false_positive + 1;
            results(pattern) = -1;
        end

        if prediction < 0 & ground_truth(pattern) >= 0 % false negative
            incorrect = incorrect + 1;
            false_negative = false_negative + 1;
            results(pattern) = -1;
        end

    end

    % HR = Hit Ratio = # correct classifications / # attempted classifications = # correct classifications / 25
    test_hitrate = correct / test_rowsize;
    false_positive;
    false_negative;


     