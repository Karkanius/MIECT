// Programa 4 – teste dos system calls de leitura e impressão de inteiros
//
void main(void)
{
 int value;
 while (1)
 {
 printStr("\nIntroduza um numero (sinal e módulo): ");
 value = readInt10();
 printStr("\nValor lido em base 2: ");
 printInt(value, 2);
 printStr("\nValor lido em base 16: ");
 printInt(value, 16);
 printStr("\nValor lido em base 10 (unsigned): ");
 printInt(value, 10);
 printStr("\nValor lido em base 10 (signed): ");
 printInt10(value);
 }
}

// String length
//
int strlen(char *s)
{
 int len;
 for(len = 0; *s != 0; len++, s++);
 return len;
}

// String concatenate
//
char *strcat(char *dst, char *src)
{
 char *rp = dst;

 for(; *dst != 0; dst++);
 strcpy(dst, src);
 return rp;
}

// String copy
//
char *strcpy(char *dst, char *src)
{
 char *rp = dst;
 for(; (*dst = *src) != 0; dst++, src++);
 return rp;
}

// String compare (alphabetically).
// Returned value is:
// < 0 string "s1" is less than string "s2"
// = 0 string "s1" is equal to string "s2"
// > 0 string "s1" is greater than string "s2"
//
int strcmp(char *s1, char *s2)
{
 for(; (*s1 == *s2) && (*s1 != 0); s1++, s2++);
 return(*s1 - *s2);
}