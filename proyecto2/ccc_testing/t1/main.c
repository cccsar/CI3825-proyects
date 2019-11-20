/*
 * Archivo: main.c
 *
 * Descripcion: Entorno de ejecucion principal. En este archivo se implementa
 * al ejecutable freecpal. Este recibe como argumento un numero de archivos, junto
 * con los nombre de los mismo. Retorna a la salida estandar cada palabra
 * junto con su frecuencia de aparicion en cada archivo, ordenadas primero por 
 * frecuencia, y de ser iguales las frecuencias, lexicograficamente.
 *
 * Autor: Cesar Alfonso Rosario Escobar
 */

#include <stdio.h> 
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h> 
#include <fcntl.h> 
#include "list.h"

#define WORD_SIZE 20
#define MAX_FILES 2000

/* Funcion memoryError
 * -------
 *	Funcion que implime un mensaje estandar de error de memoria.
 */
void memoryError() {
	perror("Error, memoria insuficiente\n");
}

int main (int argc, char **argv) { 

	FILE *fp; 
	int i,j;  
	int fd[MAX_FILES]; 
	char *current_word;
	node *space;
	list *my_list;

	if (argc != atoi(argv[1]) + 2) 
	{ 
		perror("Error, el formato es:\t ./freecpal <numero de archivos>"
			" {lista de nombre de archivos}\n"); 
		exit(-1); 
	}

 	my_list = (list*) malloc( sizeof(list) );
	if (!my_list)
	{
		memoryError();
		exit(-2);
	}
	listInit(my_list);

	for(i=2; i<atoi(argv[1])+2; i++) {

		fp = fopen(argv[i],"r"); 
		fd = open(argv[i], O_RDONLY, );

		if (fd == -1) { 
			perror("Error abriendo archivo\n"); 
			exit(-3);
		}

		if (!fp ) { 
			perror("Error abriendo archivo\n"); 
			exit(-3); 
		}

		/*Se reserva espacio para la primera palabra del archivo*/
		current_word = (char*) malloc(WORD_SIZE*sizeof(char));
		if (!current_word) {
			memoryError();	
			exit(-2);
		}
	
		while( fscanf(fp,"%s",current_word) != EOF) { 

			space = (node*) malloc( sizeof(node) ) ; 
			if(!space) {
				memoryError(); 	
				exit(-2);
			}

			nodeInit(space, current_word); 

			/*En caso de que solo la frecuencia de un elemento */
			/* se aumente como ese nodo ya esta creado, se libera*/
			/* la memoria que se almaceno para insertarlo.*/
			if (listInsert(my_list, space) < 0) {
				free(space);
				free(current_word);
			}

			/*Se reserva espacio para la i-esima palabra*/ 
			/* del archivo*/
			current_word = (char*) malloc(WORD_SIZE*sizeof(char)); 			
			if(!current_word) {
				memoryError(); 
				exit(-2); 
			}

		}

		close(fd); 


	} 

	listSort(my_list);	
	listPrint(*my_list);

	free(my_list); 

	exit(0);
}

