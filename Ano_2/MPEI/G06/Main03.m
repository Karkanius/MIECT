%Exercício 3
letras = ['a':'z' 'A':'Z'];
Bloom = Inicializar(8E3);
numHash = 3;
hashes = Inicializar(numHash);
for i=1:numHash
  hashes(i)=ceil(rand()*1000);
endfor
  

%Exercício 3 a)
for i=1:1E3
  strAleat = GeraChaves(40, letras);
  Bloom = IncluirMembro(Bloom, hashes, strAleat);
endfor



%Exercício 3 b)
OK = Inicializar(1E4);
for i=1:1E4
  strAleat = GeraChaves(40, letras);
  OK(i) = PertenceMembro(Bloom, hashes, strAleat);
endfor

Matches = sum(OK)