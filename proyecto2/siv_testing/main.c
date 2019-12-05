#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <pthread.h>
#include <semaphore.h>
#include <errno.h>
#include "list.h"

#define WORD_SIZE 20
#define MAX_THREADS 1000 
#define STANDARD_SIZE 419 
#define ARGV_DESP 0
#define SEM_COUNT 1
#define SEM_SHARED_WITH 0
/*-----------------------------------STRUCTURAS-------------------------------*/
/*Tipo: thread_vars_t
 *------------STRUCTURAS
 *		Tipo para manejar los datos compartidos entre hilos.	
 *
 *	files: Archivos quen contienen palabras a leer.
 *	main_list: Lista donde son mezclados las palabras.
 *	num_files: Numero total de archivos a leer.
 */
typedef struct thread_vars_struct{
    char **files;
	list *main_list;
	int num_files;
}thread_vars_t;
/*-----------------------------------STRUCTURAS-------------------------------*/
/*-------------------------------VARIABLES GLOBALES---------------------------*/
int global_index;/*Contador de archivos leidos*/
sem_t sem_merge;/*Semaforo que controla el acceso a global_index*/
sem_t sem_index;/*Semaforo que controla el acceso a main_list*/
/*-------------------------------VARIABLES GLOBALES---------------------------*/
/* freecpalSortedList
 * --------------
 *  	Cuenta el numero de ocurrencias de una palabra en un archivo. Para ello
 *  	lee cada palabra del archivo y la inserta en una "lista de frecuencias".
 *
 *  	Recibe los archivos segun la disponibilidad del indice global.
 * 		
 *	arg: Structura que contiene la informacion que comparten los hilos 
 *
 */
void *freecpalSortedList(void *arg){
	/*----------------------------------VARIABLES-----------------------------*/
    thread_vars_t *vars;
    FILE *fp;
	int index;
	char *current_word;
	node *space;
	list *my_list;
	/*----------------------------------VARIABLES-----------------------------*/
	/*Se salvan los datos compartidos como tipo thread_vars_t*/
    vars = (thread_vars_t*)arg;
	/*Se reserva el espacio de la lista del hilo*/
	my_list = (list*)malloc(sizeof(list));
	if (!my_list) {
		perror("MALLOC");
		pthread_exit((void*)-1);
	}
	/*Los hilos procesan archivos hasta agotar la existencia*/
	do
	{
		listInit(my_list);
		/*-----------------------------REGION CRITICA ------------------------*/
		sem_wait(&sem_index);
			index = (isFileAvailable(vars->num_files) == 1) ? global_index : -1;
		sem_post(&sem_index);
		/*-----------------------------REGION CRITICA ------------------------*/
		if(index == -1){/*No hay mas archivos para leer*/
			free(my_list);
			pthread_exit((void*)0);
		}

		if (!(fp = fopen(vars->files[index + ARGV_DESP],"r"))){ 
			fprintf(stderr, "%s",vars->files[index + ARGV_DESP]);
			perror("FOPEN");
			pthread_exit((void*)-3);
		}
		
		current_word = (char*)malloc(WORD_SIZE*sizeof(char));
		if (!current_word) {
			perror("MALLOC");
			pthread_exit((void*)-1);
		}
		/*Lectura de palabras*/
		while(fscanf(fp,"%s",current_word) != EOF) { 
			space = (node*)malloc(sizeof(node)); 
			if(!space) {
				perror("MALLOC");
				pthread_exit((void*)-1);
			}

			nodeInit(space, current_word, 0);
			if (listInsert(my_list, space) < 0) {
				free(space);
				free(current_word);
			}
			
			current_word = (char*)malloc(WORD_SIZE*sizeof(char)); 			
			if(!current_word) {
				perror("MALLOC");
				pthread_exit((void*)-1);
			}
		}
		fclose(fp);
		
		/*-----------------------------REGION CRITICA ------------------------*/
		sem_wait(&sem_merge);
			listMerge(vars->main_list, my_list);
		sem_post(&sem_merge);
		/*-----------------------------REGION CRITICA ------------------------*/
		free(current_word);
	} while (index >= 0);
}
/* isFileAvailable
 * --------------
 *  	Verifica si hay archivos disponibles que un hilo pueda procesar.
 * 		
 *	n: Numero total de archivos a leer. 
 *	
 *  return: 1 si hay archivos disponibles. -1 en caso contrario.
 */
