/*
Paulo Vasconcelos
paulobvasconcelos@gmail.comp
2018 april
*/

# include <stdio.h>

int shroder_recursive(int n) {

  if(n==0) { return 1; }

  int arg1 = shroder_recursive(n-1);
  int arg2 = 0;

  for (int i=0; i<n; i++) {
    arg2+=shroder_recursive(i)*shroder_recursive(n-i-1);
  }

  return arg1+arg2;

}
