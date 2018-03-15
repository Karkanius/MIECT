/*
Paulo Vasconcelos
paulobvasconcelos@gmail.comp
2018 march
*/

# include <stdio.h>
# define nElem(x) (sizeof(x)/sizeof((x)[0]))

//--------------------------------
//------------ ARRAYS ------------
//--------------------------------

void arraycopy(int* src, int srcPos, int* dest, int destPos, int length) {
  for(int i=0; i<length; i++) { dest[destPos+i]=src[srcPos+i]; }
}

void printArrayInt(int* array, int arraySize) {
  printf("array: {%d", array[0]);
  for(int i=1; i<arraySize; i++) { printf(", %d", array[i]); }
  printf("}\n");
}

void printArrayDouble(double* array, int arraySize) {
  printf("array: {%f", array[0]);
  for(int i=1; i<arraySize; i++) { printf(", %f", array[i]); }
  printf("}\n");
}



//--------------------------------
//------------ CHARS -------------
//--------------------------------

char toLowerCase(char c) { if('A'<=c && 'Z'>=c) { c+=32; } return c; }

char toUpperCase(char c) { if('a'<=c && 'z'>=c) { c-=32; } return c; }
