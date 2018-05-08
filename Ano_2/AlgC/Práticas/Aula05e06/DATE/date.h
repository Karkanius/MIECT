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

void DateSet (PtDate pdate, int pday, int pmonth, int pyear);
/*******************************************************************************
 Modificar a data para pday/pmonth/pyear. Valores de erro: OK, NO_DATE ou INVALID.
*******************************************************************************/

int DateEquals (PtDate pdate1, PtDate pdate2);
/*******************************************************************************
 Compara��o de igualdade de duas datas. Devolve 1 em caso afirmativo e 0 em caso
 contr�rio. Valores de erro:OK ou NO_DATE.
*******************************************************************************/

int DateCompareTo (PtDate pdate1, PtDate pdate2);
/*******************************************************************************
 Compara��o relacional de duas datas. Devolve um valor negativo se pdate1 for 
 anterior a pdate2, o valor zero se forem iguais e um valor positivo se pdate1
 for posterior a pdate2. Valores de erro: OK ou NO_DATE.
*******************************************************************************/

int  DateDayMonth (int pmonth, int pyear);
/*******************************************************************************
 Obter o n�mero de dias do m�s. Valores de erro: OK, INVALID ou NO_DATE.
*******************************************************************************/

char * DateToString (PtDate pdate);
/*******************************************************************************
 Devolve uma sequ�ncia de caracteres que representa a data no formato dd/mm/yyyy
 ou NULL, caso n�o exista mem�ria. Valores de erro: OK, NO_DATE ou NO_MEM.
*******************************************************************************/

char * DateToFullString (PtDate pdate);
/*******************************************************************************
 Devolve uma sequ�ncia de caracteres que representa a data por extenso ou NULL, 
 caso n�o exista mem�ria. Valores de erro: OK, NO_DATE ou NO_MEM.
*******************************************************************************/

PtDate DateYesterday (PtDate pdate);
/*******************************************************************************
 Dia anterior da data pdate. Devolve a refer�ncia da nova data ou NULL, caso n�o
 exista mem�ria. Valores de erro: OK, NO_DATE ou NO_MEM.
*******************************************************************************/

PtDate DateTomorrow (PtDate pdate);
/*******************************************************************************
 Dia seguinte da data pdate. Devolve a refer�ncia da nova data ou NULL, caso n�o
 exista mem�ria. Valores de erro: OK, NO_DATE ou NO_MEM.
*******************************************************************************/

#endif