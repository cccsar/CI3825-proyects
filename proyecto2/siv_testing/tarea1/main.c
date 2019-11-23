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
#include "list.h"

#define WORD_SIZE 20

/* Funcion memoryError
 * -------
 *	Funcion que implime un mensaje estandar de error de memoria.
 */
void memoryError() {
	perror("Error, memoria insuficiente\n");
}

int main (int argc, char **argv) { 

	FILE *fp; 
	int i,j, fd;
	char *current_word;
	node *space;
	list *my_list;

	printf("%s %s %s %s\n",argv[1], argv[2], argv[3], argv[4]);
	/*argv[1] ahora es el file descriptor de un pipe*/
	/*y argv[2] es el numero de archivos*/
	if (argc != atoi(argv[2]) + 3) { 
		perror("Error, el formato es:\t ./freecpal <numero de archivos>"
			" {lista de nombre de archivos}\n"); 
		exit(-1); 
	}

 	my_list = (list*) malloc( sizeof(list) );
	if (!my_list) {
		memoryError();
		exit(-2);
	}
	listInit(my_list);

	for(i=3; i < atoi(argv[2])+3; i++) { 
		if (!(fp = fopen(argv[i],"r")) ){
			dprintf(stderr, "%s",argv[i]);
			perror("fopen"); 
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


	} 

	listSort(my_list);	
	/*ahora esto escribe al file descriptor del pipe*/
	listPrint(*my_list, atoi(argv[1]) );

	free(my_list);

	exit(0);
}

