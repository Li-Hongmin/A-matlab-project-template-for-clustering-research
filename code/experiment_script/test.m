function res = test(data, algorihtm, n, para)
    % res is cell(n_algorithm, n_data, n_times)
    
    n_algorihtms = numel(algorihtm);
    n_data = numel(data);
    % res = cell(n_algorihtms, n_data, n);
    res = struct('dataset', {}, 'method', {}, 'raw_result',{}, 'time_algo',{});
    msg = 'Conducting experiment on %d/%d method for %d/%d dataset ... \n';
    for i = 1:n_algorihtms
        for j = 1:n_data
            fprintf(msg ,...
            i,n_algorihtms,j,n_data);
            res(i,j).dataset = data(j).name;
            res(i,j).method = algorihtm(i).name;
            tmp = cell(n,1); 
            time_algo = zeros(n,1);
            for k = 1:n
                fprintf('%d/%d ', k,n);
                
                timer = tic;
                tmp{k} = feval(algorihtm(i).func, data(j), para);
                time_algo(k) = toc(timer);
                
            end
            res(i,j).raw_result = tmp;
            res(i,j).time_algo = time_algo;
            fprintf('\n')
        end
    end
end