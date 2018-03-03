# include <stdio.h>
# define nElem(x) (sizeof(x)/sizeof((x)[0]))

int main(void) {
  int array [] = {1,4,5,4,3,7,6,10,10,1};
//  int array [] = {9,8,7,6,5,4,3,2,1,0};
  int nComp = 0;
  int nMenores = 0;
  int index = nElem(array)-1;

  for (int i=nElem(array)-1; i>=nMenores; i--) {
    nComp++;
    if ((array[i]>array[index]) || (array[i]==array[index] && i==index-1)) {
      nComp++;
      if (array[i]==array[index] && i==index-1) index = i;
      else {
        int nMenoresTemp = 0;
        for (int j = i-1; j >= 0 && j + 1 + nMenoresTemp >= nMenores; j--) {
          nComp++;
	  if (array[j]<array[i]) nMenoresTemp++;
        }
        nComp++;
        if (nMenoresTemp>=nMenores) {
	  index = i;
	  nMenores = nMenoresTemp;
        }
      }
    }
  }
  printf("Valor: %d\n", array[index]);
  if(nMenores==0) index=-1;
  printf("Índice: %d\n", index);
  printf("Número de menores: %d\n", nMenores);
  printf("Número de comparações: %d\n", nComp);
  if(nMenores==0) return -1;
  return index;
}
