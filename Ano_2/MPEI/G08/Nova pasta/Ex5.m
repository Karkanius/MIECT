%% Ex5
clc; clear all;

M = [7 2 3
     2 3 3
     1 5 4]/10;
     
x0 = [1 0 0];

M2 = M^2 * x0';

fprintf('prob dia 2 de chuva se dia 0 for de sol: %s\n', num2str(M2(3)));

%% 20 Primeiras potencias

%% Alinea C
Matriz = ones(9, 20);

for i=1:20
  Mn = M ^ i;
  Matriz(:, i) = Mn(:);  
end

subplot(2,1,1);
plot(Matriz');
title("Matriz 1");

%% Alinea D

Tn = eye(3);
Tn1 = M;
values = [];
x = max(abs(Tn1(:) - Tn(:)));
while(1)
  if(x < 1e-4)
    break;
  end
  
  values = [values Tn1(:)];

  Tn = Tn1;
  Tn1 = Tn1*M;
  x = max(abs(Tn1(:) - Tn(:)));
end

subplot(2,1,2);
plot(values');
title("Matriz 2");
