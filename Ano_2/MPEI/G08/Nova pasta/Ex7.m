%% Ex7

M = [.8 .1 .05
     .2 .6 .2
     0 .3 .75];
     
% Aliea A

M3 = M ^ 3;

x0 = [100 200 30];
R1 = M3 * x0'
%Resposta
%Ana - 97.66
%Bernardo - 115.76
%Catarina - 116.57

M365 = M ^ 365;
R2 = M365 * x0'
%Resposta
%Ana - 88
%Bernardo - 110
%Catarina - 132

x = x0';
dia = 0;

while(x(3) < 130)
  x = M * x;
  dia = dia + 1;
end
%Resposta - Dia 9
dia
x  