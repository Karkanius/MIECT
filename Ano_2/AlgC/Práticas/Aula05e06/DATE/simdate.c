/*******************************************************************************
 Ficheiro de interface do Tipo de Dados Abstracto Data (date.h). A informa��o
 hor�ria � composta pelasvhoras, minutos e segundos. A implementa��o providencia
 um construtor para criar e inicializar uma informa��o hor�ria v�lida. � da
 responsabilidade da aplica��o, invocar o destrutor, para libertar a mem�ria
 atribu�da ao objecto. O m�dulo providencia um controlo centralizado de erro,
 disponibilizando uma fun��o para obter o �ltimo erro ocorrido, uma fun��o para
 obter uma mensagem de erro elucidativa e uma fun��o para limpar o erro.

 Autor : Ant�nio Manuel Adrego da Rocha    Data : Mar�o de 2018
*******************************************************************************/

#ifndef _DATE
#define _DATE

/****************** Defini��o do Tipo Ponteiro para uma Data ******************/

typedef struct date *PtDate;

/************************ Defini��o de C�digos de Erro ************************/

#define	OK			0	/* opera��o realizada com sucesso */
#define	NO_DATE		1	/* a(s) data(s) n�o existe(m) */
#define	NO_MEM		2	/* mem�ria esgotada */
#define	INVALID		3	/* data inv�lida */
#define	NULL_PTR	4	/* ponteiro inexistente */

/************************* Prot�tipos dos Subprogramas ************************/

void DateClearError (void);
/*******************************************************************************
 Inicializa��o do erro.
*******************************************************************************/

int DateError (void);
/*******************************************************************************
 Indica��o do c�digo de erro ocorrido na �ltima opera��o.
*******************************************************************************/

char *DateErrorMessage (void);
/*******************************************************************************
 Obten��o da mensagem esclarecedora da causa do erro ocorrido.
*******************************************************************************/

PtDate DateCreate (int pd, int pm, int py);
/*******************************************************************************
 Cria��o e inicializa��o de uma data na forma ano/m�s/dia. A data tem de ser
 v�lida. Valores de erro: OK, NO_MEM ou INVALID.
*******************************************************************************/

PtDate DateStringCreate (char *pstrdate);
/*******************************************************************************
 Cria��o e inicializa��o de uma data a partir de uma sequ�ncia de caracteres no
 formato "yyyy-mm-dd", que pode eventualmente n�o ser v�lida. Valores de erro:
 OK, NULL_PTR, NO_MEM ou INVALID.
*******************************************************************************/

PtDate DateCopy (PtDate pdate);
/*******************************************************************************
 C�pia de uma data. Valores de erro: OK, NO_DATE ou NO_MEM.
*******************************************************************************/

void DateDestroy (PtDate *pdate);
/*******************************************************************************
 Destrui��o de uma data. Valores de erro: OK ou NO_DATE.
*******************************************************************************/

int  DateGetDay (PtDate pdate);
/*******************************************************************************
 Obter o dia da data. Valores de erro: OK ou NO_DATE.
*******************************************************************************/

int  DateGetMonth (PtDate pdate);
/*******************************************************************************
 Obter o m�s da data. Valores de erro: OK ou NO_DATE.
*******************************************************************************/

int  DateGetYear (PtDate pdate);
/*******************************************************************************
 Obter o ano da data. Valores de erro: OK ou NO_DATE.
*******************************************************************************/

/************************************************************************
 Ficheiro de implementa��o do Tipo de Dados Abstracto Data (date.c).
 A estrutura de dados de suporte do tempo � um registo constitu�do pelos
 tr�s campos de tipo inteiro Day, Month e Year.

 Autor : NOME DO ALUNO                                   NMEC :
************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "date.h" /* Ficheiro de interface do TDA - ADT Interface file */

/*************** Defini��o da Estrutura de Dados da Data ***************/

