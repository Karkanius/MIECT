---FICHEIROS DE CÓDIGO---

» Algorithm01.c «
	Este ficheiro contém o algoritmo correspondente à primeira parte do guião.
	Não há grande alternativa a este código pelo que só há uma versão apresentada
		como resolução da primeira parte do guião.

» Algorithm02.c «
	Versão complexa(/complicada) da resolução da segunda parte do guião.
	Este código tem uma excelente eficiência (complexidade o mais baixo possível)
		mas, em contrapartida, é bastante mais complicado de analisar
		formalmente.

» Algorithm02_SimpleVersion.c «
	Forma simples de responder ao problema da segunda parte do guião.
	Este código já não é tão complicado no que toca a fazer análise formal pelo que
		foi o código submetido no guião.


---FICHEIROS DE TESTE---

» ExtensiveTest.c «
	Este ficheiro cria 100 arrays aleatórios de tamanho 2^4, 2^5, 2^6,... cujos
		elementos são inteiros com valores contidos entre minValue e max Value
		até que haja uma Segmentation Fault. Com estes arrays, é calculado o
		número médio de comparações e o rácio (número de comparações a dividir
		pelo tamanho do array) para cada arraySize.
	Este ficheiro testa exaustivamente a performance do código presente no ficheiro
		"Algorithm02.c".

» TestFile.c «
	Código para auxiliar o preenchimento do guião prático.
	Usa o código presente nos ficheiros "Algorithm01.c" e
		"Algorithm02_SimpleVersion.c".