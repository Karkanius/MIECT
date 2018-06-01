/*
Paulo Vasconcelos
paulobvasconcelos@gmail.comp
2018 april
*/

# include <stdio.h>
# include "Recursive01.c"
# include "Recursive02.c"

int main(void) {

  double x=0.5;

  for (int n=1; n<=16; n++) {
    MATH_POW_v1(x, n);
  }

  for (int n=1; n<=16; n++) {
    MATH_POW_v2(x, n);
  }

  return 0;

}
