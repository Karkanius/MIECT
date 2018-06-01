/*******************************************************************************

 Algoritmos de manipula��o de uma arvore bin�ria de pesquisa ordenada por ordem
 crescente. Os nos da arvore s�o compactos e armazenam elementos inteiros.

 Nome : Paulo Vasconcelos                                         NMEC : 84987

 Algorithms for manipulating a binary search tree sorted by increasing order. The
 tree nodes are compact and store integer elements.

*******************************************************************************/

#include <stdlib.h>
#include <stdio.h>
#include "abp.h"
#include "stack.h"
#include "queue.h"

struct abpnode /* estrutura do no compacto - compact node data structure */
{
  PtABPNode PtLeft;  /* ponteiro para o no esquerdo da arvore - left node pointer */
  PtABPNode PtRight;  /* ponteiro para o no direito da arvore - right node pointer */
  int Elem;  /* elemento inteiro armazenado na ABP - integer element stored in the BST */
};

/*********************** Controlo Centralizado de Erro ************************/

static unsigned int Error = OK;    /* inicializa��o do erro */

static char *ErrorMsg[] = { "sem erro - without error", "abp inexistente - bst does not exist", "sem memoria - out of memory",
                            "ponteiro nulo - null pointer", "arvore vazia - empty tree", "elemento existente - element already exists",
                            "elemento inexistente - element does not exist", "ficheiro inexistente - file does not exist",  "parametros errados - wrong parameters" };

static char *AbnormalErrorMsg = "erro desconhecido - unknown error";

/******* N representa o n�mero de mensagens de erro previstas no m�dulo *******/

#define N (sizeof (ErrorMsg) / sizeof (char *))

/************************ Alus�o �s Fun��es Auxiliares ************************/

static PtABPNode ABPNodeCreate (int);
static void ABPNodeDestroy (PtABPNode *);
static PtABPNode SearchRec (PtABPNode, int);
static PtABPNode SearchRep (PtABPNode, int);
static PtABPNode KMinRec (PtABPNode, unsigned int);
static void NodeDelete (PtABPNode *);
static int FindMin (PtABPNode);
static void ListInOrder (PtABPNode, int [], unsigned int *);
static void Balance (PtABPNode *, int [], int , int);
static void Display (PtABPNode, unsigned int);
static void StoreFilePreOrder (PtABPNode, FILE *);
static PtABPNode CopyRec (PtABPNode);

/*************************** Defini��o das Fun��es ****************************/

int ABPErrorCode (void)
{
    return Error;
}

/******************************************************************************/

char *ABPErrorMessage (void)
{
    if (Error < N) return ErrorMsg[Error];
    else return AbnormalErrorMsg;    /* n�o h� mensagem de erro - no error message */
}

/******************************************************************************/

PtABPNode ABPCreate (void)
{
    return NULL;
}

/******************************************************************************/

void ABPDestroy (PtABPNode *proot)
{
	if (*proot != NULL)
	{
		ABPDestroy (&(*proot)->PtLeft);	/* destruir a subarvore esquerda - destroying the left subtree */
		ABPDestroy (&(*proot)->PtRight);	/* destruir a subarvore direita - destroying the right subtree */
		ABPNodeDestroy (proot);	/* eliminar o elemento - releasing the element */
	}
}

/******************************************************************************/

int ABPEmpty (PtABPNode proot) /* Verifica se a arvore esta ou nao vazia. */
{
	Error = OK;
  return proot == NULL;
}

/******************************************************************************/

unsigned int ABPSize (PtABPNode proot)  /* c�lculo do n�mero de elementos recursiva - recursive number of nodes */
{
	if (proot == NULL) { Error = ABP_EMPTY; return 0; } /* arvore vazia - empty tree */
	else
	{
		Error = OK;
		return 1 + ABPSize (proot->PtLeft) + ABPSize (proot->PtRight);
	}
}

/******************************************************************************/

unsigned int ABPHeight (PtABPNode proot)
{
	unsigned int LeftHeight, RightHeight;

	if (proot == NULL) { Error = ABP_EMPTY; return 0; } /* no externo no n�vel 0 */
	else
	{
		LeftHeight = ABPHeight (proot->PtLeft);	/* subarvore esquerda */
		RightHeight = ABPHeight (proot->PtRight);	/* subarvore direita */

		Error = OK;
		if (LeftHeight > RightHeight) return LeftHeight + 1;
		else return RightHeight + 1;
	}
}

/******************************************************************************/

