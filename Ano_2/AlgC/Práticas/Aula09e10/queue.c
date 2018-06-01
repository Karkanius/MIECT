/************** Implementa��o Din�mica Gen�rica - queue.c **************/
/****** Implementation File of a Generic Dynamic Queue - queue.c *******/

#include <stdlib.h>
#include <string.h>
#include "queue.h"	/* ficheiro de interface da fila - queue interface */

/*************** Defini��o do Estrutura de Dados da Fila ***************/
/**************** Definition of the Queue Data Structure ***************/

typedef struct node *PtNode;
 
struct node	/* defini��o de um n� da lista - node definition */
{
	void *PtElem;	/* ponteiro para o elemento gen�rico - pointer to a generic element */
	PtNode PtNext;	/* ponteiro para o n� seguinte - pointer to next node */
};

struct queue	/* defini��o da fila - queue definition */
{
	unsigned int Size;	/* tamanho em n�mero de bytes de cada elemento - size of the element */
	PtNode Head, Tail;	/* cabe�a e cauda da fila - queue head and tail */
};

/********************** Defini��o dos Subprogramas *********************/
/******************* Implementation of the Operations ******************/

PtQueue QueueCreate (unsigned int psize)
{
	PtQueue Queue;

	if (psize == 0) return NULL;
	if ((Queue = (PtQueue) malloc (sizeof (struct queue))) == NULL)
		return NULL;	/* alocar mem�ria para a fila - memory alocation for the queue */
	Queue->Size = psize;	/* armazenar o tamanho dos elementos - store the element's size */
	Queue->Head = NULL;	/* inicializar a cabe�a da fila - queue head inicialization */
	Queue->Tail = NULL;	/* inicializar a cauda da fila - queue tail inicialization */
	return Queue;		/* devolver a refer�ncia da fila acabada de criar - returning the new queue */
}

int QueueDestroy (PtQueue *pqueue)
{
	PtQueue TmpQueue = *pqueue; PtNode TmpNode;

	if (TmpQueue == NULL) return NO_QUEUE;
	while (TmpQueue->Head != NULL)
	{				/* libertar a mem�ria ocupada pelos elementos da fila - free the list elements */
		TmpNode = TmpQueue->Head;
		TmpQueue->Head = TmpQueue->Head->PtNext;
		free (TmpNode->PtElem);
		free (TmpNode);
	}
	free (TmpQueue);	/* libertar a mem�ria ocupada pela fila - free the queue */
	*pqueue = NULL;	/* colocar a refer�ncia da fila a NULL - queue pointing to null*/
	return OK;
}

int QueueEnqueue (PtQueue pqueue, void *pelem)
{
	PtNode TmpNode;

	if (pqueue == NULL) return NO_QUEUE;
	if ((TmpNode = (PtNode) malloc (sizeof (struct node))) == NULL)
		return NO_MEM;
	if ((TmpNode->PtElem = malloc (pqueue->Size)) == NULL)
	{ free (TmpNode); return NO_MEM; }
	TmpNode->PtNext = NULL;
	if (pqueue->Tail == NULL) pqueue->Head = TmpNode;
	else pqueue->Tail->PtNext = TmpNode;
	pqueue->Tail = TmpNode;
	memcpy (pqueue->Tail->PtElem, pelem, pqueue->Size);	/* colocar - storing */
	return OK;
}

int QueueDequeue (PtQueue pqueue, void *pelem)
{
	PtNode TmpNode;

	if (pqueue == NULL) return NO_QUEUE;
	if (pqueue->Head == NULL) return QUEUE_EMPTY;
	if (pelem == NULL) return NULL_PTR;
	memcpy (pelem, pqueue->Head->PtElem, pqueue->Size);	/* retirar - removing */
	TmpNode = pqueue->Head;
	pqueue->Head = pqueue->Head->PtNext;
	if (pqueue->Head == NULL) pqueue->Tail = NULL;
	free (TmpNode->PtElem);
	free (TmpNode);
	return OK;
}

int QueueIsEmpty (PtQueue pqueue)
{
	if (pqueue == NULL) return NO_QUEUE;
	if (pqueue->Head == NULL) return QUEUE_EMPTY;
	return OK;
}