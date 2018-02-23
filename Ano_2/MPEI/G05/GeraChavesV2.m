function [chave] = GeraChavesV2 (nMin, nMax, src, fmprob)

  keySize = nMin + randi(nMax-nMin);
  chave = zeros(1,keySize);
  acum = 0;
  acumulada = zeros(1,size(src));
  
  for i=1:size(src)
    acumulada(i) = acum + fmprob(i);
    acum = acum + acumulada(i);
  end
  for i=1:keySize
    aux = rand();
    for j=1:size(src)
      if acumulada(j)>aux
        chave(i)=src(j);
        break
      endif
    end
  end
  
endfunction