struct date
{
	unsigned int Day; unsigned int Month; unsigned int Year;
};

/******************** Controlo Centralizado de Erro ********************/

static unsigned int Error = OK;	/* inicializa��o do erro */

static char *ErrorMessages[] = { "sem erro", "data inexistente",
                                 "memoria esgotada", "data invalida",
				 "ponteiro inexistente" };

static char *AbnormalErrorMessage = "erro desconhecido";

/*********** N�mero de mensagens de erro previstas no m�dulo ***********/

#define N (sizeof (ErrorMessages) / sizeof (char *))

/***************** Prot�tipos dos Subprogramas Internos ****************/

static int LeapYear (int); /* ano bissexto */
static int ValidDate (int, int, int); /* validar data */

/********************** Defini��o dos Subprogramas *********************/

void DateClearError (void)
{ Error = OK; }

int DateError (void)
{ return Error; }

char *DateErrorMessage (void)
{
	if (Error < N) return ErrorMessages [Error];
	else return AbnormalErrorMessage; /* sem mensagem de erro */
}

PtDate DateCreate (int pday, int pmonth, int pyear) /* construtor inicializador */
{
}

void DateDestroy (PtDate *pdate) /* destrutor */
{
}

PtDate DateStringCreate (char *pstrdate) /* construtor a partir de uma string */
{
	if (pstrdate == NULL) { Error = NULL_PTR; return NULL; }
	if (strlen (pstrdate) != 10) { Error = INVALID; return NULL; }

	char * date[4]; int i = 0;

	date[i] = strtok (pstrdate, "-");
	while (date[i] != NULL) date[++i] = strtok (NULL, "-");

	if (i != 3) { Error = INVALID; return NULL; }

	int Year, Month, Day;
	sscanf (date[0], "%d", &Year);
	sscanf (date[1], "%d", &Month);
	sscanf (date[2], "%d", &Day);

	return DateCreate (Day, Month, Year);
}

PtDate DateCopy (PtDate pdate)	/* construtor c�pia */
{
	if (pdate == NULL) { Error = NO_DATE; return NULL; }
	else return DateCreate (pdate->Day, pdate->Month, pdate->Year);
}

int  DateGetYear (PtDate pdate) /* observador do ano */
{
}

int DateGetMonth (PtDate pdate) /* observador do m�s */
{
	if (pdate == NULL) { Error = NO_DATE; return 0; }
	else { Error = OK; return pdate->Month; }
}

int DateGetDay (PtDate pdate) /* observador do dia */
{
}

void DateSet (PtDate pdate, int pday, int pmonth, int pyear) /* modificador da data */
{
}

int DateEquals (PtDate pdate1, PtDate pdate2)  /* comparador de igualdade */
{
}

int DateCompareTo (PtDate pdate1, PtDate pdate2)  /* operador relacional (> == <) */
{
}

int DateDayMonth (int pmonth, int pyear) /* dias de um m�s */
{
	int MonthDays[] = { 31,28,31,30,31,30,31,31,30,31,30,31 };

}

char * DateToString (PtDate pdate)  /* data no formato dd/mm/yyyy */
{
	/* verifica se a data existe - verifies if date exists */
	if (pdate == NULL) { Error = NO_DATE; return NULL; }

	char * Str;
	/* cria a sequ�ncia de caracteres - allocating the string */
	if ((Str = calloc (11, sizeof (char))) == NULL)
	{ Error = NO_MEM; return NULL; }

	sprintf (Str, "%02d/%02d/%04d", pdate->Day, pdate->Month, pdate->Year);
	Error = OK;
	return Str;
}

