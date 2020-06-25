function res = read_result(para,n)
    % for duplicated file, we select n-th
    list = dir(['results/', para.saved_name, '*.mat']);
    if ~exist('n','var')
        file = list(end);
    else
        file = list(n);
    end
    
    load(['results/',file.name])
    
end