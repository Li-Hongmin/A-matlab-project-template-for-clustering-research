function run(data, algorihtm, n, para, rundata, runalgo, forcereplace)
    % res is cell(n_algorithm, n_data, n_times)
    
    n_algorihtms = numel(algorihtm);
    if nargin < 5
        rundata = 1:numel(data); 
    end
    if nargin < 6
        runalgo = 1:numel(algorihtm); 
    end
    if nargin < 7
        forcereplace = false;
    end
    n_data = numel(data);
    % res = cell(n_algorihtms, n_data, n);
    res = struct('dataset', {}, 'method', {}, 'raw_result', {}, 'time_algo', {});
    msg = 'Conducting experiment on %d/%d method for %d/%d dataset ... \n';
    msg_read = 'Read results on %d/%d method for %d/%d dataset ... \n';


    for idx_i = 1:numel(runalgo)
        i = runalgo(idx_i);

        for idx_j = 1:numel(rundata)
            j = rundata(idx_j);

            fprintf(msg, ...
                i, n_algorihtms, j, n_data);
%             res(i, j).dataset = data(j).name;
%             res(i, j).method = algorihtm(i).name;
%             tmp = cell(n, 1);
%             time_algo = zeros(n, 1);
      
            if strcmp(algorihtm(i).name, 'FastESC') && (j >= 5)
                continue
            end
            if strcmp(algorihtm(i).name, 'SC') && (j >= 5)
                continue
            end
            

            for k = 1:n
                fprintf('%d/%d ', k, n);
                single_res_name = ['res', int2str(i), int2str(j), num2str(k, '%0.2d')];
                full_file_address = ['results/', para.saved_name, '/', single_res_name, '.mat'];

                if ~exist(full_file_address, 'file') || forcereplace
                    try
                        timer = tic;
                        tmp = feval(algorihtm(i).func, data(j), para);
                        time_algo = toc(timer);
                        save_result(single_res_name, tmp, time_algo, para);
                    catch
                        disp('no result!!')
                        tmp = 0;
                        time_algo = 0;
                        save_result(single_res_name, tmp, time_algo, para);
                    end
                    clear tmp time_algo
                end

            end
            fprintf('\n')
        end
    end
    
end

function save_result(name, tmp, time_algo, para)
    file = fullfile('results/', para.saved_name);

    if ~exist(file, 'dir')
        mkdir(file)
    end

    file = [file, '/', name];

    save(file, 'tmp', 'time_algo');
end
