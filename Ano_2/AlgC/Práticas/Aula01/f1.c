#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main (int argc, char* argv[])
{
  int n = atoi(argv[1]);
  int i, j, r = 0, nAdd = 0;
  for(i = 1; i <= n; i++) {
    for(j = 1; j <= n; j++) {
      r++;
      nAdd++;
    }
  }
  printf("Result = %d\n",r);
  printf("Sums = %d\n",nAdd);
  return r;
}
