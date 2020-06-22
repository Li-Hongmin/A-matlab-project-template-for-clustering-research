function label = script_k_meadois(Data, varargin)

    fea = Data.fea;
    k = Data.class;
    label = kmedoids(fea, k);
end
