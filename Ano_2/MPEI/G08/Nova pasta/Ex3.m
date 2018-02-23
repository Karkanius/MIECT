%% Ex3
clc;
M = rand(20, 20, 1);

M = M./sum(M);

prob = (M^20);

fprintf("Probabilidade de ir do primeiro ao ultimo(20 ite): %.4f\n", prob(1, 20));

prob = (M^40);

fprintf("Probabilidade de ir do primeiro ao ultimo(40 ite): %.4f\n", prob(1, 20));


prob = (M^100);

fprintf("Probabilidade de ir do primeiro ao ultimo(100 ite): %.4f\n", prob(1, 20));



