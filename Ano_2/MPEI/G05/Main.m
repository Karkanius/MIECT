%-----------------------------------------------
%--------P-R-I-M-E-I-R-A-----V-E-R-S-A-O--------
%-----------------------------------------------

n = 1000;
m = round(n/0.8);
letras = ['a':'z' 'A':'Z'];
contador = zeros(1,m);

for i=1:n
  chaves = GeraChaves(3,20,letras);
  valor = mod(FuncaoDispersao(chaves),m);
  contador(valor) = contador(valor) + 1;
  if rem(i,25)==0
    subplot(121)
    bar(contador)
    drawnow
    subplot(122)
    hist(contador)
    drawnow
  end
end




%-----------------------------------------------
%---------S-E-G-U-N-D-A-----V-E-R-S-A-O---------
%-----------------------------------------------

%n = 1000;
%m = round(n/0.8);
%letras = ['a':'z' 'A':'Z'];
%contador = zeros(1,m);
%ficheiros={'pg21209.txt','pg26017.txt'};
%pmfPT=pmfLetrasPT(ficheiros,letras);
%
%
%for i=1:n
%  chaves = GeraChavesV2(3,20,letras,pmfPT)
%  valor = mod(FuncaoDispersao(chaves),m);
%  contador(valor) = contador(valor) + 1;
%  if rem(i,25)==0
%    subplot(121)
%    bar(contador)
%    drawnow
%    subplot(122)
%    hist(contador)
%    drawnow
%  end
%end