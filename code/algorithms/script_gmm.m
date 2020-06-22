function res = script_gmm(data, varargin)
    fea = data.fea;
    k = data.class;

    try
        func = varargin{1}.gmm.func;
        gm = func(fea, k);
    catch
        options = statset('MaxIter', 1000);
        gm = fitgmdist(fea, k, 'Options', options, 'SharedCovariance', true);
    end

    res = cluster(gm, fea);

end
