function label = script_spectral_clustering(data, varargin)
    fea = data.fea;
    k = data.class;
    knn = 7;

    % sparse similarity with knn
    dist = squareform(pdist(fea));
    sigma = mean(dist(:));
    [nSmp, p] = size(dist);
    for i = 1:knn
        [dump(:, i), idx(:, i)] = min(dist, [], 2);
        temp = (idx(:, i) - 1) * nSmp + [1:nSmp]';
        dist(temp) = 1e100;
    end

    dump = exp(-dump / (2 * sigma^2));
    sumD = sum(dump, 2);
    Gsdx = bsxfun(@rdivide, dump, sumD);
    Gidx = repmat([1:nSmp]', 1, knn);
    Gjdx = idx;
    Z = sparse(Gidx(:), Gjdx(:), Gsdx(:), nSmp, p);

    label = SC(Z, k, 10);
end