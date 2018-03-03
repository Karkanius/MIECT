# include <stdio.h>
# define nElems(x) (sizeof(x)/sizeof((x)[0]))

int main(void) {
	int array [] = {4,5,3,3,3,3,3,3,3,3};
	int contador = 0;

	for(int i=1; i<nElems(array); i++) {
		if (array[i]==array[i-1]) contador++;
	}
	printf("%d\n", contador);
	return 0;
}
