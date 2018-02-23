function wordArray = LerLivro (src)


book = fopen(src);

wordArray = Inicializar(1,1);

while 1
    linha = fgetl(book);
    if ~ischar(linha), break, end
    words = strsplit(linha);
    for i = 1:length(words)
        str = erase(words{i}, ',');
        str = erase(str, ';');
        str = erase(str, '.');
        str = erase(str, ':');
        str = erase(str, '_');
        str = erase(str, '“');
        str = erase(str, '”');
        str = erase(str, '’ ');
        str = erase(str, ' ‘');
        str = erase(str, '--');
        str = erase(str, '!');
        str = erase(str, '?');
        x(end+1) = str; 
    end
end
endfunction
