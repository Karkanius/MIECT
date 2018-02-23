%% Ex4
clc; clear all;
%Matriz transição
M = [.16 0 0 .36; .36 0 0 .24; .24 0 0 .24; .24 1 1 .16];

prob = M^10;

prob = prob * [1 0 0 0]';
probBseA = prob(2);
probAseA = prob(1);
probCseA = prob(3);
probDseA = prob(4);

fprintf("Prob de A para A: %.3f\nProb de A para B: %.3f\nProb de A para C: %.3f\nProb de A para D: %.3f\n", prob(1), prob(2), prob(3), prob(4));

