/*
Paulo Vasconcelos
paulobvasconcelos@gmail.comp
2018 april
*/

# include <stdio.h>

int MATH_POW_v1(double x, int n) {

  // Algorithm stats calculus auxiliary variable
  int nMult=0;

  printf("%s %d\n", "N:", n);

  if (n<1) {
    printf("ERROR: Function only able to deal with natural exponent.\n");
    return -1;
  }
  if (n!=1) {
    nMult++;
    return x*MATH_POW_v1_wSTATS(x, n-1, nMult);
  }
  printf("%s %d\n\n", "Nº de Multiplicações:", nMult);
  return x;
}


int MATH_POW_v1_wSTATS(double x, int n, int nMult) {

  if (n<1) {
    printf("ERROR: Function only able to deal with natural exponent.\n");
    return -1;
  }
  if (n!=1) {
    nMult++;
    return x*MATH_POW_v1_wSTATS(x, n-1, nMult);
  }
  printf("%s %d\n\n", "Nº de Multiplicações:", nMult);
  return x;
}