char * DateToFullString (PtDate pdate)  /* data por extenso */
{
	char* FullMonth[] = {"janeiro", "fevereiro", "mar�o", "abril",
						 "maio", "junho", "julho", "agosto",
						 "setembro", "outubro", "novembro", "dezembro"};

	/* verifica se a data existe - verifies if date exists */
	if (pdate == NULL) { Error = NO_DATE; return NULL; }

	char * Str;
	/* cria a sequ�ncia de caracteres - allocating the string */
	if ((Str = calloc (23, sizeof (char))) == NULL)
	{ Error = NO_MEM; return NULL; }

	sprintf (Str, "%02d de %s de %04d", pdate->Day, FullMonth[pdate->Month-1], pdate->Year);
	Error = OK;
	return Str;
}

PtDate DateTomorrow (PtDate pdate)  /* nova data com o dia seguinte */
{
}

PtDate DateYesterday (PtDate pdate)  /* nova data com o dia anterior */
{
}

/*************** Implementa��o dos Subprogramas Internos ***************/

/*******************************************************************************

 Programa gr�fico de simula��o da funcionalidade do TDA Date


 Autor : Ant�nio Manuel Adrego da Rocha    Data : Fevereiro de 2018

*******************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#include "date.h"  /* Ficheiro de interface do tipo de dados */

#define MAX_DATES 10
#define MAX_OPTIONS 7

void Menu (void);
void ReadOption (int *);
void ReadDateIndex (int *, char *);
int ActiveDate (PtDate *, int);
int NotActiveDate (PtDate *, int);
void WriteErrorMessage (char *);
void ReadDate (PtDate *);
void ReadDateUniv (PtDate *);
void WriteDate (PtDate);
void WriteResult (int);

int main (void)
{
  PtDate DateArray[MAX_DATES];
  int Option, Status, Index, Date1, Date2, Comp; char * DateStr;

  for (Index = 0; Index < MAX_DATES; Index++) DateArray[Index] = NULL;

  do
  {
    /* limpar o ecran e apresentar menu */
    Menu ();

    /* inicializar o erro */
    DateClearError ();

    /* apresentar as datas activas */
    for (Index = 0; Index < MAX_DATES; Index++)
      if (DateArray[Index] != NULL)
      {
        DateStr = DateToString (DateArray[Index]);
        if (DateStr)
        {
          printf ("\e[1m\e[%d;43f%s", 5+Index, DateStr);
          printf ("\e[0m");
		  free (DateStr);
        }
      }

    /* ler opcao do utilizador */
    ReadOption (&Option);

    switch (Option)
    {
        case 1 :  ReadDateIndex (&Date1, "data");
                  if (ActiveDate (DateArray, Date1)) break;
                  do
                  {
                  	printf("\e[0m\e[23;1f| Formato [1] \"yyyy-mm-dd\" [2] dia mes ano -> ");
                  	Status = scanf ("%d", &Option);
					scanf ("%*[^\n]"); scanf ("%*c");
				  } while (!Status || Option < 1 || Option > 2);
                  if (Option == 1) ReadDateUniv (&DateArray[Date1]);
                  else ReadDate (&DateArray[Date1]);
                  if (DateError ()) WriteErrorMessage ("A criacao");
                  break;

        case 2 :  ReadDateIndex (&Date1, "data origem");
                  if (NotActiveDate (DateArray, Date1)) break;
                  do
                  {
                    ReadDateIndex (&Date2, "data destino");
                  } while (Date2 == Date1);
                  if (ActiveDate (DateArray, Date2)) break;
                  DateArray[Date2] = DateCopy (DateArray[Date1]);
                  if (DateError ()) WriteErrorMessage ("A copia");
                  break;

        case 3 :  ReadDateIndex (&Date1, "primeira data");
                  if (NotActiveDate (DateArray, Date1)) break;
                  do
                  {
                    ReadDateIndex (&Date2, "segunda data");
                  } while (Date2 == Date1);
                  if (NotActiveDate (DateArray, Date2)) break;
                  Comp = DateCompareTo (DateArray[Date1], DateArray[Date2]);
                  if (DateError ()) WriteErrorMessage ("A comparacao");
                  else WriteResult (Comp);
                  break;

        case 4 :  ReadDateIndex (&Date1, "data");
                  if (NotActiveDate (DateArray, Date1)) break;
                  DateStr = DateToFullString (DateArray[Date1]);
                  if (DateError ()) WriteErrorMessage ("A data por extenso");
                  else
                  {
                       printf("\e[22;1f| %s \e[1m", DateStr);
                       printf("\e[0m\e[23;1f| Prima uma tecla para continuar ");
                       scanf ("%*[^\n]"); scanf ("%*c");
                  }
                  break;

        case 5 :  ReadDateIndex (&Date1, "data origem");
                  if (NotActiveDate (DateArray, Date1)) break;
                  do
                  {
                    ReadDateIndex (&Date2, "data destino");
                  } while (Date2 == Date1);
                  if (ActiveDate (DateArray, Date2)) break;
                  DateArray[Date2] = DateTomorrow (DateArray[Date1]);
                  if (DateError ()) WriteErrorMessage ("A data seguinte");
                  break;

        case 6 :  ReadDateIndex (&Date1, "data origem");
                  if (NotActiveDate (DateArray, Date1)) break;
                  do
                  {
                    ReadDateIndex (&Date2, "data destino");
                  } while (Date2 == Date1);
                  if (ActiveDate (DateArray, Date2)) break;
                  DateArray[Date2] = DateYesterday (DateArray[Date1]);
                  if (DateError ()) WriteErrorMessage ("A data anterior");
                  break;

        case 7 :  ReadDateIndex (&Date1, "data");
                  if (NotActiveDate (DateArray, Date1)) break;
                  DateDestroy (&DateArray[Date1]);
                  if (DateError ()) WriteErrorMessage ("A eliminacao");
                  break;
    }
  } while (Option != 0);

  for (Index = 0; Index < MAX_DATES; Index++)
    if (DateArray[Index] != NULL) DateDestroy (&DateArray[Index]);

  printf ("\e[25;1f");

  return EXIT_SUCCESS;
}