int ABPSearch (PtABPNode proot, int pelem)
{
    if (proot == NULL) { Error = ABP_EMPTY; return 0; }

    if (SearchRec (proot, pelem) == NULL) { Error = NO_ELEM; return 0; }
    else { Error = OK; return 1; }
}

/******************************************************************************/

PtABPNode ABPMinRec (PtABPNode proot)  /* pesquisa de m�nimo recursiva - recursive minimum search */
{
	Error = OK;
	if (proot == NULL) { Error = ABP_EMPTY; return NULL; }
	else if (proot->PtLeft == NULL) return proot;
			else return ABPMinRec (proot->PtLeft);
}

/******************************************************************************/

PtABPNode ABPMaxRec (PtABPNode proot)  /* pesquisa de m�ximo recursiva - recursive maximum search */
{
	Error = OK;
	if (proot == NULL) { Error = ABP_EMPTY; return NULL; }
	else if (proot->PtRight == NULL) return proot;
			else return ABPMaxRec (proot->PtRight);
}

/******************************************************************************/

PtABPNode ABPMinRep (PtABPNode proot)  /* pesquisa de m�nimo repetitiva - repetitive minimum search */
{
	if (proot == NULL) { Error = ABP_EMPTY; return NULL; }

	Error = OK;
	while (proot->PtLeft != NULL) proot = proot->PtLeft;
	return proot;
}

/******************************************************************************/

PtABPNode ABPMaxRep (PtABPNode proot)  /* pesquisa de m�ximo repetitiva - repetitive maximum search */

{
	if (proot == NULL) { Error = ABP_EMPTY; return NULL; }

	Error = OK;
	while (proot->PtRight != NULL) proot = proot->PtRight;
	return proot;
}

/******************************************************************************/

int ABPElement (PtABPNode pnode) /* obtem o elemento armazenado em pnode */
{
    if (pnode == NULL) { Error = NULL_PTR; return 0; }
    Error = OK;
    return pnode->Elem;
}

/******************************************************************************/

PtABPNode ABPKMin (PtABPNode proot, unsigned int pk)
{
	if (proot == NULL) { Error = ABP_EMPTY; return NULL; }
	/* K inv�lido ou arvore com menos elementos do que K - invalid k or tree with less elemenst */
	if (pk < 1 || ABPSize (proot) < pk) { Error = NO_ELEM; return NULL; }
	else { Error = OK; return KMinRec (proot, pk); }
}

/******************************************************************************/

void ABPInsertRec (PtABPNode *proot, int pelem)  /* inser��o recursiva - recursive insertion */
{
	Error = OK;

	if (*proot == NULL)	/* inserir o elemento - inserting the element */
	{ if ((*proot = ABPNodeCreate (pelem)) == NULL) return; }
	else if ((*proot)->Elem > pelem)	/* subarvore esquerda - left subtree */
				ABPInsertRec (&(*proot)->PtLeft, pelem);
			else if ((*proot)->Elem < pelem)	/* subarvore direita - right subtree */
						ABPInsertRec (&(*proot)->PtRight, pelem);
					else { Error = REP_ELEM; return; }	/* o elemento j� existe - element already exists */
}

/******************************************************************************/

void ABPInsertRep (PtABPNode *proot, int pelem)	/* inser��o repetitiva - repetitive insertion */
{
	PtABPNode Node = *proot, Prev = NULL;

    /* arvore vazia no colocado na raiz desta arvore - empty tree inserting the element */
	if (*proot == NULL) { *proot = ABPNodeCreate (pelem); return; }

	while (Node != NULL)	/* travessia at� ao local de inser��o - traversal looking for the insertion point */
	{
		Prev = Node;
		if (Node->Elem > pelem) Node = Node->PtLeft;
		else if (Node->Elem < pelem) Node = Node->PtRight;
				else { Error = REP_ELEM; return; }	/* repetido n�o � inserido - already exists not inserted */
	}
				/* inserir folha � esquerda ou � direita - inserting the leave to the right or the left */
	if (Prev->Elem > pelem) Prev->PtLeft = ABPNodeCreate (pelem);
	else Prev->PtRight = ABPNodeCreate (pelem);
}

/******************************************************************************/

void ABPDeleteRec (PtABPNode *proot, int pelem)	/* remo��o recursiva - recursive deletion */
{
	Error = OK;
	if (*proot == NULL) { Error = NO_ELEM; return; }	/* arvore vazia ou elemento inexistente - empty tree or non existing element */

	if ((*proot)->Elem > pelem)
			ABPDeleteRec (&(*proot)->PtLeft, pelem);
	else if ((*proot)->Elem < pelem)
				ABPDeleteRec (&(*proot)->PtRight, pelem);
			else NodeDelete (proot);	/* eliminar o elemento - deleting the element */
}

