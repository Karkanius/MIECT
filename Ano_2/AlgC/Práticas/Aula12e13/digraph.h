/*******************************************************************************

 Ficheiro de interface do Tipo de Dados Abstrato D�grafo/Grafo (digraph.h). A
 implementa��o tem capacidade de m�ltipla instancia��o, sendo providenciado um
 construtor para criar um grafo (0) /d�grafo (1) vazio. � da responsabilidade da
 aplica��o, invocar o destructor, para libertar a mem�ria atribu�da ao objecto.
 O m�dulo providencia um controlo de erro no retorno das opera��es.

 Autor : Ant�nio Manuel Adrego da Rocha    Data : Maio de 2015

 Interface file of the abstract data type Digraph/Graph (digraph.h). The
 implementation provides a constructor for creating an empty graph (0) /digraph (1).
 The application has the responsibility of calling the destructor to release the
 dynamic memory allocated to the digraph. The data-type has a control error
 mechanism, basead on the return value of the functions.

*******************************************************************************/
#include "queue.h"  /* interface da fila */

#ifndef _DIGRAPH_DYNAMIC
#define _DIGRAPH_DYNAMIC

/*********** Defini��o do Tipo Ponteiro para um D�grafo/Grafo **********/

typedef struct digraph *PtDigraph;

/********************* Defini��o de C�digos de Erro ********************/

#define	OK            0	  /* opera��o realizada com sucesso - operation with success */
#define	NO_DIGRAPH    1	  /* d�grafo/grafo inexistente - digraph/graph does not exist*/
#define	NO_MEM        2	  /* mem�ria esgotada - out of memory */
#define	NULL_PTR      3	  /* ponteiro nulo - null pointer */
#define	DIGRAPH_EMPTY 4	  /* d�grafo/grafo vazio - empty digraph/graph */
#define	NO_VERTEX     5	  /* v�rtice inexistente - vertex does not exist */
#define	REP_VERTEX    6	  /* v�rtice repetido - vertex already exists */
#define	NO_EDGE       7	  /* aresta inexistente - edge does not exist */
#define	REP_EDGE      8	  /* aresta repetida - edge already exists */
#define	NO_FILE       9   /* ficheiro inexistente - file does not exist */
#define	NO_DAG        10  /* d�grafo c�clico - acyclic digraph */
#define	NEG_CYCLE     11	/* d�grafo/grafo com ciclo negativo - digraph/graph with negative loop */
#define	NO_CONNECTED  12	/* grafo n�o conexo - not connected graph */
#define	NO_PATH       13	/* n�o existe caminho/circuito - path/cycle does not exist */
#define	SINK          14	/* v�rtice sumidouro - sink vertex */
#define	SOURCE        15	/* v�rtice fonte - source vertex */
#define	DISC          16	/* v�rtice desconexo - disconnected vertex */

/********************* Prot�tipos dos Subprogramas *********************/

PtDigraph Create (unsigned int ptype);
/*******************************************************************************
 Cria um d�grafo ou um grafo, caso ptype seja igual a, respetivamente, 1 ou 0.
 Devolve a refer�ncia do d�grafo/grafo criado ou NULL, no caso de inexist�ncia de
 mem�ria.

 Creates the empty digraph/graph, case ptype is respectively 1 or 0. Returns the
 reference to the new digraph/graph or NULL if there isn't enough memory.
*******************************************************************************/

int Destroy (PtDigraph *pdig);
/*******************************************************************************
 Destr�i o d�grafo/grafo pdig e coloca a refer�ncia a NULL. Valores de retorno:
 OK ou NO_DIGRAPH.

 Destroys the digraph/graph pdig and releases the memory. Returning error codes:
 OK or NO_DIGRAPH.
*******************************************************************************/

PtDigraph Copy (PtDigraph pdig);
/*******************************************************************************
 Copia o d�grafo/grafo pdig. Devolve a refer�ncia da c�pia ou NULL, caso n�o
 consiga fazer a c�pia por inexist�ncia de mem�ria ou do d�grafo/grafo pdig.

 Copies the digraph/graph pdig. Returns the reference to the new digraph/graph or
 NULL if there isn't enough memory or if pdig does not exist.
*******************************************************************************/

