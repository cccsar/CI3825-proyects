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
#include <semaphore.h> 
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <signal.h>
#include "list.h"


#define WORD_SIZE 20

#define SMP0 "/mutex"
#define SMP1 "/sem_reader"
#define SMP2 "/sem_writer"
#define MODE S_IRWXU | S_IRGRP | S_IWGRP | S_IROTH 


int main (int argc, char **argv) { 

	int i,j;

	FILE *fp; 

	char *current_word;
	node *space;
	list *my_list;

	sem_t *mutex, *sem_r, *sem_w; 
	int *sem_val; 

	if (argc != atoi(argv[1]) + 2) { 
		perror("Error, el formato es:\t ./freecpal <numero de archivos>"
			" {lista de nombre de archivos}\n"); 

		exit(-1); 
	}

	/*ABRO LOS SEMAFOROS*/
	if( (mutex = sem_open(SMP0, O_WRONLY) )  == SEM_FAILED) {
		perror("sem_open");

		exit(-1); 
	}

	if( ( sem_r = sem_open(SMP1, O_WRONLY) ) == SEM_FAILED) {
		perror("sem_open");

		exit(-1); 
	}

	if( ( sem_w = sem_open(SMP2, O_WRONLY) )  == SEM_FAILED) {
		perror("sem_open");

		exit(-1); 
	}


	if ( (my_list = (list*) malloc( sizeof(list) ) ) == NULL ) {
		perror("malloc");

		exit(-2); 
	}


	listInit(my_list);


	/*INSERTO NODOS*/

	for(i=2; i < argc ; i++) { 

		if ( !(fp = fopen(argv[i],"r")) ){
			dprintf(stderr, "%s",argv[i]);
			perror("fopen"); 

			exit(-3); 
		}

		/*Se reserva espacio para la primera palabra del archivo*/
		if ( (current_word = (char*) malloc(WORD_SIZE * sizeof(char)) ) == NULL ) {
			perror("malloc");
			exit(-2);
		}
	
		while( fscanf(fp,"%s",current_word) != EOF) { 

			if ( ( space = (node*) malloc( sizeof(node) ) ) == NULL ) {
				perror("malloc");

				exit(-2);
			}

			nodeInit(space, current_word, 1); 

			/*En caso de que solo la frecuencia de un elemento */
			/* se aumente como ese nodo ya esta creado, se libera*/
			/* la memoria que se almaceno para insertarlo.*/
			if (listInsert(my_list, space) < 0) {
				free(space);
				free(current_word);
			}

			/*Se reserva espacio para la i-esima palabra*/ 
			/* del archivo*/
			if ( (current_word = (char*) malloc(WORD_SIZE*sizeof(char)) ) == NULL ) {
				perror("malloc");

				exit(-2);
			}
	

		}


	} 



	/*AQUI SE ENTRA EN LA REGION CRITICA*/
	listPrint(my_list, mutex, sem_r, sem_w);


	/*CIERRO SEMAFOROS*/
	if( sem_unlink(SMP0) == -1)
		perror("sem_close");

	if( sem_unlink(SMP1) == -1)
		perror("sem_close");

	if (sem_unlink(SMP2) == -1) 


	/*CIERRO FD QUE APUNTA A PIPE*/
	close(1);

	/*FREE SPACE*/
	listDestroy(my_list);

	exit(0);
}

