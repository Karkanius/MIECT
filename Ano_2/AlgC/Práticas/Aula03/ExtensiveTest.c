/*
Paulo Vasconcelos
paulobvasconcelos@gmail.comp
2018 march
*/

# include <stdio.h>
# include <stdlib.h>
# include <math.h>
# include "Algorithm02.c"
# define nElem(x) (sizeof(x)/sizeof((x)[0]))


int* generateRandomIntArray(arraySize, minValue, maxValue) {

  int* array=(int*)malloc(arraySize*sizeof(int));
  int range=abs(maxValue-minValue);

  for(int i=0; i<arraySize; i++) {
    array[i] = round(((float)rand()/(float)RAND_MAX)*range+minValue);
  }

  return array;
}


int main(void) {

  int numberOfArraysToGenerate=100;
  int arraySize;
  int minValue=0;
  int maxValue=1000;
  int numberComparisonsTotal;
  int averageComparisons;

  for(int i=16; ; i*=2) {
    arraySize=i;
    numberComparisonsTotal=0;
    for(int j=0; j<numberOfArraysToGenerate; j++) {
      int* array=generateRandomIntArray(arraySize, minValue, maxValue);
      int nComp=numberOfComparisons(array, arraySize);
      numberComparisonsTotal += nComp;
      free(array);
    }
    averageComparisons = round((float)numberComparisonsTotal/(float)numberOfArraysToGenerate);
    if(averageComparisons<0) break;
    printf("Array Size: %d\n", arraySize);
    printf("Average Comparisons: %d\n", averageComparisons);
    printf("Ratio: %f\n\n", (float)averageComparisons/(float)arraySize);
  }

  return 0;
}