/******************************************************************************/

void ABPDeleteRep (PtABPNode *proot, int pelem)	/* remo��o repetitiva - repetitive deletion */
{
	PtABPNode Del = *proot, Prev = NULL, Node, Temp, PrevTemp;

	if (*proot == NULL) { Error = ABP_EMPTY; return; }	/* arvore vazia - empty tree */
	while (Del != NULL && Del->Elem != pelem)
	{	/* travessia at� encontrar o elemento a remover - traversal looking for the deletion point */
		Prev = Del;
		if (Del->Elem > pelem) Del = Del->PtLeft;
		else Del = Del->PtRight;
	}

	if (Del == NULL) { Error = NO_ELEM; return; }	/* elemento inexistente na arvore - element does ot exist */
	Node = Del;

	Error=OK;
	if (Node->PtRight == NULL) Node = Node->PtLeft;	/* � esquerda - to the left */
	else	if (Node->PtLeft == NULL) Node = Node->PtRight;	/* � direita - to the right */
			else	/* com subarvores esquerda e direita - with both subtrees */
			{	/* procurar menor elemento da subarvore direita - search for the minimum element in the right subtree */
				Temp = Node->PtRight; PrevTemp = Node;
				while (Temp->PtLeft != NULL)
				{ PrevTemp = Temp; Temp = Temp->PtLeft; }

				Node->Elem = Temp->Elem;	/* substituir pelo menor elemento - replacing by the minimum element */
					/* deslig�-lo e ajustar as liga��es - disconnected it and adjusting the links */
				if (PrevTemp == Node) PrevTemp->PtRight = Temp->PtRight;
				else PrevTemp->PtLeft = Temp->PtRight;
				ABPNodeDestroy (&Temp); return;
			}
	/* ajustar o pai do elemento removido que s� tem um filho - adjusting the father of the deleted element when it has just a son */
	if (Del == *proot) *proot = Node;	/* se foi eliminado da raiz - if deletion is from the root */
	else	if (Prev->PtLeft == Del) Prev->PtLeft = Node;
			else Prev->PtRight = Node;
	ABPNodeDestroy (&Del);
}

/******************************************************************************/

PtABPNode ABPCreateFile (char *nomef)
{
    PtABPNode ABP; FILE *PtF; unsigned int NElem, I, Elem;

    /* abertura com validacao do ficheiro para leitura - opening the text file for reading */
    if ( (PtF = fopen (nomef, "r")) == NULL) { Error = NO_FILE; return NULL; }

    ABP = ABPCreate ();    /* cria��o da arvore - creting the empty tree */

    /* leitura do n�mero de elementos da arvore do ficheiro - reading the number of elements from the text file */
    fscanf (PtF, "%u", &NElem);
    if (NElem < 1) { Error = OK; fclose (PtF); return NULL; }

    /* leitura dos valores do ficheiro e carregamento da ABP */
    /* reading the elements from the text file and inserting them on the BST */
    for (I = 0; I < NElem; I++)
    {
        fscanf (PtF, "%d", &Elem);
        ABPInsertRec (&ABP, Elem);
        if (ABPErrorCode () == NO_MEM)
        { ABPDestroy (&ABP); Error = NO_MEM; return NULL; }
    }

    fclose (PtF);  /* fecho do ficheiro - closing the text file */

    Error = OK;
    return ABP;  /* devolve a arvore criada - returning the new tree */
}
/******************************************************************************/

void ABPStoreFile (PtABPNode proot, char *nomef)
{
    FILE *PtF; unsigned int NElem;

    /* abertura com validacao do ficheiro para escrita - opening the text file for writing */
    if ((PtF = fopen (nomef, "w")) == NULL) { Error = NO_FILE; return ; }

    NElem = ABPSize (proot);
    /* escrita do n�mero de elementos da arvore no ficheiro - writing the tree's size */
    fprintf (PtF, "%u\n", NElem);

    /* escrita dos elementos da arvore no ficheiro - writing the tree's elements */
    StoreFilePreOrder (proot, PtF);

    fclose (PtF);  /* fecho do ficheiro - closing the text file */
    Error = OK;
}

/******************************************************************************/

void ABPPreOrderRec (PtABPNode proot)  /* travessia em pr�-ordem recursiva - recursive pre-order traversal */
{
	if (proot != NULL)
	{
		printf ("%d ", proot->Elem);	/* imprimir o elemento - printing the element */
		ABPPreOrderRec (proot->PtLeft);
		ABPPreOrderRec (proot->PtRight);
	}
}

