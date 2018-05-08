/*******************************************************************************
 Ficheiro de implementação do Tipo de Dados Abstracto SEQ_LIST (seqlist.c).
 A estrutura de dados de suporte da sequência é uma estrutura, constituída pelos
 campos de tipo inteiro Size para indicar o número de elementos armazenados na
 sequência e os campos de tipo ponteiro para nós de lista biligada Head e Tail,
 para representar, respectivamente, a cabeça e a cauda da lista biligada onde
 são armazenados os números inteiros.

 Autor : Paulo Vasconcelos                                   NMEC : 84987
*******************************************************************************/

#include <stdio.h>
#include <stdlib.h>

#include "seqlist.h"  /* Ficheiro de interface do TDA - ADT Interface file */

/************ Definição da Estrutura de Dados Interna da Sequência ************/

typedef struct binode *PtBiNode;
struct binode /* definição do nó da lista biligada */
{
	int Elem; /* o elemento da lista */
	PtBiNode PtPrev, PtNext; /* ponteiros para o nós anterior e seguinte */
};

struct seqlist
{
  int Size; /* número de elementos - sequence's size */
  PtBiNode Head; /* ponteiro para o início da lista (cabeça da lista) - list head */
  PtBiNode Tail; /* ponteiro para o fim da lista (cauda da lista) - list tail */
};

/*********************** Controlo Centralizado de Error ************************/

static unsigned int Error = OK;  /* inicialização do erro */

static char *ErrorMessages[] = {
                                 "sem erro - Without Error",
                                 "sequencia(s) inexistente(s) - Sequence(s) do not exist",
                                 "memoria esgotada - Out of memory",
                                 "indice errado - Wrong index",
                                 "elemento inexistente - Element does not exist",
                                 "sequencia vazia - Empty sequence",
                                 "sequencia cheia - Full sequence",
                                 "dimensao da sequencia errada - Wrong size",
                                 "ficheiro inexistente - File does not exist",
                                 "ponteiro nulo - Null pointer"
                               };

static char *AbnormalErrorMessage = "erro desconhecido - Unknown error";

/************** Número de mensagens de erro previstas no módulo ***************/

#define N (sizeof (ErrorMessages) / sizeof (char *))

/******************** Protótipos dos Subprogramas Internos ********************/

PtBiNode BiNodeCreate (int);
void BiNodeDestroy (PtBiNode *);
void DoubleListDestroy (PtBiNode *);

/*************************** Definição das Funções ****************************/

void SeqListClearError (void)
{ Error = OK; }

int SeqListError (void)
{ return Error; }

char *SeqListErrorMessage (void)
{
  if (Error < N) return ErrorMessages[Error];
  else return AbnormalErrorMessage;  /* sem mensagem de erro - no error message */
}

PtSeqList SeqListCreate ()
{
  PtSeqList lista;

	/* verifica se há erros de memória - verifies if there are memory issues */
  if ((lista = malloc (sizeof (struct seqlist))) == NULL)
  {
    Error = NO_MEM;
		return NULL;
  }
  Error = OK;
  lista->Size = 0;
  lista->Head = NULL;
  lista->Tail = NULL;
  return lista;
}

void SeqListDestroy (PtSeqList *pseq)
{
  PtSeqList seq = *pseq;
	/* verifica se a sequência existe - verifies if sequence exists */
  if (seq == NULL) { Error = NO_SEQ; return ;}
  DoubleListDestroy(&seq->Head);
  free(seq);
  Error = OK;
  *pseq = NULL;
}

PtSeqList SeqListCopy (PtSeqList pseq)
{
  PtSeqList Copy;

  /* verifica se a sequência existe - verifies if sequence exists */
  if (pseq == NULL) { Error = NO_SEQ; return NULL; }

  /* criação da sequência copia nulo - creating an empty sequence */
  if ((Copy = SeqListCreate ()) == NULL) return NULL;

  /* fazer a copia da sequência - copying the components */
  for (PtBiNode Node = pseq->Head; Node != NULL; Node = Node->PtNext)
  {
    SeqListInsert (Copy, Node->Elem);
    if (Error == NO_MEM) break;
  }

  if (Error == NO_MEM) { SeqListDestroy (&Copy); return NULL; }

  Copy->Size = pseq->Size;
  Error = OK;
  return Copy;  /* devolve a sequência copia - returning the new sequence */
}

PtSeqList SeqListFileCreate (char *pfname)
{
  PtSeqList Seq; FILE *PtF; unsigned int Size, I; int Elem;

  /* abertura com validacao do ficheiro para leitura - opening the text file for reading */
  if ( (PtF = fopen (pfname, "r")) == NULL) { Error = NO_FILE; return NULL; }

  /* leitura da dimensão da sequência e do número de elementos */
  /* reading the sequence's dimension and the number of elements */
  fscanf (PtF, "%u", &Size);
  if (Size < 1) { Error = BAD_SIZE; fclose (PtF); return NULL; }

  /* criação da sequência vazia - creating an empty sequence */
  if ((Seq = SeqListCreate ()) == NULL) { fclose (PtF); return NULL; }

  Error = OK;
  /* leitura da sequência do ficheiro - reading the sequence's components from the text file */
  for (I = 0; I < Size; I++)
  {
    fscanf (PtF, "%d", &Elem);
    SeqListInsert (Seq, Elem);
    if (Error == NO_MEM) break;
  }

  if (Error == NO_MEM) { SeqListDestroy (&Seq); return NULL; }

  fclose (PtF);  /* fecho do ficheiro - closing the text file */
  return Seq;  /* devolve a sequência criada - returning the new sequence */
}

