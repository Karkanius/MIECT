/************ Interface da Fila Din�mica Gen�rica - queue.h ************/
/********* Interface File of a Generic Dynamic Queue - queue.h *********/

#ifndef _QUEUE_GENERIC
#define _QUEUE_GENERIC

/************** Defini��o do Tipo Ponteiro para uma Fila **************/
/************** Definition of the Pointer type to a Queue *************/

typedef struct queue *PtQueue;

/********************* Defini��o de C�digos de Erro ********************/
/********************* Definition of the Error Codes *******************/

#define	OK		0	/* opera��o realizada com sucesso - operation with sucess */
#define	NO_QUEUE	1	/* fila inexistente - queue does not exist */
#define	NO_MEM		2	/* mem�ria esgotada - out of memory */
#define	NULL_PTR	3	/* ponteiro nulo - null pointer */
#define	QUEUE_EMPTY	4	/* fila vazia - empty queue */

/********************* Prot�tipos dos Subprogramas *********************/
/********************* Prototypes of the Operations ********************/

PtQueue QueueCreate (unsigned int psize);
/*******************************************************************************
 Cria uma fila para armazenar elementos com psize bytes. Devolve a refer�ncia da
 fila criada ou NULL, no caso de inexist�ncia de mem�ria ou se psize for nulo.

 Creates an empty queue to store elements of psize bytes. Returns a reference to
 the new queue or NULL if there isn't enough memory.
*******************************************************************************/


int QueueDestroy (PtQueue *pqueue);
/*******************************************************************************
 Destr�i a fila pqueue e coloca a refer�ncia a NULL. Valores de retorno: OK ou NO_QUEUE.

 Destroys the queue pqueue and releases the memory. Returning error codes: OK or NO_QUEUE.
*******************************************************************************/

int QueueEnqueue (PtQueue pqueue, void *pelem);
/*******************************************************************************
 Coloca pelem na cauda da fila pqueue. Valores de retorno: OK, NO_QUEUE, NO_MEM
 ou NULL_PTR.

 Stores pelem in the queue pqueue tail. Returning error codes: OK, NO_QUEUE,
 NO_MEM or NULL_PTR.
*******************************************************************************/

int QueueDequeue (PtQueue pqueue, void *pelem);
/*******************************************************************************
 Retira o elemento da cabe�a da fila pqueue. Valores de retorno: OK, NO_QUEUE,
 NULL_PTR ou QUEUE_EMPTY.

 Removes pelem from the queue pqueue head. Returning error codes: OK,
 NO_QUEUE, NULL_PTR or QUEUE_EMPTY.
*******************************************************************************/

int QueueIsEmpty (PtQueue pqueue);
/*******************************************************************************
 Verifica se a fila pqueue est� vazia. Valores de retorno: OK, NO_QUEUE ou QUEUE_EMPTY.

 Verifies if the queue pqueue is empty. Returning error codes: OK, NO_QUEUE or QUEUE_EMPTY.
*******************************************************************************/

int QueueSize (PtQueue pqueue, unsigned int *pnelem);
/*******************************************************************************
 Determina e coloca em pnelem o n�mero de elementos armazenados na fila pqueue.
 Valores de retorno: OK, NO_QUEUE ou NULL_PTR.

 Evaluates and stores in pnelem the size of the queue pqueue. Returning error
 codes: OK, NO_QUEUE or NULL_PTR.
*******************************************************************************/

#endif