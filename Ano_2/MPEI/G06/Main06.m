%Exercício 6
contador = 0;

wordArray = LerLivro('book1.txt');

for i=1:length(wordArray)
  if ~(PertenceMembro(Bloom, hashes, wordArray(i) == 1)
    IncluirMembro(Bloom, hashes, wordArray(i));
    contador = contador + 1;
    endif
endfor

fprintf('Existem %d palavras diferentes.\n',contador)