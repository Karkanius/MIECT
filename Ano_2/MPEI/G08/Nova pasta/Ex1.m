%% Ex 1

%% Matriz transição

M = [7 8; 3 2] / 10;

probNFseNF = (M^2) * [1 0]';

probNFseF = (M^2) * [0 1]';

%% Alinea A e B

fprintf("Probabilidade de ir a aula na semana seguinte se esta semana nao faltou: %s \n", num2str(probNFseNF(1)));

fprintf("Probabilidade de ir a aula na semana seguinte se faltou esta semana: %s \n", num2str(probNFseF(1)));

%% Alinea C
% Para 15 semanas ou seja, 15 aulas

probNFseNF15 = (M^29) * [1 0]';

fprintf("Probabilidade de nao faltar na 15 aula se nao faltou na primeira aula : %s\n", num2str(probNFseNF15(1)));


%% Alinea D

prob30aulas = zeros(1, 30);

for i=1:length(prob30aulas)
  matrizProbabilidade = (M^i) * [0.85 0.15]';
  prob = matrizProbabilidade(2);
  prob30aulas(i) = prob;
  
end


plot(prob30aulas);
  
  

