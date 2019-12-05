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
#include <semaphore.h>
#include <errno.h>
#include <unistd.h>
#include "list.h"

#define TRUE 1
#define FALSE 1


/* nodeInit
 * ------------
 * Inicializa un elemento de lista, asignando los valores iniciales
 * de sus atributos. 
 *
 *	e: apuntador al elemento a inicializar
 *	c: cadena de caracteres insertar
 *	f: frecuencia inicial dada
 */
void nodeInit(node *e, char* c, int f) {
	e->next = NULL; 
	e->prev = NULL;
	e->frequency = f;
	e->word = c;
}


/* nodeSwap
 * ------------
 * Cambia los valores de los atributos "word" y "frequency" entre 
 * dos nodos
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


/* listInit
 * ------------
 * Inicializa una lista.			
 *
 *	l: apuntador a la lista a inicializar
 */
void listInit(list *l) {
	l->head = l->tail = NULL; 
	l->size = 0;
}


/* listSearch
 * ------------
 * Busca un elemento en una lista dada. Para esto, compara el atributo 
 * "word" del elemento dado, con el atributo "word" de cada nodo en la 
 * lista. 
 *
 *
 *	l: apuntador a la lista en donde se realizara la busqueda
 *	e: apuntador al elemento a buscar
 *
 * Retorna: Si encuentra el elemento devuelve un apuntador a el, de lo 
 * contrario retorna NULL
 */
node* listSearch(list *l, node *e) {

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


/* listInsert
 * ------------
 * Inserta un elemento en una lista. La funcion se asegura de ajustar cada 
 * atributo de los elementos a cambiar, asi como atributos de la lista 
 * (de ser necesario)
 *
 *
 *	l: apuntador a la lista en donde se insertara el elemento
 *	e: apuntador al elemento a insertar
 *
 * retorna: Un entero que representa si el elemento fue insertado, o se
 * aumento su frecuencia
 */
int listInsert(list *l, node *e) {

	if (l->size == 0) {
		l->head = e; 
		l->tail = e;
	}
	else {
		node *contains = listSearch(l, e); 
		
		if (contains != NULL) {
			contains->frequency += e->frequency; 
			return -1;
		}
		else {
			(l->tail)->next = e; 
			e->prev = l->tail; 
			l->tail = e; 
		}
	}
	l->size++; 

	return 1;
}


/* listSort
 * ------------
 * Ordena los elementos de la lista en forma decreciente por frecuencia, 
 * y luego, los elementos con la misma frecuencia se ordenan 
 * alfanumericamente. Todo esto  usando una modificacion del 
 * algoritmo "insertion Sort"
 *
 *	l: apuntador a la lista a ordenar
 */
void listSort(list *l_) {
	

	if (l_->size > 1) 
	{
		/* Se define a i como nodo, para poder usar una copia de 
		 * sus atributo mientras que j se define como apuntador para 
		 * realizar modificaciones los atributos del nodo apuntado
		 */
		node i_ = *(l_->head)->next; 
		node *j_ ;

		/* En el caso en el que 2 elementos tengan la misma
		 * frecuencia, se comparan sus atributos "word" para ver 
		 * ordenarlos alfanumericamente. 
		 */
		while ( TRUE ) { 

			j_ = i_.prev; 
			while(j_!=NULL && (i_.frequency >= j_->frequency) ) { 

				if (i_.frequency > j_->frequency) 
					nodeSwap(j_->next,j_);
				else 
					if ( strcmp(i_.word,j_->word) < 0 )
						nodeSwap(j_->next,j_); 
					else 
						break; 
			
		       		j_ = j_->prev; 
			}		

			if (i_.next == NULL)
				break;

			i_=*(i_.next); 	
		}
	}
}


/* listPrint
 * ------------
 * Imprime en consola el contenido de la lista
 *
 * 	l_: lista a imprimir
 */
void listPrint(list *l_) {

	if (l_->size > 0) {
		node *dummie = l_->head;
		
		while (dummie != NULL ) { 

			printf("%s %d\n",dummie->word,dummie->frequency); 
			if (l_->head == l_->tail) 
				break ;
			dummie = dummie->next;
		}
	}

}


/* listPrintRC
 * ------------
 * Escribe los elementos de una lista en formato: 
 *	w_controller word_size word frequency
 * para que sean leidos en un pipe.
 *	
 * Si se asigna w_controller = 0 sirve para indicar que se escribiran el 
 * resto de los campos, pero si w_controller = -1, entonces significa que
 * ya se termino de escribir la lista al pipe, o que la lista esta vacia, 
 * segun sea el caso.
 *
 * 	l_: lista a escribir
 * 	mutex: semaforo de exclusion mutua.
 * 	reader: Semaforo que maneja a los "lectores"
 * 	writer: Semaforo que maneja a los "escritores"
 */
void listPrintRC(list *l_, sem_t *mutex, sem_t *reader, sem_t *writer) {
	int *w_controller, *word_size, i_; 
	node *dummie, *cached; 


	w_controller = (int *) malloc( sizeof(int) );
	if (w_controller == NULL) 
		perror("malloc"); 

	word_size = (int *) malloc( sizeof(int) );
	if ( word_size == NULL )  
		perror("malloc"); 


	if (l_->size==0) {
		if( sem_wait(reader)  == -1) 
			perror("sem_wait");

		if( sem_wait(mutex)  == -1) 
			perror("sem_wait");


		*w_controller = -1; 

		write(1, w_controller, sizeof(int) ); 


		if( sem_post(mutex) == -1 ) 
			perror("sem_post"); 

		if( sem_post(writer)  == -1) 
			perror("sem_post");
	}
	else if (l_->size > 0) {
		dummie = l_->head;
		
		for( i_=0; i_<l_->size + 1 ; i_++) { 

			if( sem_wait(reader)  == -1)
				perror("sem_wait");

			if( sem_wait(mutex)  == -1)
				perror("sem_wait");


			if ( i_ == l_->size ) {
				*w_controller = -1; 

				if( write(1, w_controller, sizeof(int) ) == -1)
					perror("write");

			}
			else {
				*w_controller = 0; 

				if( write(1, w_controller, sizeof(int) )  == -1) 
					perror("write");

				/*Escribo el tamano de la palabra al pipe */
				*word_size = strlen(dummie->word);
				if( write(1, word_size, sizeof(int) ) == -1)
					perror("write");
				
				/*Escribo la palabra al pipe*/
				if( write(1, dummie->word, *word_size + 1)  == -1)
					perror("write");

				/*Escribo la frecuencia de la palabra al pipe*/
				if( write(1, &dummie->frequency, sizeof(int))  == -1)
					perror("write");

				free(dummie->word); 

			}


			if( sem_post(mutex) == -1) 
				perror("sem_post");

			if( sem_post(writer) == -1) 
				perror("sem_post");
	
			if( dummie != NULL )  {
				cached = dummie; 
				dummie = dummie->next;
				free(cached);
			}
		}
	}

	free(w_controller); 
	free(word_size);
} 


/* listDestroy
 * --------------
 * Libera la memoria ocupada por una lista.
 *
 * 	l_: lista a liberar
 */
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
