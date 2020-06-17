function performance = evaluate(data, res)
    performance = struct('ACC (%)',{},'NMI (%)', {});
    [n_method, n_dataset] = size(res);
    
    [acc_i, nmi_i] = deal(zeros(n_method, n_dataset));
    for i = 1: n_method
        for j = 1: n_dataset
            n_time = size(res(j,i).res,1);
            for k = 1:n_time
                acc_i(i,j) = metric_acc(data(j).gnd, res(j,i).raw_result{k});
                nmi_i(i,j) = metric_nmi(data(j).gnd, res(j,i).raw_result{k});
            end
        end
    end
end