/******************************************************************************/

void ABPInOrderRec (PtABPNode proot)  /* travessia em ordem recursiva - recursive in-order traversal */
{
	if (proot != NULL)
	{
		ABPInOrderRec (proot->PtLeft);
		printf ("%d ", proot->Elem);	/* imprimir o elemento - printing the element */
		ABPInOrderRec (proot->PtRight);
	}
}

/******************************************************************************/

void ABPPostOrderRec (PtABPNode proot)  /* travessia em p�s-ordem recursiva - recursive post-order traversal */
{
	if (proot != NULL)
	{
		ABPPostOrderRec (proot->PtLeft);
		ABPPostOrderRec (proot->PtRight);
		printf ("%d ", proot->Elem);	/* imprimir o elemento - printing the element */
	}
}

/******************************************************************************/

unsigned int ABPSizeRep (PtABPNode proot)  /* c�lculo do n�mero de elementos repetitiva - repetitive number of nodes */
{
	PtABPNode Node = proot; PtStack Stack; unsigned int Number = 0;

	if (proot == NULL) { Error = ABP_EMPTY; return 0;	} /* arvore vazia - empty tree */

	if ((Stack = StackCreate (sizeof (PtABPNode))) == NULL) { Error = NO_MEM ; return 0; }
	StackPush (Stack, &Node);	/* armazenar a raiz - storing the root */

	while (!StackIsEmpty (Stack))	/* enquanto existirem nos - while there are nodes */
	{
		StackPop (Stack, &Node);	/* recuperar o no - retrieve the node */
		Number++;	/* contar o no - counting the node */

		/* armazenar a raiz da subarvore esquerda - storing the left subtree root */
		if (Node->PtLeft != NULL) StackPush (Stack, &Node->PtLeft);

		/* armazenar a raiz da subarvore direita - storing the right subtree root */
		if (Node->PtRight != NULL) StackPush (Stack, &Node->PtRight);
	}

	StackDestroy (&Stack);	/* destruir a pilha - releasing the stack */

    Error = OK;
	return Number;
}

/******************************************************************************/

void ABPPreOrderRep (PtABPNode proot)  /* travessia em pr�-ordem repetitiva - repetitive pre-order traversal */
{
	PtABPNode Node = proot; PtStack Stack;

	if (proot == NULL) { Error = ABP_EMPTY; return;	} /* arvore vazia - empty tree */
	if ((Stack = StackCreate (sizeof (PtABPNode))) == NULL) { Error = NO_MEM ; return; }

	StackPush (Stack, &Node);	/* armazenar a raiz - storing the root */
	while (!StackIsEmpty (Stack))	/* enquanto existirem nos - while there are nodes */
	{
		StackPop (Stack, &Node);	/* recuperar o no - retrieve the node */
		printf ("%d ", Node->Elem);	/* imprimir o elemento - printing the element */

				/* colocar a raiz da subarvore direita, caso exista - storing the right subtree root if it exists */
		if (Node->PtRight != NULL) StackPush (Stack, &Node->PtRight);

				/* colocar a raiz da subarvore esquerda, caso exista - storing the left subtree root if it exists */
		if (Node->PtLeft != NULL) StackPush (Stack, &Node->PtLeft);
	}

	StackDestroy (&Stack);	/* destruir a pilha - releasing the stack */
    Error = OK;
}

/******************************************************************************/

void ABPInOrderRep (PtABPNode proot)  /* travessia em in-ordem repetitiva - repetitive in-order traversal */
{
	PtABPNode Node = proot; PtStack Stack;

	if (proot == NULL) { Error = ABP_EMPTY; return;	} /* arvore vazia - empty tree */
	if ((Stack = StackCreate (sizeof (PtABPNode))) == NULL) { Error = NO_MEM ; return; }
	StackPush (Stack, &Node);	/* armazenar a raiz - storing the root */

	while (!StackIsEmpty (Stack))
	{
		if (Node != NULL)	/* n�o � um no externo - not an external node */
		{
			Node = Node->PtLeft;
			StackPush (Stack, &Node);	/* subarvore esquerda - left subtree */
		}
		else	/* � um no externo */
		{
			StackPop (Stack, &Node);	/* retirar e descartar o no externo - retrieve and ignore the external node */
			if (!StackIsEmpty (Stack))
			{
				StackPop (Stack, &Node);	/* recuperar o no anterior - retrieve and preview node */
				printf ("%d ", Node->Elem);	/* imprimir o elemento - printing the element */
				Node = Node->PtRight;	/* subarvore direita - right subtree */
				StackPush (Stack, &Node);
			}
		}
	}

	StackDestroy (&Stack);	/* destruir a pilha - releasing the stack */
    Error = OK;
}

