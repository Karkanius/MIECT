/*
Paulo Vasconcelos
paulobvasconcelos@gmail.comp
2018 march
*/

# include <stdio.h>
# include <stdlib.h>
# include "Algorithm01.c"
# include "Algorithm02_SimpleVersion.c"
# define nElem(x) (sizeof(x)/sizeof((x)[0]))


int main(void) {

  //------------------------------
  // Parte 1
  //------------------------------

  printf("\n---- Parte 1 ----\n");

  int array_part1 [][10] = {
  {3,3,3,3,3,3,3,3,3,3},
  {4,3,3,3,3,3,3,3,3,3},
  {4,5,3,3,3,3,3,3,3,3},
  {4,5,1,3,3,3,3,3,3,3},
  {4,5,1,2,3,3,3,3,3,3},
  {4,5,1,2,6,3,3,3,3,3},
  {4,5,1,2,6,8,3,3,3,3},
  {4,5,1,2,6,8,7,3,3,3},
  {4,5,1,2,6,8,7,9,3,3},
  {4,5,1,2,6,8,7,9,3,0} };

  for(int i=0; i<10; i++) {
    numberOfEquals(array_part1[i], 10);
  }

  //------------------------------
  // Parte 2
  //------------------------------

  printf("\n---- Parte 2 ----\n");

  int array_part2 [][10] = {
  {1,9,2,8,3,4,5,3,7,2},
  {1,7,4,6,5,2,3,2,1,0},
  {2,2,2,2,2,2,2,2,2,2} };

  for(int i=0; i<3; i++) {
    numberOfComparisons(array_part2[i], 10);
  }

  return 0;
}
