function [] = test_table_display(ATST1_results, ATST1_hitrate, ATST2_results, ATST2_hitrate, ATST3_results, ATST3_hitrate, filename)

    TA1matrix = [ATST1_results, ATST1_hitrate; ATST2_results, ATST2_hitrate; ATST3_results, ATST3_hitrate;];
    numCols = size(TA1matrix, 2);
    colNames = "p" + compose("%02d", 1:(numCols-1));
    colNames(numCols) = "Hit Rate";
    TA1 = array2table(TA1matrix,"RowNames",{'Test 1','Test 2','Test 3'}, "VariableNames", colNames)


    writetable(TA1, filename, 'WriteRowNames', true);