void Menu (void)
{
  system ("clear");

  printf("\e[2;1f~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n");
  printf("\e[3;1f|        Programa Grafico Para Simular Operacoes Sobre Datas        |\n");
  printf("\e[4;1f~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n");
  printf("\e[5;1f| 1 - Criar uma data           | Data 0 =                           |\n");
  printf("\e[6;1f| 2 - Copiar uma data          | Data 1 =                           |\n");
  printf("\e[7;1f| 3 - Comparar datas           | Data 2 =                           |\n");
  printf("\e[8;1f| 4 - Data por extenso         | Data 3 =                           |\n");
  printf("\e[9;1f| 5 - Data seguinte            | Data 4 =                           |\n");
  printf("\e[10;1f| 6 - Data anterior            | Data 5 =                           |\n");
  printf("\e[11;1f| 7 - Apagar uma data          | Data 6 =                           |\n");
  printf("\e[12;1f| 0 - Terminar o programa      | Data 7 =                           |\n");
  printf("\e[13;1f|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~| Data 8 =                           |\n");
  printf("\e[14;1f| Opcao ->                     | Data 9 =                           |\n");
  printf("\e[15;1f~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n");
  printf("\e[16;1f|                    Janela de Aquisicao de Dados                   |\n");
  printf("\e[17;1f~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n");
  printf("\e[18;1f|                                                                   |\n");
  printf("\e[19;1f~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n");
  printf("\e[20;1f|            Janela de Mensagens de Erro e de Resultados            |\n");
  printf("\e[21;1f~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n");
  printf("\e[22;1f|                                                                   |\n");
  printf("\e[23;1f|                                                                   |\n");
  printf("\e[24;1f~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n");
}

void ReadOption (int *popc)
{
  do
  {
    printf("\e[14;1f| Opcao ->                     |");
    printf("\e[14;12f"); scanf ("%d", popc);
    scanf ("%*[^\n]"); scanf ("%*c");
  } while (*popc < 0 || *popc > MAX_OPTIONS);
}

