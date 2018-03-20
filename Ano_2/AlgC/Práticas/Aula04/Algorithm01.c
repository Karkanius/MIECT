/*
Paulo Vasconcelos
paulobvasconcelos@gmail.comp
2018 march
*/

# include <stdio.h>
# define nElem(x) (sizeof(x)/sizeof((x)[0]))

int isSequenceContinuous(int* array, int arraySize) {

  for(int i=0; i<arraySize-1; i++) {
    if ((array[i]+1)!=(array[i+1])) {
      printf("Nº de operações: %d\n", i+1);
      printf("Resultado: %d\n\n", 0);
      return 0;
    }
  }
  printf("Nº de operações: %d\n", arraySize-1);
  printf("Resultado: %d\n\n", 1);
  return 1;

}
