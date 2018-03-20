/*
Paulo Vasconcelos
paulobvasconcelos@gmail.comp
2018 march
*/

# include <stdio.h>
# include <stdlib.h>
# include "Algorithm01.c"
# include "Algorithm02.c"
# define nElem(x) (sizeof(x)/sizeof((x)[0]))


int main(void) {

  //------------------------------
  // Parte 1
  //------------------------------

  printf("\n---- Parte 1 ----\n");

  int array_part1 [][10] = {
  {1,3,4,5,5,6,7,7,8,9},
  {1,2,4,5,5,6,7,8,8,9},
  {1,2,3,6,8,8,8,9,9,9},
  {1,2,3,4,6,7,7,8,8,9},
  {1,2,3,4,5,7,7,8,8,9},
  {1,2,3,4,5,6,8,8,9,9},
  {1,2,3,4,5,6,7,9,9,9},
  {1,2,3,4,5,6,7,8,8,9},
  {1,2,3,4,5,6,7,8,9,9},
  {1,2,3,4,5,6,7,8,9,10} };

  for(int i=0; i<10; i++) {
    isSequenceContinuous(array_part1[i], 10);
  }

  //------------------------------
  // Parte 2
  //------------------------------

  printf("\n---- Parte 2 ----\n");

  int array_part2 [][10] = {
  {1,2,2,2,3,3,4,5,8,8},
  {1,2,2,2,3,3,3,3,8,8},
  {1,2,5,4,7,0,3,9,6,8},
  {1,1,1,1,1,1,1,1,1,1} };

  for(int i=0; i<4; i++) {
    removeRepeated(array_part2[i], 10);
  }

  return 0;
}