/******************************************************************************/

void ABPPostOrderRep (PtABPNode proot)  /* travessia em p�s-ordem repetitiva - repetitive post-order traversal */
{
	PtABPNode Node = proot, Last = proot; PtStack Stack;

	if (proot == NULL) { Error = ABP_EMPTY; return;	}	/* arvore vazia - empty tree */
	if ((Stack = StackCreate (sizeof (PtABPNode))) == NULL) { Error = NO_MEM ; return; }

	while (1)	/* enquanto houver elementos para visitar - while there are nodes */
	{
			/* travessia pela esquerda at� atingir a folha mais � esquerda - left traversal until the left most leaf */
		while (Node->PtLeft != NULL)
		{ StackPush (Stack, &Node); Node = Node->PtLeft; }

		/* se n�o tem subarvore direita ou j� completou a sua travessia - without right subtree or already completed the traversal */
		while (Node->PtRight == NULL || Node->PtRight == Last)
		{
			printf ("%d ", Node->Elem);	/* imprimir o elemento - printing the element */
			Last = Node;	/* assinalar �ltimo elemento visitado - marking the last visited element */
					/* terminar quando n�o h� mais elementos na pilha - terminate when there are no more elments in the stack */
			if (StackIsEmpty (Stack)) { StackDestroy (&Stack); Error = OK; return; }

			StackPop (Stack, &Node);	/* retirar o elemento anterior - retrieve the preview element */
		}

		StackPush (Stack, &Node);	/* recolocar o elemento na pilha - restore the element in the stack */
		Node = Node->PtRight;	/* iniciar travessia da subarvore direita - start the right subtree traversal */
	}
}

/******************************************************************************/

void ABPByLevel (PtABPNode proot) /* travessia por niveis - traversal by levels */
{
	PtABPNode Node = proot; PtQueue Queue;

	if (proot == NULL) { Error = ABP_EMPTY; return;	}	/* arvore vazia - empty tree */
	if ((Queue = QueueCreate (sizeof (PtABPNode))) == NULL) { Error = NO_MEM ; return; }

	QueueEnqueue (Queue, &Node);	/* armazenar a raiz - storing the root */

	while (!QueueIsEmpty (Queue))
	{
		QueueDequeue (Queue, &Node);	/* retirar o no - retrieve the node */
		printf ("%d ", Node->Elem);	/* imprimir o elemento - printing the element */

		/* armazenar a raiz da subarvore esquerda - storing the left subtree root */
		if (Node->PtLeft != NULL) QueueEnqueue (Queue, &Node->PtLeft);

		/* armazenar a raiz da subarvore direita - storing the right subtree root */
		if (Node->PtRight != NULL) QueueEnqueue (Queue, &Node->PtRight);
	}

	QueueDestroy (&Queue);	/* destruir a fila - releasing the queue */
    Error = OK;
}

/******************************************************************************/

PtABPNode ABPBalance (PtABPNode proot)
{
	int *List; PtABPNode NewABP = NULL;
	unsigned int Count = 0, n = ABPSize (proot);	/* n�mero de nos - number of nodes */

	if (proot == NULL) { Error = ABP_EMPTY; return NULL; }	/* a arvore est� vazia - empyt tree */
				/* criar a sequ�ncia - creating the array */
	if ((List = (int *) calloc (n, sizeof (int))) == NULL) { Error = NO_MEM ; return NULL; }

    Error = OK;
	ListInOrder (proot, List, &Count);	/* preencher a sequ�ncia - filling the array */
	Balance (&NewABP, List, 0, n-1);	/* balancear a arvore - balancing the tree */
	free (List);	/* libertar a sequ�ncia - releasing the array */

	return NewABP;
}

/******************************************************************************/

void ABPDisplay (PtABPNode proot)
{
    if (proot == NULL)
    { Error = ABP_EMPTY; return; }

    Display (proot, 1);
    Error = OK;
}

/******************************************************************************/

PtABPNode ABPCopy (PtABPNode proot)
{
    PtABPNode Copy;

    Error = OK;
    if (proot == NULL) return NULL;

    Copy = CopyRec (proot);
    if (Error) ABPDestroy (&Copy);

    return Copy;
}

/*********************************** Aula 9 ***********************************/

