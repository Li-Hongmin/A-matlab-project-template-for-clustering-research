function res = readresult(data, algorithm, para, rundata)

full_file_address = ['results/', para.saved_name, '/','*mat'];

res = struct('dataset', {}, 'method', {}, 'raw_result', {}, 'time_algo', []);

files = dir(full_file_address);
for idx_file = 1:numel(files)
    if length(files(idx_file).name) == 11
        i = str2num(files(idx_file).name(4));
        j = str2num(files(idx_file).name(5));
        k = str2num(files(idx_file).name(6:7));
    else
        i = str2num(files(idx_file).name(4));
        j = str2num(files(idx_file).name(5:6));
        k = str2num(files(idx_file).name(7:8));
    end
    try
        a = load([files(idx_file).folder,'/', files(idx_file).name]);
        res(i,j).raw_result{k} = a.tmp;
        res(i,j).time_algo(k) = a.time_algo;
        
        res(i,j).dataset =  data(j).name;
        res(i,j).method = algorithm(i).name;
    end
end

if nargin < 4
    return
    
else
    res = res(:,rundata);
end