/*
 * Archivo: list.h
 *
 * Descripcion: Archivo de cabecera para las estructuras de datos list y node.
 *
 * Autor: Cesar Alfonso Rosario Escobar
 */

#ifndef __LIST__ 
#define __LIST__

/*Tipo: node
 *------------
 *	Tipo para manejar a los elementos de una lista de frecuencia de palabras	
 *
 *	word: palabra asociada con el nodo
 *	frequency: frecuencia de la palabra en la lista
 *	next: apuntador al elemento siguiente 
 *	prev: apuntador al elemento anterior
 */
typedef struct list_element{
	/*se define el struct "list_element" para poder referenciarlo dentro de si mismo*/
	char *word; 
	int frequency; 
	struct list_element *next; 
	struct list_element *prev;
} node; 


/*Funcion: nodeInit
 *------------
 *	Inicializa un elemento de lista
 *	
 *	e: apuntador al elemento a inicializar
 *	c: cadena de caracteres a insertar
 */
void nodeInit(node *e, char *c, int f);


/*Funcion: nodeSwap
 *------------
 *	Cambia los valores de los atributos "word" y "frequency" entre dos nodos
 *
 * 	u,v: apuntadores a los nodos a intercambiar.
 */
void nodeSwap(node *u, node *v);

/*  Funcion: nodeCompare
 *  --------------
 *	Compara si un nodo es mayor a otro en funcion de su frecuecia y orden 
 *  alfanumerico.
 *
 *	a: apuntador a un nodo.
 *  b: apuntador a un nodo.
 * 
 *  return: 1 si a > b. -1 si a < b. 0 si a = b.
 */
int nodeCompare(node *a, node *b);

/*Tipo: list
 *------------
 *	Tipo definido para manejar la estructura lista
 *
 *	head: cabecera de la lista
 *	tail: cola de la lista
 *	size: tamano de la lista
 */
typedef struct {
	node *head, *tail; 
	int size;
} list;


/*Funcion: listInit
 *------------
 *	Inicializa una lista
 *
 *	l: apuntador a la lista a inicializar
 */
void listInit(list *l);


/*Funcion: listSearch
 *------------
 *	Busca un elemento en una lista dada
 *
 *	l: apuntador a la lista en donde se realizara la busqueda
 *	e: apuntador al elemento a buscar
 *
 *	retorna: Si encuentra el elemento devuelve un apuntador a el, de lo contrario
 *	retorna NULL
 */
node* listSearch(list *l, node *e);


/*Funcion: listInsert
 *------------
 *	Inserta, o aumenta la frecuencia de un elemento en la lista
 *
 *	l: apuntador a la lista en donde se insertara el elemento
 *	e: apuntador al elemento a insertar
 *
 *	retorna: Un entero que representa si el elemento fue insertado, o se aumento su
 *	frecuencia
 */
int listInsert(list *l, node *e);

/*Funcion: listInsertBetween
 * ------------
 *	Inserta un elemento en una posicion especifica de la lista. 
 *
 *	l: apuntador a la lista en donde se insertara el elemento.
 *  p: apuntador al elemento padre del elemento a insertar.
 *	e: apuntador al elemento a insertar.
 *
 *	retorna: void
 */
void listInsertBetween(list *l, node *p, node *e);

/*Funcion: listSort
 * ------------
 *	Ordena los elementos de la lista por frecuencia 
 *
 *	l: apuntador a la lista a ordenar
 */
void listSort(list *l);

/*  Funcion: listMerge
 *  --------------
 *	Convina de forma ordenada dos listas.
 *
 *	list_a: Lista de palabras con orden alfanumerico y por frecuencia.
 *  list_b: Lista de todas las palabras con orden alfanumerico y por frecuencia.
 * 
 *  return: void.
 */
void listMerge(list *list_a, list *list_b);

/*Funcion: listPrint
 *------------
 *	Imprime en consola el contenido de la lista
 *
 * 	l: lista a imprimir
 */
void listPrint(list *l);


	/*###*/
void pipeList(list *l);

	/*###*/
void listDestroy(list *l);
#endif
