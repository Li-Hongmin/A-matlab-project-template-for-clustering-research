function [score,res] = metric_acc(gnd, res)
    res = bestMap(gnd, res);
    score = sum(gnd == res) / length(gnd);
end
