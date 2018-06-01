/*
 * Paulo Vasconcelos
 * paulobvasconcelos@gmail.com
 * 2018 may
 */

# include <stdio.h>
# include "stack.h"

int main (int argc, char* argv[])
{
  printf("%s\n%s", "Write a string:", "> ");
  char word[256];
  fgets(word, sizeof(word), stdin);
  printf("\n");
  int i=0;
  int wordSize=0;
  int error=0;
  PtStack stk = StackCreate(sizeof(char));
  while(word[i]!='\0') {
    wordSize++;
    error=StackPush(stk, &word[i]);
    if (error!=0) { return 1; }
    i++;
  }
  printf("%s\n%s", "Inverted string:", "> ");
  char temp;
  for(i=0; i<wordSize; i++) {
    error=StackPop(stk, &temp);
    if (error!=0) { return 2; }
    if(temp!='\n') { printf("%c", temp); }
  }
  printf("\n\n");
  return 0;
}
