% alfabeto simples 
% completar com outros caracteres 
alpha = ['A':'Z' 'a':'z' ];  

%  ficheiros a serem processados (do projecto Gutemberg
ficheiros={'pg21209.txt','pg26017.txt'};

% obter fun��o massa de probabilidade (pmf em Ingl�s)
pmfPT=pmfLetrasPT(ficheiros,alpha);

%  visualizar fun��o massa de probabilidade
stem(pmfPT)