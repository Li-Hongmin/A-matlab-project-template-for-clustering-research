function para = config_00()
    % experiment
    para.n_repeat = 20;
    para.saved_name = 'c00';
    
    % dbscan
    para.dbscan.epsilon = 1;
    % gmm
    options = statset('MaxIter',1000);
    para.gmm.func = @(fea, k) fitgmdist(fea, k, 'Options', options, 'SharedCovariance', true);
    % kmeans
    para.kmeans.func = @(fea, k) kmeans(fea, k, 'EmptyAction', 'drop');
    % kmedoids
    % no
    % spectral clustering
    para.sc.knn = 5;
    
end