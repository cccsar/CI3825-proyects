/*
 * Archivo: singly.h 
 *
 * Descripcion:	Archivo de cabecera para la estructura singly.
 *
 * Autores:
 * 	Carlos Alejandro Sivira Munoz		15-11377
 * 	Cesar Alfonso Rosario Escobar		15-11295
 *
 */

#ifndef __SINGLY__
#define __SINGLY__


/* snode
 * --------------
 * Inicializa nodo de lista singly
 *
 * 	n_: apuntador al nodo a inicializar
 *	number: inodo que acompana al nodo
 */
typedef struct singly_node {
	struct singly_node *next; 
	int element; 
} snode;


/* singly 
 * --------------
 * Estructura singly
 *
 * 	lista simplemente enlazada	
 */
typedef struct {
	snode *head, *tail; 
	int size;
} singly;


/* snodeInit
 * --------------
 * Inicializa nodo de lista singly
 *
 * 	n_: apuntador al nodo a inicializar
 *	number: inodo que acompana al nodo
*/
void snodeInit(snode *n_, int number); 


/* singlyInit
 * --------------
 * Inicializa una lista singly
 *
 * 	l_: apuntador a una lista
 */
void singlyInit(singly *l_) ;


/* singlyDestroy
 * --------------
 * Libera la memoria de una lista singly
 *
 * 	l_: lista a destruir
 *
 */
void singlyDestroy(singly *l_) ;


/* singlyInsert
 * --------------
 * Inserta un nodo en una lista singly
 *
 * 	l_: apuntador a la lista en donde se insertara
 * 	n_: apuntador del nodo a insertar
 *
 */
void singlyInsert(singly *l_, snode *n_) ;


/* singlySearch
 * --------------
 * Revisa si un existe un nodo en la lista con un inodo asociado dado.
 *
 * 	l_: apuntador a la lista
 * 	number: inodo a consultar
 *
 */
int singlySearch(singly *l_, int number) ;

#endif
