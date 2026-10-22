function [] = graph_meansquarederrors(mse1, learningrate1, mse2, learningrate2, mse3, learningrate3, letter)

        
    total_epochs = length(mse1);
    epochs = 1:total_epochs; % X-axis values
    
    % --- Plotting ---
    figure;
    hold on; % Keep all lines on the same chart
    
    % Plot each line with distinct markers and colors
    plot(epochs, mse1, '-o', 'Color', [0 0.4470 0.7410], 'LineWidth', 2, 'MarkerSize', 4);
    plot(epochs, mse2, '-s', 'Color', [0.8500 0.3250 0.0980], 'LineWidth', 2, 'MarkerSize', 4);
    plot(epochs, mse3, '-^', 'Color', [0.9290 0.6940 0.1250], 'LineWidth', 2, 'MarkerSize', 4);
    
    % --- Chart Styling ---
    title('Adaline ' + letter + ' Mean Squared Error (MSE) Comparison Across Epochs', 'FontSize', 12, 'FontWeight', 'bold');
    xlabel('Epoch', 'FontSize', 10);
    ylabel('Mean Squared Error', 'FontSize', 10);
    
    % Add a grid for readability
    grid on;
    
    % Label your specific lines in the legend
    label1 = ['a = ', num2str(learningrate1)];
    label2 = ['a = ', num2str(learningrate2)];
    label3 = ['a = ', num2str(learningrate3)];

    lgd = legend(label1, label2, label3, 'Location', 'northeast');
    title(lgd, 'Learning Rate');
    
    hold off;