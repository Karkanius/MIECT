/*
Paulo Vasconcelos
paulobvasconcelos@gmail.comp
2018 april
*/

# include <stdio.h>

int MATH_POW_v2(double x, int n) {

  // Algorithm stats calculus auxiliary variable
  int nMult=0;

  printf("%s %d\n", "N:", n);

  if (n<0) {
    printf("ERROR: Function only able to deal with non-negative exponent.\n");
    return -1;
  }
  if (n!=0) {
    nMult++;
    if (n%2==0) {
      return MATH_POW_v2_wSTATS(x, n/2, nMult)*MATH_POW_v2_wSTATS(x, n/2, nMult);
    }
    nMult++;
    return x*MATH_POW_v2_wSTATS(x, n/2, nMult)*MATH_POW_v2_wSTATS(x, n/2, nMult);
  }
  printf("%s %d\n\n", "Nº de Multiplicações:", nMult);
  return 0;
}


int MATH_POW_v2_wSTATS(double x, int n, int nMult) {

  if (n<0) {
    printf("ERROR: Function only able to deal with non-negative exponent.\n");
    return -1;
  }
  if (n!=0) {
    nMult++;
    if (n%2==0) {
      return MATH_POW_v2_wSTATS(x, n/2, nMult)*MATH_POW_v2_wSTATS(x, n/2, nMult);
    }
    nMult++;
    return x*MATH_POW_v2_wSTATS(x, n/2, nMult)*MATH_POW_v2_wSTATS(x, n/2, nMult);
  }
  printf("%s %d\n\n", "Nº de Multiplicações:", nMult);
  return 0;
}
