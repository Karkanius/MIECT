p = 0.7;      # Probabilidade de ir à próxima aula tendo ido à anterior
q = 0.8;      # Probabilidade de ir à próxima aula não tendo ido à anterior

MatrizT = [ [p, q]; [1-p, 1-q] ]

nAula = 2;


#
# Alínea a)
#

prob = MatrizT**nAula*[1;0]


#
# Alínea b)
#


#
# Alínea c)
#

prob = (MatrizT^30)(1,2)


#
# Alínea d)
#

prob1 = [0.85; 0.15];

res = zeros(1,30);
res(1) = 0.15;

for i=2:30
  aux = (MatrizT^(i-1))*prob1;
  res(i) = aux(2);
endfor

plot(res)