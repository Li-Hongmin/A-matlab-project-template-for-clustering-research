function [performance, acc_mean, nmi_mean, time_mean] = evaluate(data, res, para)
    disp('Evaluating performance ...');
    [n_method, n_dataset] = size(res);
    algorithm = cell(1, n_method);
    [acc_mean, nmi_mean, time_mean, acc_std, nmi_std, time_std] = deal(zeros(n_dataset, n_method));
    [raw_acc, raw_nmi, raw_time] = deal(cell(n_dataset, n_method));
    for i = 1:n_method
        algorithm{i} = res(i, 1).method;

        for j = 1:n_dataset
            n_time = numel(res(i, j).raw_result);
            time_i = res(i, j).time_algo;
            
            [acc_i, nmi_i] = deal(0);

            for k = 1:n_time

                try
                    acc_i(k) = metric_acc(data(j).gnd(:), res(i, j).raw_result{k});
                    nmi_i(k) = metric_nmi(data(j).gnd(:), res(i, j).raw_result{k});
                end

            end

            acc_mean(j, i) = mean(acc_i);
            nmi_mean(j, i) = mean(nmi_i);
            time_mean(j, i) = mean(time_i);
            raw_acc{j,i} = acc_i;
            raw_nmi{j,i} = nmi_i;
            raw_time{j,i} = time_i;
            acc_std(j, i) = std(acc_i);
            nmi_std(j, i) = std(nmi_i);
            time_std(j, i) = std(time_i);
        end

    end

    performance = struct();
    acc_t = mean_std_table(acc_mean * 100, acc_std * 100);
    nmi_t = mean_std_table(nmi_mean * 100, nmi_std * 100);
    time_t = mean_std_table(time_mean, time_std);

    performance.raw_acc = raw_acc;
    performance.raw_nmi = raw_nmi;
    performance.raw_time = raw_time;
    performance.acc_mean = acc_mean * 100;
    performance.acc_std = acc_std * 100;

    
    performance.nmi_mean = nmi_mean * 100;
    performance.nmi_std = nmi_std * 100;

    
    performance.time_mean = time_mean;
    performance.time_std = time_std;
    [performance.ACC,performance.NMI,performance.Time] = deal([]);
    try
    performance.ACC = array2table(acc_t, ...
        'VariableNames', algorithm, 'RowNames', {data.name});
    performance.NMI = array2table(nmi_t, ...
        'VariableNames', algorithm, 'RowNames', {data.name});
    performance.Time = array2table(time_t, ...
        'VariableNames', algorithm, 'RowNames', {data.name});
    end
    %     write_table2latex(performance.ACC,[para.saved_name,'acc']);
    %     write_table2latex(performance.NMI,[para.saved_name,'nmi']);
    %     write_table2latex(performance.Time,[para.saved_name,'time']);

end
