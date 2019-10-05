
#ifndef __LIST__ 
#define __LIST__

/*Tipo: node
 *------------
 *	Tipo para manejar a los elementos de una lista de frecuencia de palabras	###
 *
 *	word: palabra asociada con el nodo
 *	frequency: frecuencia de la palabra en la lista
 *	next: apuntador al elemento siguiente 
 *	prev: apuntador al elemento anterior
 */
typedef struct list_element{ 
	char *word; 
	int frequency; 
	struct list_element *next; 
	struct list_element *prev;
} node; 


/*Funcion: listElInit
 *------------
 *	Inicializa un elemento de lista
 *	
 *	e: elemento a inicializar
 *	c: contenido del miembro de funcion "word"
 *
 *	retorna: ###
 */
void listElInit(node *e, char *c); 


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
 *	l: lista a inicializar
 *
 *	retorna:	###
 */
void listInit(list *l);  


/*Funcion: listSearch
 *------------
 *	Busca un elemento en una lista dada
 *
 *	l: lista en donde se realizara la busqueda
 *	e: elemento a buscar
 *
 *	retorna:	###
 */
int listSearch(list *l, node *e); 


/*Funcion: listInsert
 *------------
 *	Inserta un elemento en una lista
 *
 *	l: lista en donde se insertara el elemento
 *	e: elemento a insertar
 *
 *	retorna: 	###
 */
void listInsert(list *l, node *e);


/*Funcion: listSwap
 *------------
 *	Intercambia la posicion de dos elementos en una lista
 *
 *	l: lista a usar
 *	u: primer elemento 
 *	v: segundo elemento
 *
 *	retorna:	###
 */
void listSwap(list *l, node *u, node *v);


/*Funcion: listSort
 *------------
 *
 */
void listSort(list *l); 


/*Funcion: listPrint
 *------------
 *	Imprime en consola el contenido de la lista
 *
 * 	l: lista a imprimir
 *
 * 	retorna:	###
 */
void listPrint(list l);

#endif
