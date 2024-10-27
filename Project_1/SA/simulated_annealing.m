function [X, F] = simulated_annealing(x,f,G)


%%
T = 100;
% x = randperm(N);
alpha = 0.95;
epsilon = 1e-10;
num_run = 1000;

X = [];
F = [];




%%
for i = 1:num_run

T = alpha*T;
x_tild = G(x);

Delta = f(x_tild)-f(x);

p = exp(-Delta/T);
if (rand<p)||(f(x_tild)<f(x))
    x = x_tild;
end


X = [X,x];
F = [F;f(x)];
if T<epsilon
    break;
end




figure(1);
hold on
plot(F,'.-k')


end





end