void SeqListStoreFile (PtSeqList pseq, char *pfname)
{
  FILE *PtF;

  /* verifica se a sequência existe - verifies if sequence exists */
  if (pseq == NULL) { Error = NO_SEQ; return ; }

  /* verifica se a sequência tem elementos - verifies if sequence has elements */
  if (pseq->Size == 0) { Error = SEQ_EMPTY; return ; }

  /* abertura com validacao do ficheiro para escrita - opening the text file for writing */
  if ((PtF = fopen (pfname, "w")) == NULL) { Error = NO_FILE; return ; }

  /* escrita do número de elementos armazenados na sequência */
  /* writing the number of elements */
  fprintf (PtF, "%u\n", pseq->Size);

  /* escrita da sequência - writing the sequence's components in the text file */
  for (PtBiNode Node = pseq->Head; Node != NULL; Node = Node->PtNext)
	fprintf (PtF, "%d\n", Node->Elem);

  Error = OK;
  fclose (PtF);  /* fecho do ficheiro - closing the text file */
}

int SeqListGetSize (PtSeqList pseq)
{
  if (pseq == NULL) { Error = NO_SEQ; return 0;}
  Error = OK;
  return pseq->Size;
}

int SeqListGetElement (PtSeqList pseq, int pindex)
{
  if (pseq == NULL) { Error = NO_SEQ; return 0; }
  Error = OK;
  if (pindex >= 0)
  {
    if (pindex >= pseq->Size) { Error = BAD_INDEX; return 0; }
    PtBiNode current = pseq->Head;
    for (int i = 0; i < pindex; i++)
    {
      current = current->PtNext;
    }
    return current->Elem;
  }
  else
  {
    if (pindex < (pseq->Size * -1)) { Error = BAD_INDEX; return 0; }
    PtBiNode current = pseq->Tail;
    for (int i = 0; i < pindex; i++)
    {
      current = current->PtPrev;
    }
    return current->Elem;
  }
}

void SeqListSetElement (PtSeqList pseq, int pindex, int pvalue)
{
  if (pseq == NULL) { Error = NO_SEQ; return ; }
  Error = OK;
  if (pindex >= 0)
  {
    if (pindex >= pseq->Size) { Error = BAD_INDEX; return ; }
    PtBiNode current = pseq->Head;
    for (int i = 0; i < pindex; i++)
    {
      current = current->PtNext;
    }
    current->Elem = pvalue;
  }
  else
  {
    if (pindex < (pseq->Size * -1)) { Error = BAD_INDEX; return ; }
    PtBiNode current = pseq->Tail;
    for (int i = pindex; i < -1; i++)
    {
      current = current->PtPrev;
    }
    current->Elem = pvalue;
  }
}

int SeqListEquals (PtSeqList pseq1, PtSeqList pseq2)
{
  if (pseq1 == NULL || pseq2 == NULL) { Error = NO_SEQ; return 0;}
  Error = OK;
  if (pseq1->Size != pseq2->Size) { return 0;}
  PtBiNode current1 = pseq1->Head;
  PtBiNode current2 = pseq2->Head;
  for (int i = 0; i < pseq1->Size; i++)
  {
    if (current1->Elem != current2->Elem) return 0;
    current1 = current1->PtNext;
    current2 = current2->PtNext;
  }

  return 1;
}

void SeqListInsert (PtSeqList pseq, int pvalue)
{  if(pseq == NULL){Error = NO_SEQ; return;}
    PtBiNode node = BiNodeCreate(pvalue);

    Error =OK;
   if(pseq->Head==NULL){
    pseq->Head = node;
    pseq->Size++;
    return;
   }

   PtBiNode temp =  pseq->Head;

  while(temp->PtNext != NULL) {
    temp = temp->PtNext;
  }
  temp->PtNext = node;
  node->PtPrev = temp;
  pseq->Tail = node;
  pseq->Size++;
  return;


}

void SeqListDelete (PtSeqList pseq, int pvalue)
{ if(pseq == NULL){Error = NO_SEQ; return;}
  if(pseq->Size==0){Error = SEQ_EMPTY; return;}
  int oldsize = pseq->Size;
   PtBiNode temp = pseq->Head;

  while(temp != NULL){
      if(temp->Elem == pvalue){
          if(temp == pseq->Head){
              pseq->Head = temp->PtNext;
          }
          else if(temp == pseq->Tail){
              pseq->Tail = temp->PtPrev;

          }
          else{
            temp->PtNext->PtPrev = temp->PtPrev;

            temp->PtPrev->PtNext = temp->PtNext ;
          }
              pseq->Size--;

      }
      temp = temp->PtNext;
  }
  if(oldsize != pseq->Size)
  return;

  Error = NO_NUMBER;
  return;
}
int SeqListIsOrdered (PtSeqList pseq)
{
  if (pseq == NULL) { Error = NO_SEQ; return 0;}
  if (pseq->Size == 0) { Error = SEQ_EMPTY; return 0; }
  Error = OK;
  PtBiNode temp = pseq->Head;
  for (int i = 0; i < pseq->Size-1; i++)
  {
    if (temp->Elem > temp->PtNext->Elem) return 0;
    temp = temp->PtNext;
  }
  return 1;
}

