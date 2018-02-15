/*
 * 02.c
 *
 *  Created on: 15/02/2018
 *      Author: Paulo Vasconcelos
 */

#include <stdio.h>

int main(int argc, char* argv[])
{
	if((argc==1)||(argc>3)) {
		printf("\nUsage: prog_name first_name\n\n");
		printf("OR: prog_name first_name family_name\n\n");
		return 0;
	}

	if(argc==2) {
		printf("Hello %s!\n", argv[1]);
	}
	else {
		printf("Hello %s %s!\n", argv[1], argv[2]);
	}
	return 0;
}
