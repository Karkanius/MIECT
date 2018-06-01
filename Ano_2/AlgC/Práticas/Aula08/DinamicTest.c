/*
Paulo Vasconcelos
paulobvasconcelos@gmail.comp
2018 april
*/

# include <stdio.h>
# include "DinamicMethod.h"
# define nElem(x) (sizeof(x)/sizeof((x)[0]))

int main(void) {

  int testValues[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14};
  int *p;

  for(int i=0; i<nElem(testValues); i++) {
    int array[testValues[i]];
    p = array;
    printf("Shröder(%02d) = %d\n", testValues[i], shroder_dinamic(testValues[i], p));
  }

  return 0;
}