int isFileAvailable(int n){
	if(global_index < n - 1){
		global_index++;
		return 1;
	}else{
		return -1;
	}
}
/* main
 * --------------
 *		Cuenta el numero de ocurrencias de una palabra en un archivo. Para ello,
 *		mediante el uso de hilos, lee cada palabra de un archivo y las inserta
 *		en una "lista de frecuencias".
 *
 * 		Muestra la frecuencia de las palabras en una lista principal que es el 
 * 		resultado de convinar las listas generadas por los hilos. Muestra esta
 * 		lista en la salida estandar.
 *
 * 	argc: Numero de argumentos.
 * 	argv: <Numero de hilos> <Numero de archivos> {archivos con palabras}
 */
int main(int argc, char *argv[]){
	/*----------------------------------VARIABLES-----------------------------*/
	thread_vars_t *thread_vars;
	list *main_list;
    pthread_t t_ids[MAX_THREADS];
	char **paths;
    int i, n_thread, n_files;
	/*----------------------------------VARIABLES-----------------------------*/
	/*Se reserva el espacio a utilizar*/
	thread_vars = (thread_vars_t*)malloc(sizeof(thread_vars));
	main_list = (list*)malloc(sizeof(list));
	/*Se salvan los datos suministrados*/
	n_thread = atoi(argv[1]);

	global_index = -1; /*Se inicializa el contador*/
	/*Numero de maximo de hilos que el usuario puede solicitar*/
	if(n_thread > MAX_THREADS){
		printf("Can't use more than %i threads\n", MAX_THREADS);
		free(thread_vars);
		free(main_list);
		exit(-1);
	}

	/*Ubico los archivos a procesar*/
	paths = (char**) malloc(sizeof(char*) * STANDARD_SIZE);
	if (paths == NULL ) { 
		perror("MALLOC");
		exit(-1); 
	}
	/*Es salvada la cantidad de archivos a procesar*/
	n_files = myFind(argv[2], &paths); 
	printf("numero de archivos encontrados: %d\n",n_files);
	printf("direccion de path %p\t tamano: %d\n",(void*) paths, malloc_usable_size(paths));

	/*Inicializacion de lista principal y semaforos*/
	listInit(main_list);
	sem_init(&sem_index, SEM_SHARED_WITH, SEM_COUNT);
	sem_init(&sem_merge, SEM_SHARED_WITH, SEM_COUNT);
	/*Inicializacion de datos compartidos entre hilos*/
	thread_vars->files = paths;
	thread_vars->main_list = main_list;
	thread_vars->num_files = n_files;
	/*Si el numero de hilos es superior al de archivos, se toma el numero de 
	archivos como el numero de hilos a utilizar*/
	n_thread = (n_thread >= n_files ? n_files : n_thread);

    /*Creacion de los hilos con la funcion freecpalSortedList*/
    for (i = 0; i < n_thread; i++){
        if (pthread_create(&t_ids[i], NULL, *freecpalSortedList, thread_vars) != 0){        
            perror("PTHREAD");
			exit(-2);
        }
    }
	
    /*Se realiza la espera de los hilos*/
    for (i = 0; i < n_thread; i++) {
        if (pthread_join(t_ids[i], NULL) != 0){
            perror("PTHREAD");
			exit(-2);
        }
    }
	
	/*Muestra del contenido de la lista*/
	listSort(main_list);
	listPrint(main_list);

	/*Se libera la memoria*/
    sem_destroy(&sem_index);
	sem_destroy(&sem_merge);
	free(main_list);
	free(thread_vars);
	free(paths);
	
	/*El hilo principal termina*/
    pthread_exit(NULL);
}