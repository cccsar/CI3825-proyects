/*
 * Archivo: Archivo fuente para la estructura de datos hasht
 *
 * Descripcion:	
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
#include "hasht.h"

#define TRUE 1
#define FALSE 0


/*hashtInit
 * --------------
 * Da un valor inicial a cada entra de la tabla de hash
 *
 *	h_: tabla de hash a inicializar
 */
void hashtInit(hasht h_){
	int i_; 

	for(i_=0; i_<HASH_SIZE; i_++)  
		h_[i_] = (singly *) NULL; 		
}


/*hashDestroy
 * --------------
 * Libera la memoria de cada lista lista asociada a la tabla
 *
 * 	h_: tabla de hash a destruir
 */
void hashtDestroy(hasht h_) {
	int i_;

	for(i_=0; i_<HASH_SIZE ; i_++) {
		if (h_[i_] != NULL) 
			singlyDestroy(h_[i_]);	
	}	
}


/*hashtInsert
 * --------------
 * Inserta un elemento en la tabla
 *
 * 	h_: tabla de hash que recibe el elemento
 *	number: elemento a insertar
 */
int hashtInsert(hasht h_, int number){
	int index; 
	snode *dummie; 

	index = number % HASH_SIZE; 	


	if (h_[index] != NULL ) { 


		if ( singlySearch(h_[index], number)  ){ 
			return FALSE; 
		}

	}
	else {
		h_[index] = (singly *) malloc( sizeof(singly) );

		singlyInit( h_[index] );
	}


	dummie = (snode *) malloc( sizeof(snode) );
	snodeInit(dummie, number);

	singlyInsert( h_[index], dummie);  

	return TRUE;
}
