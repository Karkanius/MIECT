/*
Paulo Vasconcelos
paulobvasconcelos@gmail.comp
2018 april
*/

# include <stdio.h>
# include "RecursiveMethod.h"
# define nElem(x) (sizeof(x)/sizeof((x)[0]))

int main(void) {

  int testValues[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}; // 15 = OF

  for(int i=0; i<nElem(testValues); i++) {
    printf("Shröder(%02d) = %d\n", testValues[i], shroder_recursive(testValues[i]));
  }

  return 0;
}
