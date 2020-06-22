
function [data, data_info] = load_data()
    data = struct('name', {}, 'source', {}, 'fea', {}, 'gnd', {});
    % fea : feature of data
    % gnd : ground true of data
   
    load iris_dataset.mat
    
    data(1).fea = irisInputs';
    data(1).gnd = [1,2,3] * irisTargets;
    data(1).name = 'iris';
    % data(1).source = 'UCI';

    load wine_dataset.mat
    data(2).fea = wineInputs';
    data(2).gnd = [1,2,3] * wineTargets;
    data(2).name = 'wine';
    % data(2).source = 'UCI';

    %%
    n = numel(data);
    [Datasets, Source] = deal(cell(n,1));
    [Instance, Class, Feature] = deal(zeros(n, 1));

    for i = 1:n
        Datasets{i} = data(i).name;
        Instance(i) = numel(data(i).gnd);
        Feature(i) = size(data(i).fea, 1);
        Class(i) = numel(unique(data(i).gnd));
        data(i).class = Class(i);
        Source{i} = data(i).source;
    end

    data_info = table(Instance, Feature, Class,'RowNames',Datasets);
    
end
