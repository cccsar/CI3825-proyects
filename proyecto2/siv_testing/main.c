#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <pthread.h>
#include <semaphore.h>

#include "list.h"

#define MAX 10
#define WORD_SIZE 20

/*Estructura de un hilo*/
struct thread_vars_t
{
    /*Atributos*/
    int num_args;
    int num_files;
    char** files;
    /*Semaforo*/
    sem_t semaphore;
};

void memoryError() {
	perror("Error, memoria insuficiente\n");
}

/*Funcion que maneja el hilo*/
void *test(void *arg)
{
    struct thread_vars_t *vars;
    FILE *fp; 
	int i,j, fd;
	char *current_word;
	node *space;
	list *my_list;

    vars = arg;

	if (vars->num_args != atoi(vars->files[2]) + 3) { 
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

	for(i = 3; i < atoi(vars->files[1])+3; i++) { 
		if (!(fp = fopen(vars->files[i],"r")) ){
			dprintf(stderr, "%s",vars->files[i]);
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

			nodeInit(space, current_word, 0); 

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

    /*El semaforo esta en rojo (Bloqueo)*/
    sem_wait(&vars->semaphore);
    
    /*Llamada a merger*/
    /*Region critica*/

    /*El semaforo esta en verde (Desbloqueo)*/
    sem_post(&vars->semaphore);
	
	listPrint(my_list);
	free(my_list);

    /*El hilo termina*/
    /*pthread_exit((void *)big_value);*/
}

int main(int argc, char *argv[]) 
{
    /*Estructura del hilo*/
    struct thread_vars_t *vars = malloc (sizeof(struct thread_vars_t));
    /*Arreglo de hilos*/
    pthread_t t_ids[MAX];
    /*Variables*/
    int i, value;

    /*Inicializacion del semaforo*/
    sem_init(&vars->semaphore, 0, 1);

    /*Inicializacion de los atributos del hilo*/

    /*Creacion de los hilos con la funcion test*/
    for (i = 0; i < MAX; i++) 
    {
        if (pthread_create(&t_ids[i], NULL, *test, vars) != 0)
        {        
            printf("NO CREATE\n");
        }
    }

    /*Se realiza la espera de los hilos*/
    for (i = 0; i < MAX; i++) 
    {
        /*Valor de retorno del hilo*/
        void *value;

        if (pthread_join(t_ids[i], &value) != 0)
        {
            printf("NO JOIN\n");
        }
    }

    /*El hilo termina*/
    pthread_exit(NULL);

    /*Se libera la memoria del semaforo*/
    sem_destroy(&vars->semaphore);
}