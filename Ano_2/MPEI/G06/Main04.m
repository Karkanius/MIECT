%Exercício 4
letras = ['a':'z' 'A':'Z'];
for k=1:15;
  hashes = Inicializar(k);
  Bloom = Inicializar(8E3);
  
  for i=1:k
    hashes(i)=ceil(rand()*1000);
  endfor

  for i = 1:k
      for j = 1:1000
          str = GeraChaves(40, letras);
          Bloom = IncluirMembro(Bloom, hashes, str);
      end

      count = 0;
      for j = 1:10000
          str = GeraChaves(40, letras);
          boolean = PertenceMembro(Bloom, hashes, str);
          if (boolean == 1)
              count = count + 1;
          end
      end
      k(i) = count;
      fprintf('k = %s - Foram consideradas como pertencendo %s Strings\n',num2str(i), num2str(count))
  end

  plot(k)
endfor