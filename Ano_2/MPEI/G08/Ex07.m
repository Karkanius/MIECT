#
# Al�nea a)
#

MatrizT = [ 0.8, 0.1, 0.05;
            0.2, 0.6, 0.2;
            0.0, 0.3, 0.75];

      
#
# Al�nea b)
#

MatrizT^3*[100;200;30]


#
# Al�nea c)
#

MatrizT^365*[100;200;30]


#
# Al�nea d)
#

x = [100;200;30];
dia = 0;

while(x(3) < 130)
  x = MatrizT * x;
  dia = dia + 1;
end
%Resposta - Dia 9
dia
x 