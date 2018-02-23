function [chave] = GeraChaves (keySize, src)
  
  chave = zeros(1,keySize);
  for i=1:keySize
    chave(i) = src(randi(size(src)));
  end

endfunction