int InVertex (PtDigraph pdig, unsigned int pv);
/*******************************************************************************
 Insere o v�rtice pv, no d�grafo/grafo pdig. Valores de retorno: OK, NO_DIGRAPH
 ou REP_VERTEX.

 Inserts vertex pv in digraph/graph pdig. Returning error codes: OK, NO_DIGRAPH
 or REP_VERTEX.
*******************************************************************************/

int OutVertex (PtDigraph pdig, unsigned int pv);
/*******************************************************************************
 Retira o v�rtice pv, no d�grafo/grafo pdig. Retira tamb�m todas as suas arestas
 incidentes e emergentes. Valores de retorno: OK, NO_DIGRAPH, DIGRAPH_EMPTY ou
 NO_VERTEX.

 Deletes vertex pv from digraph/graph pdig and all its in and out edges.
 Returning error codes: OK, NO_DIGRAPH, DIGRAPH_EMPTY or NO_VERTEX.
*******************************************************************************/

int InEdge (PtDigraph pdig, unsigned int pv1, unsigned int pv2, int pcost);
/*******************************************************************************
 Insere a aresta pv1-pv2, com custo pcost, no d�grafo/grafo pdig. Valores de
 retorno: OK, NO_DIGRAPH, NO_VERTEX ou REP_EDGE.

 Inserts edge pv1-pv2 with cost pcost in digraph/graph pdig. Returning error codes:
 OK, NO_DIGRAPH, NO_VERTEX or REP_EDGE.
*******************************************************************************/

int OutEdge (PtDigraph pdig, unsigned int pv1, unsigned int pv2);
/*******************************************************************************
 Retira a aresta pv1-pv2 do d�grafo/grafo pdig. Valores de retorno: OK, NO_DIGRAPH,
 NO_VERTEX ou NO_EDGE.

 Deletes edge pv1-pv2 from digraph/graph pdig. Returning error codes: OK, NO_DIGRAPH,
 NO_VERTEX or NO_EDGE.
*******************************************************************************/

int Type (PtDigraph pdig, unsigned int *pty);
/*******************************************************************************
 Determina e coloca em pty o tipo do d�grafo/grafo pdig (d�grafo = 1/ grafo = 0).
 Valores de retorno: OK, NO_DIGRAPH ou NULL_PTR.

 Decide and stores in pty the type of the digraph/graph pdig (d�digraph = 1/
 graph = 0). Returning error codes: OK, NO_DIGRAPH or NULL_PTR.
*******************************************************************************/

int VertexNumber (PtDigraph pdig, unsigned int *pnv);
/*******************************************************************************
 Determina e coloca em pnv o n�mero de v�rtices do d�grafo/grafo pdig. Valores
 de retorno: OK, NO_DIGRAPH ou NULL_PTR.

 Decide and stores in pnv the number of vertexes of digraph/graph pdig.
 Returning error codes: OK, NO_DIGRAPH or NULL_PTR.
*******************************************************************************/

int EdgeNumber (PtDigraph pdig, unsigned int *pne);
/*******************************************************************************
 Determina e coloca em pne o n�mero de arestas do d�grafo/grafo pdig. Valores de
 retorno: OK, NO_DIGRAPH ou NULL_PTR.

 Decide and stores in pne the number of edges of digraph/graph pdig. Returning
 error codes: OK, NO_DIGRAPH or NULL_PTR.
*******************************************************************************/

int GetVertexList (PtDigraph pdig, unsigned int ppos, char *pvlist);
/*******************************************************************************
 Cria uma sequ�ncia de carateres com a informa��o do ppos v�rtice (1 <= ppos <= V),
 incluindo a sua lista de adjac�ncias, do d�grafo/grafo pdig. Esta opera��o �
 necess�ria para que uma aplica��o gr�fica possa fazer a escrita do d�grafo/grafo
 no monitor de forma controlada. Valores de retorno: OK, NO_DIGRAPH ou NULL_PTR.

 Creates a string with the information of vertex ppos (1 <= ppos <= V),
 including its edges list, of digraph/graph pdig. This operation is necessary
 in order that a graphical application pcan print the digraph/graph on the screen
 in a controlled way. Returning error codes: OK, NO_DIGRAPH or NULL_PTR.
*******************************************************************************/

