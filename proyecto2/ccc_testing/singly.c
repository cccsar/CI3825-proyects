/*
 * Archivo: list.c
 *
 * Descripcion:	Archivo fuente para las estructuras singly y snode
 *
 * Autores:
 * 	Carlos Alejandro Sivira Munoz		15-11377
 * 	Cesar Alfonso Rosario Escobar		15-11295
 *
 */

#include <stdio.h> 
#include <stdlib.h>
#include <sys/types.h> 
#include <sys/stat.h> 
#include <sys/wait.h>
#include <fcntl.h>  
#include <dirent.h> 
#include <string.h> 
#include <unistd.h>
#include <string.h>
#include "singly.h"

#define TRUE 1
#define FALSE 0


/* snodeInit
 * --------------
 * Inicializa nodo de lista singly
 *
 * 	n_: apuntador al nodo a inicializar
 *	number: inodo que acompana al nodo
 */
void snodeInit(snode *n_, int number) {
	n_->next = (snode *) NULL; 
	n_->element = number; 
}


/* singlyInit
 * --------------
 * Inicializa una lista singly
 *
 * 	l_: apuntador a una lista
 */
void singlyInit(singly *l_) {
	l_->head = l_->tail = (snode *) NULL; 
	l_->size = 0; 
}


/* singlyDestroy
 * --------------
 * Libera la memoria de una lista singly
 *
 * 	l_: lista a destruir
 */
void singlyDestroy(singly *l_) {
	snode *killed, *dummie; 

	if (l_->size >= 1 ) {
		killed = l_->head;
		dummie = killed->next;
		while( dummie != (snode*) NULL ) {
			free(killed); 
			killed = dummie; 
			dummie = dummie->next; 
		}
		free(killed);
	}		

	free(l_);
}


/* singlyInsert
 * --------------
 * Inserta un nodo en una lista singly
 *
 * 	l_: apuntador a la lista en donde se insertara
 * 	n_: apuntador del nodo a insertar
 */
void singlyInsert(singly *l_, snode *n_) {
	
	if (l_->size == 0)  {
		l_->head = l_->tail = n_; 
	}
	else if (l_->size >= 1 )  {
		(l_->tail)->next = n_; 
		l_->tail = n_;
	}

	l_->size++;
}


/* singlySearch
 * --------------
 * Revisa si un existe un nodo en la lista con un inodo asociado dado.
 *
 * 	l_: apuntador a la lista
 * 	number: inodo a consultar
 */
int singlySearch(singly *l_, int number) {
	int i_; 
	snode *dummie; 


	dummie = l_->head; 
	for(i_=0; i_<l_->size; i_++) {
		
		if ( dummie->element == number) 
			return 1; 

		dummie = dummie->next;
	}

	return 0; 
}
