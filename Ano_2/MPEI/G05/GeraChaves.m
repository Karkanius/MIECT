function [chave] = GeraChaves (nMin, nMax, src)
  
  keySize = nMin + randi(nMax-nMin);
  chave = zeros(1,keySize);
  for i=1:keySize
    chave(i) = randi(size(src));
  end

endfunction