PtDigraph CreateFile (char *pfilename);
/*******************************************************************************
 Cria um d�grafo/grafo com o conteudo do ficheiro pfilename. Devolve a refer�ncia
 do d�grafo/grafo criado ou NULL, no caso de inexist�ncia de mem�ria ou do ficheiro.

 Creates the digraph/graph from the file pfilename. Returns the reference to the
 new digraph/graph or NULL if there isn't enough memory or if the file does not exist.
*******************************************************************************/

int StoreFile (PtDigraph pdig, char *pfilename);
/*******************************************************************************
 Armazena o d�grafo/grafo pdig no ficheiro pfilename. Valores de retorno: OK,
 NO_DIGRAPH, DIGRAPH_EMPTY ou NO_FILE.

 Stores the digraph/graph pdig in file pfilename. Returning error codes: OK,
 NO_DIGRAPH, DIGRAPH_EMPTY or NO_FILE.
*******************************************************************************/

int VertexType (PtDigraph pdig, unsigned int pv);
/*******************************************************************************
 Determina de que tipo � o vertice pv. Valores de retorno: OK (vertice normal),
 NO_DIGRAPH, DIGRAPH_EMPTY, NO_VERTEX, SINK (vertice sumidouro), SOURCE (vertice
 fonte) ou DISC (vertice desconexo).

 Decide the type of vertex pv of digraph/graph pdig. Returning error codes:
 OK (normal vertex, NO_DIGRAPH, DIGRAPH_EMPTY, NO_VERTEX, SINK (sink vertex), SOURCE
 (source vertex) ou DISC (disconnected vertex).
*******************************************************************************/

int VertexOutDegreeCentrality (PtDigraph pdig, unsigned int pv, double *pcent);
/*******************************************************************************
 Determina a centralidade de v�rtices sucessores de um dado v�rtice, que � um
 valor real entre 0.0, quando o v�rtice n�o tem v�rtices adjacentes, e 1.0
 quando esse v�rtice tem todos os outros v�rtices do d�grafo como adjacentes.
 Valores de retorno: OK, NO_DIGRAPH, DIGRAPH_EMPTY, NO_VERTEX ou NULL_PTR.
*******************************************************************************/

int MaxOutDegreeCentrality (PtDigraph pdig, unsigned int *pv, double *pmax);
/*******************************************************************************
 Determina o v�rtice do d�grafo que tem a m�xima centralidade de v�rtices sucessores.
 Valores de retorno: OK, NO_DIGRAPH, DIGRAPH_EMPTY ou NULL_PTR.
*******************************************************************************/

int AverageSucessorOutDegree (PtDigraph pdig, unsigned int pv, double *pmsuc);
/*******************************************************************************
 Determina a m�dia do n�mero de sucessores dos v�rtices sucessores de um dado v�rtice.
 Valores de retorno: OK, NO_DIGRAPH, DIGRAPH_EMPTY, NO_VERTEX, NO_EDGE ou NULL_PTR.
*******************************************************************************/

int AllIsolates (PtDigraph pdig, PtQueue *pqueue);
/*******************************************************************************
 Cria uma fila contendo os v�rtices desconexos de um dado d�grafo. Valores de
 retorno: OK, NO_DIGRAPH, DIGRAPH_EMPTY, NULL_PTR ou NO_MEM.
*******************************************************************************/

int AllPredecessors (PtDigraph pdig, unsigned int pv, PtQueue *pqueue);
/*******************************************************************************
 Cria uma fila contendo os v�rtices predecessores de um dado v�rtice. Valores de
 retorno: OK, NO_DIGRAPH, DIGRAPH_EMPTY, NO_VERTEX, NULL_PTR ou NO_MEM.
*******************************************************************************/

int AllNonEdges (PtDigraph pdig, PtQueue *pqueue);
/*******************************************************************************
 Cria uma fila contendo os v�rtices desconexos de um dado d�grafo. Valores de
 retorno: OK, NO_DIGRAPH, DIGRAPH_EMPTY, NULL_PTR ou NO_MEM.
*******************************************************************************/

#endif
