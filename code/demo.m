%% config
clc;clear;close all;
addpath(genpath('./'));
n_repeat = 10;
para = [];

%% predata
[data, data_info] = load_data();
disp(data_info)
[algorithm, algo_info] = load_algorithms();
disp(algo_info)
%% run 
res = repeat(data, algorithm, n_repeat, para);
