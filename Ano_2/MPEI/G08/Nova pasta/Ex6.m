%% Ex6
clc; clear all;
T = [.8 0 .3 0
     .2 .9 .2 0
     0 .1 .4 0
     0 0 .1 1];
     
x0 = [1 0 0 0];

T1000 = T ^ 1000 * x0';

fprintf('Prob de começando na 1 ir para a 2(1000 passos): %.6f\n', T1000(2));
fprintf('Prob de começando na 1 ir para a 4(1000 passos): %.6f\n', T1000(4));


%% Alinea C
T2 = T ^ 2;
waitfor(0.5);
T10 = T ^ 10;
waitfor(0.5);
T100 = T ^ 100;


%% Alinea D

Q = T(1:3, 1:3);

%% Alinea E
% F = numero medio de vezes que passa em cada estado
F = inv(eye(3) - Q);

%% Alinea F
ValorEsperado = sum(F)

%% Alinea G
tempo = ValorEsperado

%% Alinea H
% Novo H

H = [.8 0 .9 0
     .2 .9 0 0
     0 .1 0 0
     0 0 .1 1];
     
Q = H(1:3, 1:3);
F = inv(eye(3) - Q);
NovoValorEsperado = sum(F)