int SeqListIsEvenOdd (PtSeqList pseq)
{
 if(pseq == NULL){Error = NO_SEQ; return 0;}
  if(pseq->Size == 0){Error = SEQ_EMPTY; return 0;}
  Error = OK;

 PtBiNode temp = pseq->Head;

  while (temp->PtNext != NULL){
      if(temp->Elem % 2 == temp->PtNext->Elem % 2){
          return 0;
      }
      temp = temp->PtNext;
    }
  return 1;
}

int SeqListNumberOfMultiples (PtSeqList pseq, int pvalue)
{
  if (pseq == NULL) { Error = NO_SEQ; return 0;}
  if (pseq->Size == 0) { Error = SEQ_EMPTY; return 0;}
  Error = OK;
  PtBiNode temp = pseq->Head;
  int multiplos = 0;
  while (temp != NULL)
  {
    if (temp->Elem % pvalue == 0) multiplos++;
    temp = temp->PtNext;
  }
  return multiplos;
}

void SeqListSmallerBigger (PtSeqList pseq, int * psmall, int * pbig)
{
  if (pseq == NULL) { Error = NO_SEQ; return ;}
  if (pseq->Size == 0) { Error = SEQ_EMPTY; return ;}
  int big = pseq->Head->Elem;
  int small= pseq->Head->Elem;;
  PtBiNode temp = pseq->Head;

  while (temp != NULL){
      if(temp->Elem > big)
        big = temp->Elem;
      if(temp->Elem < small)
        small = temp->Elem;

      temp = temp->PtNext;

  }
  Error = OK;
  *psmall = small;
  *pbig = big;
  return;
}

int SeqListIsPalindromic (PtSeqList pseq)
{
  if (pseq == NULL) { Error = NO_SEQ; return 0;}
  if (pseq->Size == 0) { Error = SEQ_EMPTY; return 0;}
  Error = OK;
  PtBiNode first = pseq->Head;
  PtBiNode last = pseq->Tail;
  for (int i = 0; i < pseq->Size / 2; i++)
  {
    if (first->Elem != last->Elem) return 0;
    first = first->PtNext;
    last = last->PtPrev;
  }
  return 1;
}

double SeqListAverage (PtSeqList pseq)
{
  if(pseq == NULL){Error = NO_SEQ; return 0.0;}
  if(pseq->Size == 0) {Error = SEQ_EMPTY; return 0.0;}

  double soma = 0;
  PtBiNode temp = pseq->Head;
  while(temp != NULL){

    soma = soma + temp->Elem;
    temp = temp->PtNext;
  }
  Error = OK;
  return soma/pseq->Size;
}

/*******************************************************************************
 Função auxiliar para criar um nó da lista biligada. Valores de erro: OK ou NO_MEM.

 Auxiliary function to create a binode. Error codes: OK or NO_MEM.
*******************************************************************************/

PtBiNode BiNodeCreate (int pelem)	/* alocação do nó */
{
	PtBiNode Node;

	if ((Node = (PtBiNode) malloc (sizeof (struct binode))) == NULL)
	{ Error = NO_MEM; return NULL; }

	Node->Elem = pelem;	/* copiar a informação */
	Node->PtPrev = NULL;	/* apontar para detrás para NULL */
	Node->PtNext = NULL;	/* apontar para a frente para NULL */

	Error = OK;
	return Node;
}

/*******************************************************************************
 Função auxiliar para libertar um nó da lista biligada. Valores de erro: OK ou NULL_PTR.

 Auxiliary function to free a binode. Error codes: OK or NULL_PTR.
*******************************************************************************/
void BiNodeDestroy (PtBiNode *pnode)	/* libertação do nó */
{
	if (*pnode == NULL) { Error = NULL_PTR; return; }
	free (*pnode);	/* libertação do nó */
	*pnode = NULL;	/* colocar o ponteiro a nulo */
	Error = OK;
}

/*******************************************************************************
 Função auxiliar para destruir uma lista biligada. Valores de erro: OK ou NULL_PTR.

 Auxiliary function to destroy a double link list. Error codes: OK or NULL_PTR.
*******************************************************************************/
void DoubleListDestroy (PtBiNode *phead)
{
	PtBiNode TmpHead = *phead; PtBiNode Node;

	if (TmpHead == NULL) { Error = NULL_PTR; return; }
	while (TmpHead != NULL)
	{
		Node = TmpHead; TmpHead = TmpHead->PtNext;
		BiNodeDestroy (&Node);
	}
	Error = OK;
}
