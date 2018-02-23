%% Ex 2

%% Alinea a
% Matriz transição:
clc;
M = [1/3 1/4 0; 1/3 11/20 1/2; 1/3 1/5 1/2];

%checking

fprintf("Maximo (nao pode ser maior que 1): %s\n", num2str(max(M)));
fprintf("Minimo (nao pode ser menos que 0): %s\n", num2str(min(M)));
fprintf("Soma das colunas (tem de dar 1 em todas): %s\n", num2str(sum(M)));

%% Alinea B
%nr total de alunos: 90 alunos
%nr Alunos de A: 2*(B + C) alunos
%nr Alunos de B: C = B
%nr Alunos de C: C = b

% Eq. para calcular A, B e C
% A + B + C = 90    %A = -B - C + 90              %--
% 2 * (B + C) = A   %2 * (B + C) = - B - C + 90   %4B = -2B + 90
%---------------------------------------------------------------
% --        %--                 %A = 2*(15 + 15) = 60
% 6B = 90   %B = 90/6 = 15 = C  %B = C = 15
%---------------------------------------------------------------

V = [60/90 15/90 15/90];

%% Alinea C

fprintf("Probabilidades de cada estado ao fim de 30 aulas: \n");
prob30 = (M^30) * V'

%% Alinea B

%Novo V com aluno distribuidos equivalentemente
V = [30/90 30/90 30/90];
fprintf("Probabilidades de cada estado ao fim de 30 aulas:(para alunos distribuidos equivalentemente \n");
prob30 = (M^30) * V'