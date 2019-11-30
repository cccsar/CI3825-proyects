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
 *	l: apuntador a la lista en donde se realizara la busqueda
 *	e: apuntador al elemento a buscar
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
 *	l: apuntador a la lista en donde se insertara el elemento
 *	e: apuntador al elemento a insertar
 *
 *	retorna: Un entero que representa si el elemento fue insertado, o se
 *	aumento su frecuencia
 */
int listInsert(list *l, node *e) {

	if (l->size == 0) 
	{
		l->head = e; 
		l->tail = e;
		/*e->frequency++;*/

	}
	else {
		node *contains = listSearch(l, e); 
		
		if (contains != NULL) 
		{
			/*contains->frequency++;	*/
			contains->frequency += e->frequency; 
			return -1;
		}
		else {
			(l->tail)->next = e; 
			e->prev = l->tail; 
			l->tail = e; 
			/*e->frequency++; */

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

	if (l->size > 1) 
	{
		/* Se define a i como nodo, para poder usar una copia de 
		 * sus atributo mientras que j se define como apuntador para 
		 * realizar modificaciones los atributos del nodo apuntado
		 */
		node i = *(l->head)->next; 
		node *j ;

		/* En el caso en el que 2 elementos tengan la misma
		 * frecuencia, se comparan sus atributos "word" para ver 
		 * ordenarlos alfanumericamente. 
		 */
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
 * 	l_: lista a imprimir
 */
void listPrint(list *l_) {

	if (l_->size > 0) {
		node *dummie = l_->head;
		
		while (dummie != NULL ) { 

			printf("%s %d \n",dummie->word,dummie->frequency); 
			if (l_->head == l_->tail) 
				break ;
			dummie = dummie->next;
		}
	}

}


/*Funcion: listPrintRC
 * ------------
 *	Escribe los elementos de una lista en formato: 
 *		w_controller word_size word frequency
 *	para que sean leidos en un pipe.
 *	
 *	Si se asigna w_controller = 0 sirve para indicar que se escribiran el 
 *	resto de los campos, pero si w_controller = -1, entonces significa que
 *	ya se termino de escribir la lista al pipe, o que la lista esta vacia, 
 *	segun sea el caso.
 *
 *		
 *
 * 	l_: lista a escribir
 * 	mutex: semaforo de exclusion mutua.
 * 	reader: Semaforo que maneja a los "lectores"
 * 	writer: Semaforo que maneja a los "escritores"
 * 	
 *
 */
void listPrintRC(list *l_, sem_t *mutex, sem_t *reader, sem_t *writer) {
	int *w_controller, *word_size, *frequency, i_; 
	char *this_word; 


	w_controller = (int *) malloc( sizeof(int) );
	if (w_controller == NULL) {
		perror("malloc"); 

		exit(-1) ; 
	}
	word_size = (int *) malloc( sizeof(int) );
	if ( word_size == NULL ) { 
		perror("malloc"); 

		exit(-1); 
	}
	frequency = (int*) malloc( sizeof(int) );
	if ( frequency == NULL ) { 
		perror("malloc"); 

		exit(-1); 
	}


	if (l_->size==0)  {

		if( sem_wait(reader)  == -1) {
			perror("sem_wait");

			exit(-2);
		}

		if( sem_wait(mutex)  == -1) {
			perror("sem_wait");

			exit(-2); 
		}

		*w_controller = -1; 

		if( write(1, w_controller, sizeof(int) ) == -1) {
			perror("write"); 

			exit(-2); 
		}

		if( sem_post(mutex)  == -1);  {
			perror("sem_post");

			exit(-2); 
		}

		if( sem_post(writer)  == -1) {
			perror("sem_post");

			exit(-2); 
		}

	}
	else if (l_->size > 0) {
		node *dummie = l_->head;
		
		for( i_=0; i_<l_->size + 1 ; i_++) { 

			if( sem_wait(reader)  == -1)
				perror("sem_wait");


			if( sem_wait(mutex)  == -1)
				perror("sem_wait");


			/*********************REGION CRITICA*********************/


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
				this_word = (char*) malloc( sizeof(char) * (*word_size) );
				this_word = dummie->word; 
				if( write(1, this_word, *word_size)  == -1)
					perror("write");

				/*Escribo la frecuencia de la palabra al pipe*/
				*frequency = dummie->frequency; 
				if( write(1, frequency, sizeof(int))  == -1)
					perror("write");

			/*********************FIN DE LA REGION CRITICA	*********************/

			}

			if( sem_post(mutex) == -1) {
				perror("sem_post");

				exit(-2); 
			}

			if( sem_post(writer) == -1) {
				perror("sem_post");

				exit(-2); 
			}
	

			if( dummie != NULL ) 
				dummie = dummie->next;
			

		}

	}


} 



/* listDestroy
 * --------------
 *	Libera la memoria ocupada por una lista.
 *
 *
 * 	l_: lista a liberar
 *
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

				/*DEBUGGING DE SEMAFOROS*/
			/*fprintf(stderr,"#####COUNTER INSIDE RC DBG#####%d\n",getpid());

			if( sem_getvalue(reader, deb_semval)  == -1)
				perror("sem_getvalue");
			fprintf(stderr,"  Valor de reader:  %d\n", *deb_semval); 

			if( sem_getvalue(writer, deb_semval)  == -1)
				perror("sem_getvalue");
			fprintf(stderr,"  Valor de writer:  %d\n", *deb_semval); 

			if( sem_getvalue(mutex, deb_semval)  == -1)
				perror("sem_getvalue");
			fprintf(stderr,"  Valor de mutex:  %d\n", *deb_semval); */
