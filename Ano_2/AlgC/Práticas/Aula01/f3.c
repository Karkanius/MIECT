#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main (int argc, char* argv[])
{
  int n = atoi(argv[1]);
  int i, j;
  long r = 0;
  for(i = 1; i <= n; i++)
    for(j = i; j <= n; j++)
      r += j;
  printf("%ld\n",r);
  return r;
}