void ABPDeleteMin (PtABPNode *proot)
{
  if (*proot == NULL) { Error = ABP_EMPTY; return; }	/* arvore vazia - empty tree */
  if((*proot)->PtLeft != NULL){ ABPDeleteMin(&(*proot)->PtLeft); }
	else{ NodeDelete(proot); }
	Error = OK;
}

void ABPDeleteMax (PtABPNode *proot)
{
  if (*proot == NULL) { Error = ABP_EMPTY; return; }	/* arvore vazia - empty tree */
  PtABPNode aux01 = *proot, aux02, aux03;

	while(temp->PtRight != NULL){
		aux02 = aux01;
		aux01 = aux01->PtRight;
	}

	aux03 = aux01;
	Error = OK;

	if(aux03->PtLeft != NULL){ aux03 = aux03->PtLeft; }
	else { aux03 = NULL; }

	if(aux01 == *proot) *proot = aux03;
	else aux02->PtRight = aux03;
	ABPNodeDestroy(&aux01);
}

PtABPNode ABPFloorValue (PtABPNode proot, int pvalue)
{
  if (proot == NULL) { Error = ABP_EMPTY; return NULL; }
	else if ( proot->Elem == pvalue ) {
		Error = OK;
		return proot;
	}
	else {
		PtABPNode aux = proot;
		while(aux != NULL) {
			if ( pvalue < aux->Elem ) {
				aux = aux->PtLeft;
				if ( aux != NULL && pvalue >= aux->Elem ) {
					Error = OK;
					return aux;
				}
			}
			else {
				aux = aux->PtRight;
				if ( aux != NULL && pvalue >= aux->Elem ) {
					Error = OK;
					return aux;
				}
			}
		}
		Error = ABP_EMPTY;
		return aux;
	}
}

PtABPNode ABPCeilValue (PtABPNode proot, int pvalue)
{
  if (proot == NULL) { Error = ABP_EMPTY; return NULL; }
	if (proot->Elem == pvalue) {
		Error = OK;
		return proot;
	}
	if (pvalue < proot->Elem) {
		PtABPNode temp = ABPCeilValue(proot->PtLeft,pvalue);
		if (temp != NULL) {
			Error = OK;
			return temp;
		} else {
			Error = OK;
			return proot;
		}
	}
	Error = OK;
	return ABPCeilValue( proot->PtRight,pvalue );
}

int ABPRank (PtABPNode proot, int pvalue)
{
  if (proot == NULL) { Error = ABP_EMPTY; return 0; }

	if (pvalue < proot->Elem) {
		int res = ABPRank (proot->PtLeft,pvalue);
		Error = OK;
		return res;
	} else if (pvalue > proot->Elem) {
		int res = 1 + ABPSize (proot->PtLeft) + ABPRank (proot->PtRight,pvalue);
		Error = OK;
		return res;
	} else {
		int res = ABPSize (proot->PtLeft);
		Error = OK;
		return res;
	}
}

void ABPElements (PtABPNode proot, PtQueue pqueue, int plow, int phigh)
{
  if (pqueue == NULL) { Error = NO_MEM ; return; }
	if (proot == NULL) { Error = ABP_EMPTY; return;	}
	if(plow > phigh){Error = INVALID; return;}

  if( proot->Elem >= plow && proot->Elem <= phigh ) {
    	ABPElements(proot->PtLeft,pqueue, plow, phigh);
  		ABPElements(proot->PtRight,pqueue, plow, phigh);
  		Error = OK;
      QueueEnqueue(pqueue,&proot->Elem);
  } else {
    if( proot->Elem >= plow ) { Error = OK; ABPElements (proot->PtLeft,pqueue, plow, phigh); }
    if( proot->Elem <= phigh ) { Error = OK; ABPElements (proot->PtRight,pqueue, plow, phigh); }
  }
}

int ABPIsEvenOdd (PtABPNode proot)
{
  PtABPNode Node = proot; PtStack Stack;
  int prevPair = -1;
  int presPair;
  int res = 1;

  if (proot == NULL) { Error = ABP_EMPTY; return 0;	} /* arvore vazia - empty tree */
  if ((Stack = StackCreate (sizeof (PtABPNode))) == NULL) { Error = NO_MEM ; return 0; }
  StackPush (Stack, &Node);	/* armazenar a raiz - storing the root */

  while (!StackIsEmpty (Stack))
  {
    if (Node != NULL)	/* n�o � um no externo - not an external node */
    {
      Node = Node->PtLeft;
      StackPush (Stack, &Node);	/* subarvore esquerda - left subtree */
    }
    else	/* � um no externo */
    {
      StackPop (Stack, &Node);	/* retirar e descartar o no externo - retrieve and ignore the external node */
      if (!StackIsEmpty (Stack))
      {
        StackPop (Stack, &Node);	/* recuperar o no anterior - retrieve and preview node */
        if(Node->Elem % 2 == 0){
          presPair = 1;
        }
        else
          presPair = 0;
        if(prevPair >= 0){
          if(prevPair == presPair){
            res = 0;
            break;
          }
        }
        prevPair = presPair;
        Node = Node->PtRight;	/* subarvore direita - right subtree */
        StackPush (Stack, &Node);
      }
    }
  }

  StackDestroy (&Stack);	/* destruir a pilha - releasing the stack */
  Error = OK;
  return res;

}

