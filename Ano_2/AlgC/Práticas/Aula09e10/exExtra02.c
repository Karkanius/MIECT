/*
 * Paulo Vasconcelos
 * paulobvasconcelos@gmail.com
 * 2018 may
 */

# include <stdio.h>
# include "stack.h"
# include "queue.h"

int main (int argc, char* argv[])
{
  printf("%s\n%s", "Write a number:", "> ");
  char word[256];
  fgets(word, sizeof(word), stdin);
  printf("\n");
  int i=0;
  int wordSize=0;
  int error=0;
  PtStack stk = StackCreate(sizeof(char));
  PtQueue queue = QueueCreate(sizeof(char));
  while(word[i]!='\0') {
    wordSize++;
    error=StackPush(stk, &word[i]);
    if (error!=0) { return 1; }
    error=QueueEnqueue(queue, &word[i]);
    if (error!=0) { return 2; }
    i++;
  }
  char a, b;
  for(i=0; i<wordSize; i++) {
    error=StackPop(stk, &a);
    if (error!=0) { return 3; }
    error=QueueDequeue(queue, &b);
    if (error!=0) { return 4; }
    if(a!=b) { printf("%c%c%s\n", a, b, "O número não é uma capicua."); }
    printf("\n\n");
    return 0;
  }
  printf("%s\n", "O número é uma capicua.");
  printf("\n\n");
  return 0;
}
