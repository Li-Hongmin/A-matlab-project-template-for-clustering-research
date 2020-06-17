function label = script_k_means(Data, varargin)

    fea = Data.fea;
    k = Data.class;
    label = kmeans(fea, k, 'EmptyAction', 'drop');
end
