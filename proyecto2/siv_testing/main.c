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
#define SEM_COUNT 1
#define SEM_SHARED_WITH 0

/*Estructura global de hilos*/
typedef struct thread_vars_struct{
    char **files;
	list *main_list;
	int num_files;
}thread_vars_t;

/*Variables globales*/
int global_index;
sem_t sem_merge;
sem_t sem_index;

void *test(void *arg){
    thread_vars_t *vars;
    FILE *fp; 
	int index;
	char *current_word;
	node *space;
	list *my_list;

    vars = (thread_vars_t*)arg;
	
	my_list = (list*)malloc(sizeof(list));
	if (!my_list) {
		pthread_exit(NULL);
	}
	listInit(my_list);

	do
	{
		sem_wait(&sem_index);
			index = (isFileAvailable(vars->num_files) == 1) ? global_index : -1;
		sem_post(&sem_index);
		
		if(index == -1){
			/*printf("BAD INDEX: %i\n", index);*/ 
			pthread_exit(NULL);
		}

		if (!(fp = fopen(vars->files[index + ARGV_DESP],"r"))){ 
			printf("BAD FOPEN: %i\n", fp);
			pthread_exit(NULL);
		}
		
		current_word = (char*)malloc(WORD_SIZE*sizeof(char));
		if (!current_word) {
			printf("BAD CURRENT WORD MALLOC: %i\n", current_word);
			pthread_exit(NULL);
		}
		
		while(fscanf(fp,"%s",current_word) != EOF) { 
			space = (node*)malloc(sizeof(node)); 
			if(!space) {
				printf("BAD SPACE MALLOC: %i\n", space);
				pthread_exit(NULL);
			}

			nodeInit(space, current_word, 0);

			if (listInsert(my_list, space) < 0) {
				/*free(space);
				free(current_word);*/
			}
			
			current_word = (char*)malloc(WORD_SIZE*sizeof(char)); 			
			if(!current_word) {
				printf("BAD CURRENT WORD MALLOC 2: %i\n", current_word);
				pthread_exit(NULL);
			}
		}
		
		listSort(my_list);
		sem_wait(&sem_merge);
			/*printf("----------\n");
			listPrint(my_list);
			printf("----------\n");*/
			/*listMerge(vars->main_list, my_list);*/
		sem_post(&sem_merge);

		free(current_word);
		free(my_list);
	} while (index >= 0);

	pthread_exit(NULL);
}

int isFileAvailable(int n){
	if(global_index < n - 1){
		global_index++;
		return 1;
	}else{
		return -1;
	}
}

int main(int argc, char *argv[]){
	thread_vars_t *thread_vars;
	list *main_list;
    pthread_t t_ids[MAX_THREADS];
    int i, n_thread, n_files;

	thread_vars = (thread_vars_t*)malloc(sizeof(thread_vars));
	main_list = (list*)malloc(sizeof(list));

	n_thread = atoi(argv[1]);
	n_files = (int)atoi(argv[2]);
	global_index = -1;
	
	if(n_thread > MAX_THREADS){
		/*Error*/
		free(thread_vars);
		free(main_list);
		exit(-1);
	}
	
	listInit(main_list);
	sem_init(&sem_index, SEM_SHARED_WITH, SEM_COUNT);
	sem_init(&sem_merge, SEM_SHARED_WITH, SEM_COUNT);
	
	thread_vars->files = argv;
	thread_vars->main_list = main_list;
	thread_vars->num_files = n_files;

	n_thread = (n_thread >= n_files ? n_files : n_thread);

    /*Creacion de los hilos con la funcion test*/
    for (i = 0; i < n_thread; i++){
        if (pthread_create(&t_ids[i], NULL, *test, thread_vars) != 0){        
            printf("NO CREATE\n");
        }
		printf("CREATE\n");
    }
	
    /*Se realiza la espera de los hilos*/
    for (i = 0; i < n_thread; i++) {
        if (pthread_join(t_ids[i], NULL) != 0){
            printf("NO JOIN\n");
        }
		printf("JOIN\n");
    }
	
	/*Muestra del contenido de la lista*/
	/*listPrint(main_list);*/

	/*Se libera la memoria*/
    sem_destroy(&sem_index);
	sem_destroy(&sem_merge);
	free(main_list);
	free(thread_vars);

	/*El hilo termina*/
    pthread_exit(NULL);
}