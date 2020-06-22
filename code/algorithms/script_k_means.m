function label = script_k_means(Data, varargin)

    fea = Data.fea;
    k = Data.class;
    try
        func = varargin{1}.kmeans.func;
        label = func(fea, k);
    catch
        label = kmeans(fea, k, 'EmptyAction', 'drop');
    end
end
