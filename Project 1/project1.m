function [] = project1()



    % create "A Detector" perceptron 
    ptron_A_weights = zeros(1,20, "double");
    ptron_A_bias = 0;
    % create "E Detector" perceptron
    ptron_E_weights = zeros(1,20, "double");
    ptron_E_bias = 0;

    % create "A Detector" adaline perceptron
    aline_A_weights = zeros(1,20, "double");
    aline_A_bias = 0;
    % create "E Detector" adaline perceptron
    aline_E_weights = zeros(1,20, "double");
    aline_E_bias = 0;
    
    % learning rates Adaline
    learningrateA1 = 0.001;
    learningrateA2 = 0.05;
    learningrateA3 = 0.01;
    
    learningrateE1 = 0.001;
    learningrateE2 = 0.05;
    learningrateE3 = 0.01;

    % load input & test data
    load("PP-1.mat");
    load("TA-1.mat");
    load("TE-1.mat");

    load("TST1-1.mat");
    load("TST2-1.mat");
    load("TST3-1.mat");





    % train neurons
    [ptron_A_weights, ptron_A_bias] = train_perceptron(ptron_A_weights, ptron_A_bias, PP, TA, 10, 0.5, 'Perceptron A weights')
    [ptron_E_weights, ptron_E_bias] = train_perceptron(ptron_E_weights, ptron_E_bias, PP, TE, 10, 0.5, 'Perceptron E weights')
    
    % adaline A 
    [aline_A1_weights, aline_A1_bias, aline_A1_mse] = train_adaline(aline_A_weights, aline_A_bias, PP, TA, 25, learningrateA1, 'Adaline A')
    [aline_A2_weights, aline_A2_bias, aline_A2_mse] = train_adaline(aline_A_weights, aline_A_bias, PP, TA, 25, learningrateA2, 'Adaline A')
    [aline_A3_weights, aline_A3_bias, aline_A3_mse] = train_adaline(aline_A_weights, aline_A_bias, PP, TA, 25, learningrateA3, 'Adaline A')

    graph_meansquarederrors(aline_A1_mse, learningrateA1, aline_A2_mse, learningrateA2, aline_A3_mse, learningrateA3, "A")

    % adaline e
    [aline_E1_weights, aline_E1_bias, aline_E1_mse] = train_adaline(aline_E_weights, aline_E_bias, PP, TE, 25, learningrateE1, 'Adaline E')
    [aline_E2_weights, aline_E2_bias, aline_E2_mse] = train_adaline(aline_E_weights, aline_E_bias, PP, TE, 25, learningrateE2, 'Adaline E')
    [aline_E3_weights, aline_E3_bias, aline_E3_mse] = train_adaline(aline_E_weights, aline_E_bias, PP, TE, 25, learningrateE3, 'Adaline E')
    
    graph_meansquarederrors(aline_E1_mse, learningrateE1, aline_E2_mse, learningrateE2, aline_E3_mse, learningrateE3, "E")
    

    % decide which vesion of A and E adaline perceptrons are the best
    % referencing the graphs, 0.05 seems to have the best performance


    % test perceptrons 
    % first 5 are A, second 5 are E
    A_truth = [1, 1, 1, 1, 1,   -1, -1, -1, -1, -1,  -1, -1, -1, -1, -1,   -1, -1, -1, -1, -1,   -1, -1, -1, -1, -1,];
    E_truth = [-1, -1, -1, -1, -1,   1, 1, 1, 1, 1,   -1, -1, -1, -1, -1,   -1, -1, -1, -1, -1,   -1, -1, -1, -1, -1,];

    % a perceptron
    [ATST1_results, ATST1_hitrate] = perceptron_test(ptron_A_weights, ptron_A_bias, TST1, A_truth, false);
    [ATST2_results, ATST2_hitrate] = perceptron_test(ptron_A_weights, ptron_A_bias, TST2, A_truth, false);
    [ATST3_results, ATST3_hitrate] = perceptron_test(ptron_A_weights, ptron_A_bias, TST3, A_truth, false);

    test_table_display(ATST1_results, ATST1_hitrate, ATST2_results, ATST2_hitrate, ATST3_results, ATST3_hitrate, 'ptron_A_testResults.xlsx');


    % e perceptron
    [ETST1_results, ETST1_hitrate] = perceptron_test(ptron_E_weights, ptron_E_bias, TST1, E_truth, false);
    [ETST2_results, ETST2_hitrate] = perceptron_test(ptron_E_weights, ptron_E_bias, TST2, E_truth, false);
    [ETST3_results, ETST3_hitrate] = perceptron_test(ptron_E_weights, ptron_E_bias, TST3, E_truth, false);

    test_table_display(ETST1_results, ETST1_hitrate, ETST2_results, ETST2_hitrate, ETST3_results, ETST3_hitrate, 'ptron_E_testResults.xlsx');



    % a adaline
    [alineATST1_results, alineATST1_hitrate] = perceptron_test(aline_A2_weights, aline_A2_bias, TST1, A_truth, true);
    [alineATST2_results, alineATST2_hitrate] = perceptron_test(aline_A2_weights, aline_A2_bias, TST2, A_truth, true);
    [alineATST3_results, alineATST3_hitrate] = perceptron_test(aline_A2_weights, aline_A2_bias, TST3, A_truth, true);

    test_table_display(alineATST1_results, alineATST1_hitrate, alineATST2_results, alineATST2_hitrate, alineATST3_results, alineATST3_hitrate, 'aline_A_testResults.xlsx');
  

    % e adaline
    [alineETST1_results, alineETST1_hitrate] = perceptron_test(aline_E2_weights, aline_E2_bias, TST1, E_truth, true);
    [alineETST2_results, alineETST2_hitrate] = perceptron_test(aline_E2_weights, aline_E2_bias, TST2, E_truth, true);
    [alineETST3_results, alineETST3_hitrate] = perceptron_test(aline_E2_weights, aline_E2_bias, TST3, E_truth, true);

    test_table_display(alineETST1_results, alineETST1_hitrate, alineETST2_results, alineETST2_hitrate, alineETST3_results, alineETST3_hitrate, 'aline_E_testResults.xlsx');
