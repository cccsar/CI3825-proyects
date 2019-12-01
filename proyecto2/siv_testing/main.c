#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <pthread.h>
#include <semaphore.h>

#include "list.h"

#define WORD_SIZE 20
#define MAX_THREADS 1000
#define ARGV_DESP 3

typedef struct thread_vars_t
{
    char **files;
	list *main_list;
	int initial_file;
	int last_file;
}thread_vars;

typedef struct thread_semafore_t
{
    sem_t mutex;
}thread_semafore;

typedef struct thread_data_t
{
	thread_vars *data;
	thread_semafore *semaphore;
}thread_data;

void *test(void *arg)
{
    thread_data *shared;
    FILE *fp; 
	int i,j, fd;
	char *current_word;
	node *space;
	list *my_list;

    shared = arg;

 	my_list = (list*) malloc( sizeof(list) );
	if (!my_list) {
		exit(-2);
	}
	listInit(my_list);
	
	i = shared->data->initial_file;
	while(i <= shared->data->last_file)
	{
		if (!(fp = fopen(shared->data->files[i],"r")) )
		{ 
		/*Bad*/
		}
		
		current_word = (char*) malloc(WORD_SIZE*sizeof(char));
		if (!current_word) 
		{
			/*Bad*/
		}
		
		while(fscanf(fp,"%s",current_word) != EOF) 
		{ 
			space = (node*)malloc(sizeof(node)); 
			if(!space) 
			{
				/*Bad*/
			}

			nodeInit(space, current_word, 0); 

			if (listInsert(my_list, space) < 0) 
			{
				free(space);
				free(current_word);
			}

			current_word = (char*) malloc(WORD_SIZE*sizeof(char)); 			
			if(!current_word) 
			{
				/*Bad*/
			}
		}
		i++;
	}
	
    listSort(my_list);

    /*El semaforo esta en rojo (Bloqueo)*/
    sem_wait(&(shared->semaphore->mutex));

    /*listMerge(shared->data->main_list, my_list);*/
	
    /*El semaforo esta en verde (Desbloqueo)*/
    sem_post(&(shared->semaphore->mutex));

	free(my_list);
}

int main(int argc, char *argv[]) 
{
	list *main_list = malloc(sizeof(list));
    
    pthread_t t_ids[MAX_THREADS];
    int i, n_thread, n_files, rest, x, y, index;

	x = atoi(argv[1]);
	y = atoi(argv[2]);

	listInit(main_list);

	n_thread = (x >= y ? y : x);
	n_files = y / x;
	rest = y % x;

	index = 0;
    /*Creacion de los hilos con la funcion test*/
    for (i = 0; i < n_thread; i++)
    {
		/*main_data->data = malloc(sizeof(thread_data));
		main_data->data->files = argv;
		main_data->data->main_list = main_list;
		main_data->data->initial_file = ARGV_DESP + index;*/

		thread_data *main_data = malloc (sizeof(thread_data));
		main_data->semaphore = malloc(sizeof(thread_semafore));
		main_data->data = malloc(sizeof(thread_data));
		sem_init(&(main_data->semaphore->mutex), 0, 1);

		main_data->data->files = argv;
		main_data->data->main_list = main_list;
		main_data->data->initial_file = ARGV_DESP + index;

		if(rest != 0)
		{
			main_data->data->last_file = ARGV_DESP + index + n_files + 1;
			index = n_files + 1;
			rest--;
		}
		else
		{
			main_data->data->last_file = ARGV_DESP + index + n_files;
			index = n_files;
		}
		
        if (pthread_create(&t_ids[i], NULL, *test, main_data) != 0)
        {        
            printf("NO CREATE\n");
        }
    }
	
    /*Se realiza la espera de los hilos*/
    for (i = 0; i < 1; i++) 
    {
        if (pthread_join(t_ids[i], NULL) != 0)
        {
            printf("NO JOIN\n");
        }
    }
	
	/*Muestra del contenido de la lista*/
	/*listPrint(main_list);*/

    /*El hilo termina*/
    pthread_exit(NULL);

    /*Se libera la memoria del semaforo*/
    /*sem_destroy(&(main_data->semaphore->mutex));*/

	/*Se libera la memoria*/
	free(main_list);
	/*free(main_data);*/
}