void ReadDateIndex (int *pnd, char *pmsg)
{
  int msglen = strlen (pmsg);

  do
  {
    *pnd = -1;
    printf("\e[18;1f| Indice do %s ->                          ", pmsg);
    printf("\e[18;%df", 17+msglen); scanf ("%d", pnd);
    scanf ("%*[^\n]"); scanf ("%*c");
  } while (*pnd < 0 || *pnd >= MAX_DATES);
}

int ActiveDate (PtDate pnfarray[], int pnf)
{
  char car;

  if (pnfarray[pnf] != NULL)
  {
    do
    {
      printf("\e[1m\e[22;1f| A data %d ja existe!                     ", pnf);
      printf("\e[0m\e[23;1f| Deseja apaga-la (s/n)? ");
      scanf ("%c", &car); car = tolower (car);
      scanf ("%*[^\n]"); scanf ("%*c");
    } while (car != 'n' && car != 's');

    if (car == 's') { DateDestroy (&pnfarray[pnf]); return 0; }
    else return 1;
  }
  else return 0;
}

int NotActiveDate (PtDate pnfarray[], int pnf)
{
  if (pnfarray[pnf] == NULL)
  {
    printf("\e[1m\e[22;1f| A data %d nao existe!                     ", pnf);
    printf("\e[0m\e[23;1f| Prima uma tecla para continuar ");
    scanf ("%*[^\n]"); scanf ("%*c");
    return 1;
  }
  else return 0;
}

void WriteErrorMessage (char *pmsg)
{
  printf("\e[22;1f| %s nao foi efectuada devido a -> \e[1m%s", pmsg, DateErrorMessage ());
  printf("\e[0m\e[23;1f| Prima uma tecla para continuar ");
  scanf ("%*[^\n]"); scanf ("%*c");
}

void ReadDate (PtDate *pd)
{
  int VY, VM, VD; int Status;

  do
  {
    printf("\e[18;1f| Dia da data ->                ");
    printf("\e[18;18f"); Status = scanf ("%d", &VD);
    scanf ("%*[^\n]"); scanf ("%*c");
  } while (!Status || VD < 1 || VD > 31);

  do
  {
    printf("\e[18;1f| Mes da data ->                ");
    printf("\e[18;18f"); Status = scanf ("%d", &VM);
    scanf ("%*[^\n]"); scanf ("%*c");
  } while (!Status || VM < 1 || VM > 12);

  do
  {
    printf("\e[18;1f| Ano da data ->                      ");
    printf("\e[18;18f"); Status = scanf ("%d", &VY);
    scanf ("%*[^\n]"); scanf ("%*c");
  } while (!Status || VY < 0);

  *pd = DateCreate (VD, VM, VY);
}

void ReadDateUniv (PtDate *pd)
{
  int Status; char DataStr[11];

  do
  {
    printf("\e[18;1f| Data ->                ");
    printf("\e[18;11f"); Status = scanf ("%10s", DataStr);
    scanf ("%*[^\n]"); scanf ("%*c");
  } while (!Status);

  *pd = DateStringCreate (DataStr);
}

void WriteDate (PtDate pd)
{
  if (pd != NULL) printf ("%2d/%2d/%4d", DateGetDay (pd), DateGetMonth (pd), DateGetYear (pd));
}

void WriteResult (int pres)
{
  if (pres >0) printf("\e[22;1f| primeira data posterior a segunda data \e[1m");
  else if (pres < 0) printf("\e[22;1f| primeira data anterior a segunda data \e[1m");
       else printf("\e[22;1f| datas iguais \e[1m");
  printf("\e[0m\e[23;1f| Prima uma tecla para continuar ");
  scanf ("%*[^\n]"); scanf ("%*c");
}

#endif
