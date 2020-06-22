function save_result(res, para)
    file = fullfile('results/', para.saved_name);
    existed = dir([file,'*']);
    n = numel(existed);
    save([file,'_',num2str(n)], 'res');
end