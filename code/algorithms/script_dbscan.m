function idx = script_dbscan(data, varargin)
    fea = data.fea;
    k = data.class;
    minpts = k;
    
    try
        epsilon = varargin{1}.dbscan.epsilon;
    catch
        warning('No initial setting of epsilon of dbscan. Set 1 as defaut.')
        epsilon = 1;
    end
        
    idx = dbscan(fea, epsilon, minpts);    
end