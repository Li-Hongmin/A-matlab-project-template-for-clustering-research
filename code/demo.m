%% config
clc;clear;close all;
addpath(genpath('./'));

para = load_config('config00');
n_repeat = para.n_repeat;
%% predata
[data, data_info] = load_data();
disp(data_info)
[algorithm, algo_info] = load_algorithms();
disp(algo_info)
%% run 
res = repeat(data, algorithm, n_repeat, para);
save_result(res, para);
%%

performance = evaluate(data, res);

write_table2latex(performance.ACC,'acc');
write_table2latex(performance.NMI,'nmi');
write_table2latex(performance.Time,'time');
%%



