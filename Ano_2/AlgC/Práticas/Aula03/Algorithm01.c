/*
Paulo Vasconcelos
paulobvasconcelos@gmail.comp
2018 march
*/

# include <stdio.h>
# define nElem(x) (sizeof(x)/sizeof((x)[0]))

int numberOfEquals(int* array, int arraySize) {

	int contador = 0;

	for(int i=1; i<arraySize; i++) {
		if (array[i]==array[i-1]) contador++;
	}
	printf("Resultado: %d\n", contador);
	printf("Nº de operações: %d\n\n", arraySize-1);
	return contador;
}
