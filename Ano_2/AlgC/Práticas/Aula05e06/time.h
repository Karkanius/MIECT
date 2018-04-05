/*******************************************************************************
 Ficheiro de interface do Tipo de Dados Abstracto Informa��o Hor�ria (time.h).
 A informa��o hor�ria � composta pelas horas, minutos e segundos. A implementa��o
 providencia um construtor para criar e inicializar uma informa��o hor�ria v�lida.
 � da responsabilidade da aplica��o, invocar o destrutor, para libertar a mem�ria
 atribu�da ao objecto. O m�dulo providencia um controlo centralizado de erro,
 disponibilizando uma fun��o para obter o �ltimo erro ocorrido, uma fun��o para
 obter uma mensagem de erro elucidativa e uma fun��o para limpar o erro.

 Autor : Ant�nio Manuel Adrego da Rocha    Data : Mar�o de 2018
*******************************************************************************/

#ifndef _TIME
#define _TIME

/*********** Defini��o do Tipo Ponteiro para uma Informa��o Hor�ria ***********/

typedef struct time *PtTime;

/************************ Defini��o de C�digos de Erro ************************/

#define	OK      0	/* opera��o realizada com sucesso */
#define	NO_TIME 1	/* o(s) tempo(s) n�o existe(m) */
#define	NO_MEM  2	/* mem�ria esgotada */
#define	INVALID 3	/* tempo inv�lido */

/************************* Prot�tipos dos Subprogramas ************************/

void TimeClearError (void);
/*******************************************************************************
 Inicializa��o do erro.
*******************************************************************************/

int TimeError (void);
/*******************************************************************************
 Indica��o do c�digo de erro ocorrido na �ltima opera��o.
*******************************************************************************/

char *TimeErrorMessage (void);
/*******************************************************************************
 Obten��o da mensagem esclarecedora da causa do erro ocorrido.
*******************************************************************************/

PtTime TimeCreate (int ph, int pm, int ps);
/*******************************************************************************
 Cria��o e inicializa��o de uma informa��o hor�ria na forma ph:pm:ps. O tempo tem
 de ser v�lido. Devolve a refer�ncia do tempo criado ou NULL, caso n�o exista 
 mem�ria. Valores de erro: OK, NO_MEM ou INVALID.
*******************************************************************************/

PtTime TimeCopy (PtTime ptime);
/*******************************************************************************
 C�pia de uma informa��o hor�ria. Valores de erro: OK, NO_TIME ou NO_MEM.
*******************************************************************************/

void TimeDestroy (PtTime *ptime);
/*******************************************************************************
 Destrui��o de uma informa��o hor�ria. Valores de erro: OK ou NO_TIME.
*******************************************************************************/

int  TimeGetHour (PtTime ptime);
/*******************************************************************************
 Obter as horas da informa��o hor�ria. Valores de erro: OK ou NO_TIME.
*******************************************************************************/

int  TimeGetMinute (PtTime ptime);
/*******************************************************************************
 Obter os minutos da informa��o hor�ria. Valores de erro: OK ou NO_TIME.
*******************************************************************************/

int  TimeGetSecond (PtTime ptime);
/*******************************************************************************
 Obter os segundos da informa��o hor�ria. Valores de erro: OK ou NO_TIME.
*******************************************************************************/

void  TimeSetHour (PtTime ptime, int ph);
/*******************************************************************************
 Coloca as horas da informa��o hor�ria a ph.
 Valores de erro: OK, INVALID ou NO_TIME.
*******************************************************************************/

void TimeSetMinute (PtTime ptime, int pm);
/*******************************************************************************
 Coloca os minutos da informa��o hor�ria a pm.
 Valores de erro: OK, INVALID ou NO_TIME.
*******************************************************************************/

void TimeSetSecond (PtTime ptime, int ps);
/*******************************************************************************
 Coloca os segundos da informa��o hor�ria a ps.
 Valores de erro: OK, INVALID ou NO_TIME.
*******************************************************************************/

int TimeIsZero (PtTime ptime);
/*******************************************************************************
 Verifica se a informa��o hor�ria � 00:00:00. Devolve 1 em caso afirmativo e 0
 em caso contr�rio. Valores de erro: OK ou NO_TIME.
*******************************************************************************/

int TimeEquals (PtTime ptime1, PtTime ptime2);
/*******************************************************************************

 Compara��o de igualdade de duas informa��es hor�rias. Devolve 1 em caso afirmativo
 e 0 em caso contr�rio. Valores de erro: OK ou NO_TIME.
*******************************************************************************/

int TimeCompareTo (PtTime ptime1, PtTime ptime2);
/*******************************************************************************
 Compara��o relacional de duas informa��es hor�rias. Devolve um valor negativo se
 ptime1 for menor do que ptime2, o valor zero se forem iguais e um valor positivo
 se ptime1 for maior do que ptime2. Valores de erro: OK ou NO_TIME.
*******************************************************************************/

char * TimeToString (PtTime ptime);
/*******************************************************************************
 Devolve uma sequ�ncia de caracteres que representa a informa��o hor�ria no 
 formato hh:mm:ss ou uma sequ�ncia de caracteres nula, caso n�o exista mem�ria.
 Valores de erro: OK, NO_TIME ou NO_MEM.
*******************************************************************************/

PtTime TimeNext (PtTime ptime);
/*******************************************************************************
 Informa��o hor�ria seguinte (ptime mais um segundo). Devolve a refer�ncia da
 nova informa��o hor�ria ou NULL, caso n�o exista mem�ria ou ela seja invalida.
 Valores de erro: OK, NO_TIME, INVALID ou NO_MEM.
*******************************************************************************/

PtTime TimePreview (PtTime ptime);
/*******************************************************************************
 Informa��o hor�ria anterior (ptime menos um segundo). Devolve a refer�ncia da
 nova informa��o hor�ria ou NULL, caso n�o exista mem�ria ou ela seja invalida.
 Valores de erro: OK, NO_TIME, INVALID ou NO_MEM.
*******************************************************************************/

PtTime TimeAdd (PtTime ptime1, PtTime ptime2);
/*******************************************************************************
 Adi��o de duas informa��es hor�rias. Devolve a refer�ncia da nova informa��o 
 hor�ria ou NULL, caso n�o exista mem�ria, ou a opera��o n�o possa ser realizada.
 Valores de erro: OK, NO_TIME, INVALID ou NO_MEM.
*******************************************************************************/

PtTime TimeSub (PtTime ptime1, PtTime ptime2);
/*******************************************************************************
 Subtrac��o de duas informa��es hor�rias se ptime1 for maior ou igual a ptime2.
 Devolve a refer�ncia da nova informa��o hor�ria ou NULL, caso n�o exista mem�ria,
 ou a opera��o n�o possa ser realizada. Valores de erro: OK, NO_TIME, INVALID ou NO_MEM.
*******************************************************************************/

int TimeTotalSeconds (PtTime pt);
/*******************************************************************************
 N�mero total de segundos de uma informa��o hor�ria. Valores de erro: OK ou NO_TIME.
*******************************************************************************/

#endif