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

/*******************************************************************************
Alterações e desenvolcimento de código realizado por:
Paulo Vasconcelos
84987
MIECT
março 2018
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
	if (!ValidDate (pday, pmonth, pyear)) return NULL;

  PtDate Date;
  /* cria a data - allocating the supporting record */
  if ((Date = malloc (sizeof (struct date))) == NULL)
  { Error = NO_MEM; return NULL; }

  /* armazenamento da informa��o hor�ria - storing the date */
  Date->Day = pday; Date->Month = pmonth; Date->Year = pyear;

  Error = OK;
  return Date;    /* devolve a data criada - returning the new date */
}

void DateDestroy (PtDate *pdate) /* destrutor */
{
	PtDate TmpDate = *pdate;

  /* verifica se o tempo existe - verifies if Date exists */
  if (TmpDate == NULL) { Error = NO_DATE; return ; }

  /* liberta��o da mem�ria din�mica - free dynamic memory */
  free (TmpDate);

  Error = OK;
  *pdate = NULL;  /* programa��o defensiva - defensive programming */
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
	/* verifica se a data existe - verifies if date exists */
  if (pdate == NULL) { Error = NO_DATE; return 0; }

  Error = OK;
  return pdate->Year;
}

int DateGetMonth (PtDate pdate) /* observador do m�s */
{
	/* verifica se a data existe - verifies if date exists */
  if (pdate == NULL) { Error = NO_DATE; return 0; }

  Error = OK;
  return pdate->Month;
}

int DateGetDay (PtDate pdate) /* observador do dia */
{
	/* verifica se a data existe - verifies if date exists */
  if (pdate == NULL) { Error = NO_DATE; return 0; }

  Error = OK;
  return pdate->Day;
}

void DateSet (PtDate pdate, int pday, int pmonth, int pyear) /* modificador da data */
{
	/* verifica se a data existe - verifies if date exists */
  if (pdate == NULL) { Error = NO_DATE; return ; }

  if (ValidDate(pday, pmonth, pyear)) { Error = OK; pdate->Day = pday; pdate->Month = pmonth; pdate->Year = pyear; }
  else Error = INVALID;
}

int DateEquals (PtDate pdate1, PtDate pdate2)  /* comparador de igualdade */
{
	/* valida��o das datas - validating the existence of the two dates */
  if (!(ValidDate(pdate1->Day, pdate1->Month, pdate1->Year)&&ValidDate(pdate2->Day, pdate2->Month, pdate2->Year))) return 0;

  if (pdate1 == pdate2) return 1;
  return DateCompareTo (pdate1, pdate2) == 0;
}

int DateCompareTo (PtDate pdate1, PtDate pdate2)  /* operador relacional (> == <) */
{
	/* valida��o das datas - validating the existence of the two dates */
  if (pdate1->Year > pdate2->Year) { return 1; }
	else if (pdate1->Year < pdate2->Year) { return -1; }
	else {
		if (pdate1->Month > pdate2->Month) { return 1; }
		else if (pdate1->Month < pdate2->Month) { return -1; }
		else {
			if (pdate1->Day > pdate2->Day) { return 1; }
			else if (pdate1->Day < pdate2->Day) { return -1; }
			else { return 0; }
		}
	}
}

int DateDayMonth (int pmonth, int pyear) /* dias de um m�s */
{
	int MonthDays[] = { 31,28,31,30,31,30,31,31,30,31,30,31 };
	if ((pmonth==2) && LeapYear(pyear)) { return 29; }
	return MonthDays[pyear-1];
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
	if (ValidDate(pdate->Day+1, pdate->Month, pdate->Year)) { return DateCreate(pdate->Day+1, pdate->Month, pdate->Year); }
	else {
		if (ValidDate(1, pdate->Month+1, pdate->Year)) { return DateCreate(1, pdate->Month+1, pdate->Year); }
		else { return DateCreate(1, 1, pdate->Year+1); }
	}
}

PtDate DateYesterday (PtDate pdate)  /* nova data com o dia anterior */
{
	if (ValidDate(pdate->Day-1, pdate->Month, pdate->Year)) { return DateCreate(pdate->Day-1, pdate->Month, pdate->Year); }
	else {
		if (ValidDate(31, pdate->Month-1, pdate->Year)) { return DateCreate(31, pdate->Month-1, pdate->Year); }
		else if (ValidDate(30, pdate->Month-1, pdate->Year)) { return DateCreate(30, pdate->Month-1, pdate->Year); }
		else if (ValidDate(29, pdate->Month-1, pdate->Year)) { return DateCreate(29, pdate->Month-1, pdate->Year); }
		else if (ValidDate(28, pdate->Month-1, pdate->Year)) { return DateCreate(28, pdate->Month-1, pdate->Year); }
		else { return DateCreate(31, 12, pdate->Year-1); }
	}
}

/*************** Implementa��o dos Subprogramas Internos ***************/

/*******************************************************************************
 Fun��o auxiliar que verifica se um ano � bissexto. Devolve 1 em caso afirmativo
  e 0 em caso contr�rio. Valores de erro: OK.

 Auxiliary function to verify if a year is a leap year. Returns 1 in affirmative
 case and 0 otherwise. Error codes: OK.
*******************************************************************************/
static int LeapYear (int pyear)
{
	Error = OK;
	return (((pyear % 4 == 0) && (pyear % 100 != 0)) || (pyear % 400 == 0));
}

/*******************************************************************************
 Fun��o auxiliar que verifica se uma data definida por dia, m�s e ano � v�lida.
 Devolve 1 em caso afirmativo e 0 em caso contr�rio. Valores de erro: OK ou INVALID.

 Auxiliary function to verify if a date defined by day, month and year is valid.
 Returns 1 in affirmative case and 0 otherwise. Error codes: OK or INVALID.
*******************************************************************************/

static int ValidDate (int pday, int pmonth, int pyear)
{
	int leapyear;

	Error = OK;
    switch (pmonth)
    {
		case  1:
		case  3:
		case  5:
		case  7:
		case  8:
  	case 10:
  	case 12: if (pday < 1 || pday > 31) Error = INVALID;
			 break;
  	case  4:
  	case  6:
  	case  9:
  	case 11: if (pday < 1 || pday > 30) Error = INVALID;
			 break;
  	case  2: leapyear = LeapYear (pyear);
               if (pday < 1 || (pday > 29 && leapyear) || (pday > 28 && !leapyear))
				Error = INVALID;
               break;
      default: Error = INVALID;
  }
  if (Error == OK) return 1; else return 0;
}

#endif
