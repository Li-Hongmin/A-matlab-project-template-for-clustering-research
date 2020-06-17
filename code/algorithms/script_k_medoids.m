function label = script_k_medoids(Data, varargin)

    fea = Data.fea;
    k = Data.class;
    label = kmedoids(fea, k);
end
