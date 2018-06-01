/*
Paulo Vasconcelos
paulobvasconcelos@gmail.comp
2018 april
*/

# include <stdio.h>

int shroder_dinamic(int n, int *array) {

  array[0] = 1;

  for(int i=1; i<=n; i++) {
    array[i] = array[i-1];
    for(int j=0; j<i; j++) {
      array[i]+=array[j]*array[i-j-1];
    }
  }
  return array[n];

}