/******************************************************************************/

/************************* Fun��es internas auxiliares ************************/

/*******************************************************************************
  Fun��o que cria o no compacto da arvore bin�ria de pesquisa.

  Function that allocates the dynamic memory for the binary search tree node.
*******************************************************************************/
static PtABPNode ABPNodeCreate (int pelem)	/* aloca��o do no - node allocation */
{
	PtABPNode Node;

	if ((Node = (PtABPNode) malloc (sizeof (struct abpnode))) == NULL)
	{ Error = NO_MEM; return NULL; }

	Node->Elem = pelem;	/* copiar o elemento  - copies the element */
	Node->PtLeft = NULL;	/* apontar para a esquerda para NULL  - empty left subtree */
	Node->PtRight = NULL;	/* apontar para a direita para NULL - empty right subtree */

	Error=OK;
	return Node;
}

/*******************************************************************************
  Fun��o que liberta a memoria do no compacto da arvore bin�ria de pesquisa.

  Function that frees the dynamic memory of the binary search tree node.
*******************************************************************************/
static void ABPNodeDestroy (PtABPNode *pelem)	/* liberta��o do no - node deallocation */
{
	free (*pelem);	/* liberta��o do no - frees the node */
	*pelem = NULL;	/* colocar o ponteiro a nulo - pointing to null */
}

/*******************************************************************************
  Fun��o recursiva que pesquisa o elemento pretendido na arvore.

  Recursive function that searches the given element in a tree.
*******************************************************************************/
static PtABPNode SearchRec (PtABPNode proot, int pelem)   /* pesquisa recursiva - recursive search */
{
	if (proot == NULL) return NULL;	/* pesquisa sem sucesso - search without success */

	if (proot->Elem == pelem) return proot;	/* pesquisa com sucesso - search with success */
	else	if (proot->Elem > pelem)
				return SearchRec (proot->PtLeft, pelem);
			else	return SearchRec (proot->PtRight, pelem);
}

/*******************************************************************************
  Fun��o repetitiva que pesquisa o elemento pretendido na arvore.

  Repetitive function that searches the given element in a tree.
*******************************************************************************/
static PtABPNode SearchRep (PtABPNode proot, int pelem)  /* pesquisa repetitiva - repetitive search */
{
	while (proot != NULL && proot->Elem != pelem)
		if (proot->Elem > pelem) proot = proot->PtLeft;
		else proot = proot->PtRight;

	return proot;	/* devolver o resultado da pesquisa - returns the result of the search */
}

/*******************************************************************************
  Fun��o recursiva que pesquisa o K-menor elemento da arvore.

  Recursive function that selects the K-minimum element of the tree.
*******************************************************************************/
static PtABPNode KMinRec (PtABPNode proot, unsigned int pk)
{
	unsigned int NLeft = ABPSize (proot->PtLeft);

	if (pk == NLeft+1) return proot;
	else	if (pk <= NLeft) return KMinRec (proot->PtLeft, pk);
			else return KMinRec (proot->PtRight, pk-NLeft-1);
}

/*******************************************************************************
  Fun��o que remove efectivamente um no da arvore.

  Function that efectively deletes the node.
*******************************************************************************/
static void NodeDelete (PtABPNode *proot)
{
	PtABPNode Node = *proot;

	if ((*proot)->PtLeft == NULL && (*proot)->PtRight == NULL)
			ABPNodeDestroy (proot);	/* eliminar o elemento que � uma folha - deleting a leaf node */
	else if ((*proot)->PtLeft == NULL)	/* com subarvore direita - with right subtree only */
			{
				*proot = (*proot)->PtRight;	/* ligar � direita - connect to the right subtree */
				ABPNodeDestroy (&Node);	/* eliminar o elemento - deleting the node */
			}
			else if ((*proot)->PtRight == NULL)	/* com subarvore esquerda - with left subtree only */
					{
						*proot = (*proot)->PtLeft;	/* ligar � esquerda - connect to the left subtree */
						ABPNodeDestroy (&Node);	/* eliminar o elemento - deleting the node */
					}
					else	/* com subarvores direita e esquerda - with both right and left subtrees */
					{	/* substituir pelo menor elemento da subarvore direita - replacing by the minimum element of the right subtree */
						(*proot)->Elem = FindMin ((*proot)->PtRight);
						/* remover o menor elemento da subarvore direita - deleting the minimum element of the right subtree */
						ABPDeleteRec (&(*proot)->PtRight, (*proot)->Elem);
					}
}

