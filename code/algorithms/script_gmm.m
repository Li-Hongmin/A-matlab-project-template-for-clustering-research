function res = script_gmm(data, varargin)
    fea = data.fea';
    k = data.class;
    options = statset('MaxIter',1000);

    gm = fitgmdist(fea, k, 'Options',options, 'SharedCovariance', true);
    res = cluster(gm, fea);
    
   
end