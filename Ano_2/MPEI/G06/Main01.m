Membros = {'Espanha', 'Portugal', 'Italia'};
Teste = {'Italia', 'Polonia', 'Franca'};
m = 100;
k = 3;
B = Inicializar(m);

for i=1:length(Membros)
	B = IncluirMembro(B,k,Membros{i});
endfor
for i=1:length(Membros)
	OK = PertenceMembro(B,k,Teste{i});
	if OK==1
		fprintf('%s pertence\n', Teste{i})

	else
		fprintf('%s nao pertence\n', Teste{i})
	endif
endfor

