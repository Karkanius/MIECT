#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main (int argc, char* argv[])
{
  int n = atoi(argv[1]);
  int i, j, r = 0;
  for(i = 1; i <= n; i++)
    for(j = 1; j <= i; j++)
      r++;
  printf("%d\n",r);
  return r;
}
