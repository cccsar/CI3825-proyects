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
#define SEM_NAME "my_semaphore"

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
	sem_t *mutex; 
	int *sem_val; 


	if( ( mutex = sem_open(SEM_NAME, O_APPEND) )  == SEM_FAILED)
		perror("sem_open");

	fprintf(stderr,"Direccion del semaforo %p\n", (void *) mutex);

	/*fprintf(stderr,"%s %s %s %s\n",argv[1] ,argv[2],argv[3],argv[4]); ###DBG*/
	/*argv[1] ahora es el file descriptor de un pipe*/
	/*y argv[2] es el numero de archivos*/
	/*y argv[3] es el nombre de un semaforo*/


	if (argc != atoi(argv[2]) + 4) { 
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


	for(i=4; i < atoi(argv[2])+4; i++) { 
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
			current_word = (char*) malloc(WORD_SIZE*sizeof(char)); 			
			if(!current_word) {
				memoryError(); 
				exit(-2); 
			}

		}


	} 



	sem_val = (int*) malloc(sizeof(int) ) ;
	if( sem_getvalue(mutex, sem_val)  == -1)
		perror("sem_getvalue");

	fprintf(stderr,"%d Esperando para entrar, valor del semaforo "
		       "antes de tomarlo %d\n",getpid(), *sem_val);


		/*********************ANTIGUA REGION CRITICA *********************/
	/*if( sem_wait(mutex) == -1)*/
		/*perror("sem_wait");*/


	/*fprintf(stderr,"\tDentro del semaforo, nadie mas entra\n");*/
	/*if( sem_getvalue(mutex, sem_val)  == -1)*/
		/*perror("sem_getvalue");*/

	/*fprintf(stderr,"Valor del semaforo dentro de RC %d\n", *sem_val);*/


	/*sleep(2);*/
	/*********************AQUI ESTA LA NUEVA REGION CRITICA*********************/
	listPrint(my_list, mutex);
	/*pipeList(my_list);*/

	/*if( kill( atoi(argv[3]), SIGUSR1 ) == -1)*/
		/*perror("kill");*/


	/*if( sem_post(mutex) == -1)*/
		/*perror("sem_post");*/

		/*********************FIN DE LA ANTIGUA REGION CRITICA *********************/


	fprintf(stderr,"##############Despues del semaforo\n");

	if( sem_close(mutex) == -1)
		perror("sem_close");


	close( atoi(argv[1]) );

	/*FREE SPACE*/
	listDestroy(my_list);

	exit(0);
}

