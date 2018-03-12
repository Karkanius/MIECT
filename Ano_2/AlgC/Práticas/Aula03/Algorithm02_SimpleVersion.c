/*
Paulo Vasconcelos
paulobvasconcelos@gmail.comp
2018 march
*/

# include <stdio.h>
# define nElem(x) (sizeof(x)/sizeof((x)[0]))

int numberOfComparisons(int* array, int arraySize) {
//  int array [] = {1,4,5,4,3,7,6,10,10,1};
//  int array [] = {9,8,7,6,5,4,3,2,1,0};
//  int array [] = {1,10,8,1,9,1,1,1,1,7};
  int nComp = 0;
  int nMenores = 0;
  int index = 0;

  for(int i=1; i<arraySize; i++) {
    int nMenoresTemp = 0;
    for(int j=0; j<i; j++) {
      nComp++;
      if(array[j]<array[i]) { nMenoresTemp++; }
    }
    if(nMenoresTemp>nMenores) { index=i; nMenores=nMenoresTemp; }
  }

//  printf("Valor: %d\n", array[index]);
  if(nMenores==0) index=-1;
  printf("Índice: %d\n", index);
  printf("Nº de menores: %d\n", nMenores);
  printf("Nº de comparações: %d\n\n", nComp);
  if(nMenores==0) return -1;
  return nComp;
}