/*******************************************************************************
  Fun��o repetitva que pesquisa o no minimo que se encontra na arvore a
  partir do no indicado.

  Repetitive function that searches the minimum element of a tree that starts in
  the given node.
*******************************************************************************/
static int FindMin (PtABPNode proot)
{
	PtABPNode Node = proot;

	while (Node->PtLeft != NULL) Node = Node->PtLeft;

	return Node->Elem;	/* devolve um ponteiro para o elemento - returns the pointer to the minimum element */
}

/*******************************************************************************
  Fun��o recursiva que escreve os elementos da arvore em pre-ordem num ficheiro.

  Recursive function that makes a pre-order traversal of the tree and writes its
  elements in a text file.
*******************************************************************************/
static void StoreFilePreOrder (PtABPNode abp, FILE *fich)
{
    if (abp != NULL)
    {
        fprintf (fich, "%d\n", abp->Elem);  /* escreve o elemento no ficheiro - writes the element in the file */

        StoreFilePreOrder (abp->PtLeft, fich);  /* arvore esquerda - left subtree */
        StoreFilePreOrder (abp->PtRight, fich);  /* arvore direita - right subtree */
    }
}

/*******************************************************************************
  Fun��o recursiva que armazena os elementos da arvore em ordem num array.

  Recursive function that makes a in-order traversal of the tree and stores its
  elements in an array.
*******************************************************************************/
static void ListInOrder (PtABPNode proot, int plist[], unsigned int *pcount)
{
	if (proot != NULL)
	{
		ListInOrder (proot->PtLeft, plist, pcount);	 /* arvore esquerda - left subtree */
		plist[(*pcount)++] = proot->Elem;  /* coloca o elemento no array - stores the element in the array */
		ListInOrder (proot->PtRight, plist, pcount);  /* arvore direita - right subtree */
	}
}

/*******************************************************************************
  Fun��o recursiva que insere os elementos de uma lista numa arvore vazia de modo
  que ela fique balanceada.

  Recursive function that inserts an ordered array of elements in a tree in order
  that the is built a balanced tree.
*******************************************************************************/
static void Balance (PtABPNode *proot, int plist[], int pbegin, int pend)
{
	unsigned int Median;

	if (pbegin <= pend)
	{
		Median = (pbegin + pend) >> 1;	/* (pbegin+pend)/2 - calculating the middle position */
		ABPInsertRec (proot, plist[Median]);	/* inserir elemento central - insert the central element */
		Balance (proot, plist, pbegin, Median-1);	/* subarvore esquerda - left subtree */
		Balance (proot, plist, Median+1, pend);	/* subarvore direita - right subtree */
	}
}

/*******************************************************************************
  Fun��o recursiva que escreve os elementos da arvore de forma hierarquica.

  Recursive function that prints the tree elements in a hierarchical way.
*******************************************************************************/
static void Display (PtABPNode proot, unsigned int plevel)
{
	unsigned int i;

	if (proot == NULL)
	{
		for (i = 0; i < plevel; i++) printf ("\t");
		printf ("*\n");
        return;
	}

	Display (proot->PtRight, plevel+1);

	for (i = 0; i < plevel; i++) printf ("\t");

	printf ("%d\n", proot->Elem);	/* imprimir o elemento - printing the element */

	Display (proot->PtLeft, plevel+1);
}

/*******************************************************************************
  Fun��o recursiva que copia uma arvore. Recursive function that copies a tree.
*******************************************************************************/
static PtABPNode CopyRec (PtABPNode proot)
{
    PtABPNode Node;

    if (proot == NULL) return NULL;

    if ((Node = ABPNodeCreate (proot->Elem)) == NULL) return NULL;

    if (proot->PtLeft != NULL) Node->PtLeft = CopyRec (proot->PtLeft);
    if (!Error && proot->PtRight != NULL) Node->PtRight = CopyRec (proot->PtRight);

    return Node;
}
