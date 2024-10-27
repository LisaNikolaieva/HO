clear;
close all;
clc


file = 'DATA/tuning/medium/inst_200_20_00001';
[E,C]=load_data(file);

% E = readmatrix('E.txt');
% C = readmatrix('C.txt');





% N = 25;
N = max(E(:,1))
% x = N + randperm(N);
x = N+1:2*N
x = x';

% x = [6 7 10 9 8]


f = @(x) calc_f(E,x);
G = @(x) calc_G(C,x);

x = G(x);
f(x)


%%
[X,F] = simulated_annealing(x,f,G);

F_best = F(end);
x_best = X(:,end);

x_best'
f(x_best)

figure;
% ax = gca; ax.FontSize=10; ax.LabelFontSizeMultiplier = 1.5; ax.TickLabelInterpreter='latex'; ax.Box = 'on';hold on;
plot(F);


