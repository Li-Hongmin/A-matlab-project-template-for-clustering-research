%% config
clc;clear;close all;
addpath(genpath('./'));

para = load_config('config_00');
n_repeat = para.n_repeat;
%% predata
[data, data_info] = load_data();
disp(data_info)
write_table2latex(data_info,[para.saved_name,'data']);
[algorithm, algo_info] = load_algorithms();
disp(algo_info)
%% run 
res = repeat(data, algorithm, n_repeat, para);
save_result(res, para);

%%
res = read_result(para);
performance = evaluate(data, res, para);

ACC = performance.ACC
NMI = performance.NMI
Time = performance.Time



