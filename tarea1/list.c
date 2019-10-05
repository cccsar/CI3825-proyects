/*
 * Archivo: list.c
 *
 * Descripcion: Archivo fuente para las estructuras de datos list y node
 *
 * Autor: Cesar Alfonso Rosario Escobar
 */

#include <stdio.h>
#include <string.h>
#include "list.h"


/*Funcion: nodeInit
 * ------------
 *	Inicializa un elemento de lista, asignando los valores iniciales
 *	de sus atributos. 
 *
 *	e: elemento a inicializar
 *	c: contenido del miembro de funcion "word"
 */
void nodeInit(node *e, char* c) {
	e->next = NULL; 
	e->prev = NULL;
	e->frequency = 0;
	e->word = c;
}


/*Funcion: nodeSwap
 * ------------
 *	Cambia los valores de los atributos "word" y "frequency" entre 
 *	dos nodos
 *
 *	u,v: nodos a intercambiar
 */
void nodeSwap(node *u, node *v) {
	
	char *temp_word; 
	int temp_frequency ;

	temp_word = u->word; 
	u->word = v->word; 
	v->word = temp_word;

	temp_frequency = u->frequency; 
	u->frequency = v->frequency; 
	v->frequency = temp_frequency; 
}

/*Funcion: listInit
 * ------------
 *	Inicializa una lista.			
 *
 *	l: lista a inicializar
 */
void listInit(list *l) {
	l->head = l->tail = NULL; 
	l->size = 0;
}


/*Funcion: listSearch
 * ------------
 *	Busca un elemento en una lista dada. Para esto, compara el atributo 
 *	"word" del elemento dado, con el atributo "word" de cada nodo en la 
 *	lista. 
 *
 *	l: lista en donde se realizara la busqueda
 *	e: elemento a buscar
 *
 *	retorna: Si encuentra el elemento devuelve un apuntador a el, de lo 
 *	contrario retorna NULL
 */
node* listSearch(list *l, node *e) {

	/*dummie actua como un iterador sobre los elementos de la lista*/
	
	node *dummie = l->head; 	
	int count = 0;

	while( dummie != NULL ) {
		
		if( strcmp(dummie->word, e->word) == 0 ) 
			return dummie; 

		dummie = dummie->next;
		count++;
	}

	return NULL;
}


/*Funcion: listInsert
 * ------------
 *	Inserta un elemento en una lista. La funcion se asegura de ajustar cada 
 *	atributo de los elementos a cambiar, asi como atributos de la lista 
 *	(de ser necesario)
 *
 *	l: lista en donde se insertara el elemento
 *	e: elemento a insertar
 *
 *	retorna: Un entero que representa si el elemento fue insertado, o se
 *	aumento su frecuencia
 */
int listInsert(list *l, node *e) {

	if (l->size == 0) 
	{
		l->head = e; 
		l->tail = e;
		e->frequency++;

		l->size++; 
	}
	else {
		node *contains = listSearch(l, e); 
		
		if (contains != NULL) 
		{
			contains->frequency++;	
			return -1;
		}
		else {
			(l->tail)->next = e; 
			e->prev = l->tail; 
			l->tail = e; 
			e->frequency++; 

			l->size++; 
		}
	}

	return 1;
}


/*Funcion: listSort
 * ------------
 *	Ordena los elementos de la lista por frecuencia, y a la 
 *	vez lexicograficamente	usando una modificacion del 
 *	algoritmo "insertion Sort"
 *
 *	l: lista a ordenar
 */
void listSort(list *l) {

	if (l->size > 1) 
	{
		/*Se define a i como nodo, para poder usar una copia de*/ 
		/* sus atributo mientras que j se define como apuntador para*/ 
		/* realizar modificaciones los atributos del nodo apuntado*/
		node i = *(l->head)->next; 
		node *j ;

		/*En el caso en el que 2 elementos tengan la misma*/
		/*frecuencia, se comparan lexicograficamente*/
		while (&i != NULL) { 
			j = i.prev; 
		
			while(j!=NULL && (i.frequency >= j->frequency) ) { 
				if (i.frequency > j->frequency) 
					nodeSwap(j->next,j);
				else 
					if ( strcmp(i.word,j->word) < 0 )
						nodeSwap(j->next,j); 
					else 
						break; 
			
		       		j=j->prev; 
			}		

			if (i.next == NULL)
				break;

			i=*(i.next); 	
		}
	}
}


/*Funcion: listPrint
 * ------------
 *	Imprime en consola el contenido de la lista
 *
 * 	l: lista a imprimir
 */
void listPrint(list l) {

	if (l.size==0) 
		printf("Empty list\n"); 
	else 
	{
		node *dummie = l.head;
		
		while (dummie != NULL ) { 
			if (l.head == l.tail) 
				break ;

			printf("%s %d \n",dummie->word,dummie->frequency); 
			dummie = dummie->next;
		}
	}

}
