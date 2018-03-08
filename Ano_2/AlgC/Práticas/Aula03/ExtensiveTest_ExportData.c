/*
Paulo Vasconcelos
paulobvasconcelos@gmail.comp
2018 march
*/

# include <stdio.h>
# include <stdlib.h>
# include <math.h>
# include "Algorithm02.c"
# include "csv.c"
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

  //File Related Arrays
  int x [100];
  int y [100];

  int numberOfArraysToGenerate=100;
  int arraySize;
  int minValue=0;
  int maxValue=1000;
  int numberComparisonsTotal;
  int averageComparisons;

  for(int i=0; i<5; i++) {
    arraySize=pow(2,(4+i));
    numberComparisonsTotal=0;
    for(int j=0; j<numberOfArraysToGenerate; j++) {
      int* array=generateRandomIntArray(arraySize, minValue, maxValue);
      int nComp=numberOfComparisons(array, arraySize);
      numberComparisonsTotal += nComp;
      free(array);
    }
    averageComparisons = round((float)numberComparisonsTotal/(float)numberOfArraysToGenerate);
    if(averageComparisons<0) break;
    x[i]=arraySize;
    y[i]=averageComparisons;
    printf("Array Size: %d\n", arraySize);
    printf("Average Comparisons: %d\n", averageComparisons);
    printf("Ratio: %f\n\n", (float)averageComparisons/(float)arraySize);
  }

  int data[2][100]={x,y};
  int* dataPointer = data;
  create_marks_csv("data", data, 2, 100);

  return 0;
}
