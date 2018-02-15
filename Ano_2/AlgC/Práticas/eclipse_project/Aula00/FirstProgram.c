#include <stdio.h>

int main(void)
{
	char name[50];
	puts("What is your name?"); //Mete um '\n' no fim
	fgets(name, 50, stdin);
	printf("Hello %s\n", name);
	return 0;
}
