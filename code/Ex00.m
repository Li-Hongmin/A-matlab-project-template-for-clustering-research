%% config
clc;
clear;close all;
addpath(genpath('./'));

%% predata
[data, data_info] = load_data();
disp(data_info)

[algorithm, algo_info] = load_algorithms();
disp(algo_info)
%% run 
% rng(100,'twister')

%%
n_repeat = 20;
para = load_config('config_00');
para.saved_name = 'c00';
run(data, algorithm, n_repeat, para);

res = readresult(data, algorithm, para);
performance = evaluate(data, res, para);

ACC = performance.ACC
NMI = performance.NMI
Time = performance.Time

% save('Ex00');