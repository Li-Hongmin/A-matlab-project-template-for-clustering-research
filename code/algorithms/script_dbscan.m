function idx = script_dbscan(data, varargin)
    fea = data.fea;
    k = data.class;
    minpts = 5;
    epsilon = 1;
    idx = dbscan(fea, epsilon, minpts);    
end