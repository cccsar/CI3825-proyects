/*
 * Archivo: list.h
 *
 * Descripcion: Archivo de cabecera para las estructuras de datos list y node.
 *
 * Autor: Cesar Alfonso Rosario Escobar
 */

#include <semaphore.h> 

#ifndef __LIST__ 
#define __LIST__

/*Tipo: node
 *------------
 * Tipo para manejar a los elementos de una lista de frecuencia de palabras	
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


/*nodeInit
 *------------
 * Inicializa un elemento de lista
 *	
 *	e: apuntador al elemento a inicializar
 *	c: cadena de caracteres a insertar
 *	f: frecuencia inicial dada
 */
void nodeInit(node *e, char *c, int f);


/*nodeSwap
 *------------
 * Cambia los valores de los atributos "word" y "frequency" entre dos nodos
 *
 * 	u,v: apuntadores a los nodos a intercambiar.
 */
void nodeSwap(node *u, node *v);


/*list
 *------------
 * Tipo definido para manejar la estructura lista
 *
 *	head: cabecera de la lista
 *	tail: cola de la lista
 *	size: tamano de la lista
 */
typedef struct {
	node *head, *tail; 
	int size; 
} list;


/* listInit
 *------------
 * Inicializa una lista
 *
 *	l: apuntador a la lista a inicializar
 */
void listInit(list *l);


/*listSearch
 *------------
 * Busca un elemento en una lista dada
 *
 *	l: apuntador a la lista en donde se realizara la busqueda
 *	e: apuntador al elemento a buscar
 *
 * retorna: Si encuentra el elemento devuelve un apuntador a el, de lo contrario
 * retorna NULL
 */
node* listSearch(list *l, node *e);


/*listInsert
 *------------
 * Inserta, o aumenta la frecuencia de un elemento en la lista
 *
 *	l: apuntador a la lista en donde se insertara el elemento
 *	e: apuntador al elemento a insertar
 *
 * retorna: Un entero que representa si el elemento fue insertado, o se aumento su
 * frecuencia
 */
int listInsert(list *l, node *e);


/*listSort
 * ------------
 * Ordena los elementos de la lista por frecuencia 
 *
 *	l: apuntador a la lista a ordenar
 */
void listSort(list *l);


/*listPrint
 *------------
 *Imprime en consola el contenido de la lista
 *
 * 	l: lista a imprimir
 */
void listPrint(list *l_); 



/* listPrintRC
 * --------------
 * Imprime el contenido de una lista a un pipe asociado al stdin. Utiliza 
 * semaforos para evitar condicion de carrera durante la escritura
 *
 * 	l_: lista que se imprime
 * 	mutex: semaforo de exclusion mutua
 * 	reader: semaforo de acceso a escritores
 * 	writer: semaforo de acceso a lectores
 *
 */
void listPrintRC(list *l_, sem_t *mutex, sem_t *reader, sem_t *writer);



/* listDestroy
 * --------------
 * Libera la memoria ocupada por una lista.
 *
 * 	l_: lista a liberar
 */
void listDestroy(list *l_);

#endif
