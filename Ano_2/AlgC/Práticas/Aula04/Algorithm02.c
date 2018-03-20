/*
Paulo Vasconcelos
paulobvasconcelos@gmail.comp
2018 march
*/

# include <stdio.h>
# include "../karkaniusUtils.h"


void removeRepeated(int* array, int arraySize) {

  int nComp=0;
  int nCop=0;

  for(int i=0; i<arraySize-1; i++) {
    for(int j=i+1; j<arraySize; j++) {
      nComp++;
      if(array[i]==array[j]) {
        nCop++;
        arraycopy(array, j+1, array, j, arraySize-(j+1));
        arraySize--;
        j--;
      }
    }
  }

  printArrayInt(array, arraySize);
  printf("Nº de comparações: %d\n", nComp);
  printf("Nº de cópias: %d\n\n", nCop);

}
