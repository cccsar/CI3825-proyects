#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "list.h"


/*Funcion: listElInit
 * ------------
 *	Inicializa un elemento de lista, asignando los valores iniciales
 *	de sus atributos. El nodo se inicializa con la palabra a la que 
 *	estara asociado y con frecuencia 0, pues aun no esta en una lista.		###
 *
 *	e: elemento a inicializar
 *	c: contenido del miembro de funcion "word"
 *
 * 	retorna: 	###
 */
void listElInit(node *e, char* c) {
	e->next = NULL; 
	e->prev = NULL;
	e->frequency = 0;
	e->word = c;

}


/*Funcion: listInit
 * ------------
 *	Inicializa una lista.			###
 *
 *
 *	l: lista a inicializar
 *
 *	retorna:	###
 */
void listInit(list *l) { 
	l->head = l->tail = NULL; 
	l->size = 0;
}


/*Funcion: listSearch
 * ------------
 *	Busca un elemento en una lista dada. Para esto, compara el atributo "word"
 *	del elemento dado, con el atributo "word" de cada nodo en la lista. 
 *	
 *
 *	l: lista en donde se realizara la busqueda
 *	e: elemento a buscar
 *
 *	retorna:	###
 *
 */
int listSearch(list *l, node *e) {

	node *dummie = l->head; 	/*	dummie es un iterador sobre los elementos	*/
					/*	de la lista	*/
	int count = 0;

	while( dummie != NULL ) {
		
		if( strcmp(dummie->word, e->word) == 0 ) {
			return count; 
		}
		dummie = dummie->next;
		count++;
	}

	return -1;
}


//podria modificar el tipo de retorno para que sea un int que diga si aumento frecuencia o inserto a la lista
// esto para hacer el free respectivo del nodo
/*Funcion: listInsert
 * ------------
 *	Inserta un elemento en una lista. La funcion se asegura de ajustar cada 
 *	atributo de los elementos a cambiar, asi como de la lista (de ser necesario)
 *
 *	l: lista en donde se insertara el elemento
 *	e: elemento a insertar
 *
 *	retorna:	###
 */
void listInsert(list *l, node *e) {

	if (l->size == 0) 
	{
		l->head = e; 
		l->tail = e;
		e->frequency++;

		l->size++; 
	}
	else {
		int contains = listSearch(l, e); 
		
		if (contains > 0) 
		{
			int i;
			node *dummie = l->head; 
			for(i=0; i<contains; i++) 
				dummie = dummie->next; 

			dummie->frequency++; 
		}
		else {
			(l->tail)->next = e; 
			e->prev = l->tail; 
			l->tail = e; 
			e->frequency++; 

			l->size++; 
		}
	}
}


/*Funcion: listSwap
 * ------------
 *
 *
 */
void listSwap(list *l, node *u, node *v) {
	
	node *temp; 

	/*	Aqui ajusta atributos de la lista si algun elemento es cabecera		*/
	/* 	o cola	*/
	if (l->head == u)
		l->head = v;
	else if (l->head == v) 
		l->head = u;

	if (l->tail == u)
		l->tail = v; 
	else if (l->tail == v)
		l->tail = u;
	
	/* 	Aqui considera que los nodos a cambiar sean consecutivos 	*/	
	if (u->next == v) 
	{
		temp = v->next; 
		v->next = u;
		u->next = temp;

		temp = u->prev;
		u->prev = v;
		v->prev = temp;

	}
	else if (u->prev == v) { 
			
		temp = u->next; 
		u->next = v; 
		v->next = temp; 

		temp = v->prev;
		v->prev = u; 
		u->prev = temp; 		
			
	}
	else { 
		/*	Aqui considera que no sean consecutivos		*/		
		temp = v->next; 
		v->next = u->next; 
		u->next = temp; 	

		temp = u->prev; 
		u->prev = v->prev;
		v->prev = temp;
	}

	/* 	Se ajustan los apuntadores de los nodos vecinos pero no involucrados 	*/	
	/*	en el swap	*/	
	if (u->next != NULL )
		(u->next)->prev = u; 

	if (u->prev != NULL )
		(u->prev)->next = u; 

	if (v->next != NULL ) 
		(v->next)->prev = v; 

	if (v->prev != NULL ) 
		(v->prev)->next = v; 
}


// 1 si es exitoso, 0 si la lista esta vacia o tiene un elemento?
/*Funcion: listSort
 * ------------
 *
 *
 */
void listSort(list *l) {

	if (l->size > 1) {

		node *second = (l->head)->next; 

		while (second != NULL) { 
				
		}

	}
}


/*Funcion: listPrint
 * ------------
 *	Imprime en consola el contenido de la lista
 *
 * 	l: lista a imprimir
 *
 * 	retorna:	###
 *
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
			printf("word \"%s\": %d times\n",dummie->word,dummie->frequency); 
			dummie = dummie->next;
		}

		printf("\nhead: %s\ttail: %s\tsize: %d\t\n", (l.head)->word, (l.tail)->word, l.size); 
	}


}
