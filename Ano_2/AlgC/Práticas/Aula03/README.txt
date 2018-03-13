---FICHEIROS DE C�DIGO---

� Algorithm01.c �
	Este ficheiro cont�m o algoritmo correspondente � primeira parte do gui�o.
	N�o h� grande alternativa a este c�digo pelo que s� h� uma vers�o apresentada
		como resolu��o da primeira parte do gui�o.

� Algorithm02.c �
	Vers�o complexa(/complicada) da resolu��o da segunda parte do gui�o.
	Este c�digo tem uma excelente efici�ncia (complexidade o mais baixo poss�vel)
		mas, em contrapartida, � bastante mais complicado de analisar
		formalmente.

� Algorithm02_SimpleVersion.c �
	Forma simples de responder ao problema da segunda parte do gui�o.
	Este c�digo j� n�o � t�o complicado no que toca a fazer an�lise formal pelo que
		foi o c�digo submetido no gui�o.


---FICHEIROS DE TESTE---

� ExtensiveTest.c �
	Este ficheiro cria 100 arrays aleat�rios de tamanho 2^4, 2^5, 2^6,... cujos
		elementos s�o inteiros com valores contidos entre minValue e max Value
		at� que haja uma Segmentation Fault. Com estes arrays, � calculado o
		n�mero m�dio de compara��es e o r�cio (n�mero de compara��es a dividir
		pelo tamanho do array) para cada arraySize.
	Este ficheiro testa exaustivamente a performance do c�digo presente no ficheiro
		"Algorithm02.c".

� TestFile.c �
	C�digo para auxiliar o preenchimento do gui�o pr�tico.
	Usa o c�digo presente nos ficheiros "Algorithm01.c" e
		"Algorithm02_SimpleVersion.c".