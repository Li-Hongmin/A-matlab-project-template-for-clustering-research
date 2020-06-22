function T = script_hierarchical_clustering(Data, varargin)
    fea = Data.fea;
    k = Data.class;

    % similarity measures
    Y = pdist(fea);
    % linkage
    Z = linkage(Y);
    
    T = cluster(Z, 'maxclust', k);
    
end