/*
 * Archivo: list.c
 *
 * Descripcion: Archivo fuente para las estructuras de datos list y node
 *
 * Autor: Cesar Alfonso Rosario Escobar
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "list.h"


/*Funcion: nodeInit
 * ------------
 *	Inicializa un elemento de lista, asignando los valores iniciales
 *	de sus atributos. 
 *
 *	e: apuntador al elemento a inicializar
 *	c: cadena de caracteres insertar
 */
void nodeInit(node *e, char* c, int f) {
	e->next = NULL; 
	e->prev = NULL;
	e->frequency = f;
	e->word = c;
}
/*Funcion: nodeSwap
 * ------------
 *	Cambia los valores de los atributos "word" y "frequency" entre 
 *	dos nodos
 *
 *	u,v: apuntadores a los nodos a intercambiar
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
 *	l: apuntador a la lista a inicializar
 */
void listInit(list *l){
	l->head = l->tail = NULL; 
	l->size = 0;
}
/*Funcion: listSearch
 * ------------
 *	Busca un elemento en una lista dada. Para esto, compara el atributo 
 *	"word" del elemento dado, con el atributo "word" de cada nodo en la 
 *	lista. 
 *
 *	l: apuntador a la lista en donde se realizara la busqueda
 *	e: apuntador al elemento a buscar
 *
 *	retorna: Si encuentra el elemento devuelve un apuntador a el, de lo 
 *	contrario retorna NULL
 */
node* listSearch(list *l, node *e) {
	/*dummie actua como un iterador sobre los elementos de la lista*/
	node *dummie = l->head;
	while(dummie != NULL) {
		if(strcmp(dummie->word, e->word) == 0){
			return dummie;
		}
		dummie = dummie->next;
	}
	return NULL;
}
/*Funcion: listInsert
 * ------------
 *	Inserta un elemento en una lista. La funcion se asegura de ajustar cada 
 *	atributo de los elementos a cambiar, asi como atributos de la lista 
 *	(de ser necesario)
 *
 *	l: apuntador a la lista en donde se insertara el elemento
 *	e: apuntador al elemento a insertar
 *
 *	retorna: Un entero que representa si el elemento fue insertado, o se
 *	aumento su frecuencia
 */
int listInsert(list *l, node *e) {
	if (l->size == 0) {
		l->head = e; 
		l->tail = e;
		e->frequency++;
	}else {
		node *contains = listSearch(l, e);
		if (contains != NULL){
			contains->frequency += e->frequency;
			return -1;
		}else {
			l->tail->next = e; 
			e->prev = l->tail; 
			l->tail = e;
			if(e->frequency == 0) e->frequency++;
		}
	}
	l->size++; 
	return 1;
}
/*Funcion: listSort
 * ------------
 *	Ordena los elementos de la lista en forma decreciente por frecuencia, 
 *	y luego, los elementos con la misma frecuencia se ordenan 
 *	alfanumericamente. Todo esto  usando una modificacion del 
 *	algoritmo "insertion Sort"
 *
 *	l: apuntador a la lista a ordenar
 */
void listSort(list *l) {
	if (l->size > 1) {
		/*Se define a i como nodo, para poder usar una copia de*/ 
		/* sus atributo mientras que j se define como apuntador para*/ 
		/* realizar modificaciones los atributos del nodo apuntado*/
		node i = *(l->head)->next; 
		node *j ;
		/*En el caso en el que 2 elementos tengan la misma*/
		/*frecuencia, se comparan sus atributos "word" para ver*/ 
		/* ordenarlos alfanumericamente.*/ 
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
/*  Funcion: listMerge
 *  --------------
 *	Combina de forma ordenada dos listas.
 *
 *	list_a: Lista de palabras con orden alfanumerico y por frecuencia.
 *  list_b: Lista de todas las palabras con orden alfanumerico y por frecuencia.
 * 
 *  return: void.
 */
void listMerge(list *list_a, list *list_b){
    node *node_b, *new_node;
    node_b = list_b->head;
	/*Si la lista_a esta vacia, se copia la lista_b en lista_a*/
	if(list_a->size == 0){
		list_a->head = list_b->head;
		list_a->tail = list_b->tail;
		list_a->size = list_b->size;
		return;
	/*Si la lista_b esta vacia, no se realiza mezcla alguna*/
	}else if(list_b->size == 0){
		return;
	/*Se insertan los elementos de la lista b en la lista a*/
	}else{
		while(node_b != NULL){
			new_node = malloc(sizeof(node));
			nodeInit(new_node, node_b->word, node_b->frequency);
			listInsert(list_a, new_node);
			node_b = node_b->next;
		}
	}
}
/*Funcion: listPrint
 * ------------
 *	Imprime en consola el contenido de la lista
 *
 * 	l: lista a imprimir
 */
void listPrint(list *l_) {
	if (l_->size > 0) {
		node *dummie = l_->head;
		
		while (dummie != NULL ) { 
			fprintf(stderr,"%s %d\n",dummie->word,dummie->frequency);
			if (l_->head == l_->tail) 
				break ;
			dummie = dummie->next;
		}
	}
}
/*###*/
void pipeList(list *l) { 
	node *dummie; 	

	dummie = l->head; 
	while(dummie != NULL) { 
		write(1, *dummie, sizeof(node)); 
		dummie = dummie->next; 
	}

}

void listDestroy(list *l_) { 
	node *dummie; 
	node *killed; 

	if (l_->size >= 1) {
		killed = l_->head; 
		dummie = killed->next; 
		while( dummie != NULL ) {
			free(killed); 
			killed = dummie; 
			dummie = dummie->next; 
		}
		free(killed);
	}
	free(l_);
}