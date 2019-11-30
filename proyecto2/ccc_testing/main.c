/*
 * Archivo: nombre.c/.nombre.h
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
#include <fcntl.h>  
#include <dirent.h> 
#include <string.h> 
#include <unistd.h>
#include <string.h>
#include <signal.h>
#include <semaphore.h>
#include <errno.h>
#include "myFind.h"
#include "list.h"

#define TRUE 1
#define FALSE 0

#define WRITE 1
#define READ 0

#define MAX_PATH 5000

#define MAX_PS 1000 
#define MAX_FILES 419 

#define FD_DIGITS 5
#define FILES_DIGITS 10 

#define MAX_DIGITS 20

#define EXEC_NAME "freecpal"
#define FREECPAL 8

#define SMP0 "/mutex"
#define SMP1 "/sem_reader"
#define SMP2 "/sem_writer"
#define MODE S_IRWXU | S_IRGRP | S_IWGRP | S_IROTH

#define MIN(a,b) (a < b)? a: b;


/* intToString
 * --------------
 *
 *
 */
int intToString(char* arr, int a, int *i) { 

	if( a/10 != 0 )  {
		*i = intToString(arr, a/10, i) ;
		arr[*i] = a%(10) + 48; 
	}
	else   
		arr[*i] = a + 48;

	*i += 1;

	return *i; 
}


/* getSlice
 * --------------
 *
 *
 */
void getSlice(char** argl, char** paths, int slice_size, int acummulated) {
	int i_, p_, length;
	
	/*LLENADO DE ARREGLO DE EXECV*/
	

	/*asigno nombre, numero de archivos y null terminator*/
	argl[0] = EXEC_NAME;
	argl[1] = (char *) malloc( sizeof(char) * MAX_DIGITS );

	p_ = 0;
	length = intToString(argl[1], slice_size, &p_);
	argl[1][length] = '\0';

	argl[slice_size + 2] =  NULL; 

	/*asigno nombres de archivo*/
	for(i_=2; i_<slice_size+2 ; i_++) {
		argl[i_]= (char *) malloc( sizeof(char)* strlen(paths[acummulated + i_ - 2]) );
		strcpy(argl[i_], paths[acummulated + i_ - 2]);
	}

}



/* main
 * --------------
 *
 *
 */
int main (int argc, char **argv) { 
	int i_;

	int n_files, n_ps, quot, rem, p_, aux; 

	/*PS STUFF*/
	int status[MAX_PS], merger_stat; 
       	pid_t pid[MAX_PS], merger_pid; 
	
	/*PIPE STUFF*/
	int pipe_fd[2]; 

	/*ARRAYS OF STRINGS*/
	char **paths , *buff;

	int pid_dbg; 

	/*SEMAPHORE SUFF*/
	sem_t *mutex, *smp_r, *smp_w; 
	int *sem_deb, *r_controller; 
	int trash;

	/*INSIDE MERGER STUFF*/
	char* word; 
	int frequency, terminated;
	int* word_size; 
	list *freq_list; 
	node *dummie; 

	/*INSIDE COUNTERS STUFF*/
	char **help;


	/*********************BEGINNING*********************/
	

	paths = (char**) malloc(sizeof(char*)*MAX_FILES); /*perror*/


	/*CREO PIPE*/
	if( pipe(pipe_fd)  == -1) {
		/*### usar sleep para asegurar apertura???*/
		fprintf(stderr, "Error abriendo pipe");
		perror("pipe");
		exit(-1);
	}

	/*ELIMINO SEMAFOROS POR SI EXISTEN*/
	trash = sem_unlink(SMP0);
	if( trash != 0 && errno != ENOENT)
		perror("sem_unlink");	

	trash = sem_unlink(SMP1);
	if( trash != 0 && errno != ENOENT)
		perror("sem_unlink");	

	trash = sem_unlink(SMP2);
	if( trash != 0 && errno != ENOENT)
		perror("sem_unlink");	


	/*ENCUENTRO ARCHIVOS */
	n_files = myFind(argv[2], paths); 
	printf("numero de archivos: %d\n",n_files);


	/*CALCULO NUMERO DE PROCESOS A USAR*/
	n_ps = MIN(atoi(argv[1]), n_files);
	printf("Numero de procesos a usar %d\n",n_ps);


	/*CREO SEMAFORO*/
	if( ( mutex = sem_open(SMP0, O_CREAT | O_RDWR, MODE, 1) ) == SEM_FAILED ) {
		perror("sem_open");

		exit(-2); 
	}

	if( ( smp_r = sem_open(SMP1, O_CREAT | O_RDWR, MODE, n_ps) ) == SEM_FAILED) {
		perror("sem_open");

		exit(-2); 
	}

	if( ( smp_w = sem_open(SMP2, O_CREAT | O_RDWR, MODE, 0) )  == SEM_FAILED) {
		perror("sem_open");

		exit(-2); 
	}





			/*********************CODIGO DEL MERGER*********************/


	switch( merger_pid = fork() ) 
	{
		case -1: 
			perror("fork");
			dprintf(stderr, "No se pudo abrir el merger\n");

			exit(-1);
		case 0: 

			if( close(pipe_fd[WRITE]) == -1)
				perror("close");

			if( dup2(pipe_fd[READ], 0) == -1)
				perror("dup2");

			if( close(pipe_fd[READ]) == -1)
				perror("close");


			word_size = (int *) malloc( sizeof(int) );
			r_controller = (int *) malloc( sizeof(int) );
			freq_list = (list *) malloc( sizeof(list) );


			listInit(freq_list); 


			fprintf(stderr,"En el merger %d\n", getpid()); 
			/*	leo del pipe los nodos de frecuencia*/

			while (terminated != n_ps) {

				if( sem_wait(smp_w) == -1)
					perror("sem_wait");

				if( sem_wait(mutex)  == -1)
					perror("sem_wait");

				/*********************REGION CRITICA *********************/

				if( read(0, r_controller, sizeof(int) ) == -1) /*###*/
					perror("read");

 
				if( *r_controller != -1) { 

					dummie = (node *) malloc( sizeof(node) );

					if( read(0, word_size, sizeof(int) ) == -1) /*###*/
						perror("read");

					word = (char *) malloc( *word_size * sizeof(char) ); /*###*/
					if( read(0, word, *word_size)  == -1)
						perror("read");

					if( read(0, &frequency, sizeof(int) )  == -1) /*###*/
						perror("read");


					nodeInit(dummie, word, frequency); 
					listInsert(freq_list, dummie);

				}
				else {
					terminated++; 
					fprintf(stderr,"terminated already %d\n",terminated);
				}

				/*********************FIN DE REGION CRITICA *********************/

				if( sem_post(mutex)  == -1)
					perror("sem_post");

				if( sem_post(smp_r)  == -1)
					perror("sem_post");


				if ( *r_controller != -1) 
					fprintf(stderr, "Debugging\nword: %s\tfrequency: %d\n",word, frequency); 

				fprintf(stderr,"terminados %d",terminated);

			}


			listSort(freq_list);
			listPrint(freq_list); 

			listDestroy(freq_list);

			exit(0);
		default: 
			break; 
	}


			/*********************FIN DE CODIGO DEL MERGER*********************/


	/*	calcula la reparticion de archivos*/
	if ( n_ps >= n_files ) {
		quot = 1; 
		rem = 0;
	}
	else {
		quot = n_files / atoi(argv[1]) ;
		rem = n_files % atoi(argv[1]) ;
	}




			/*********************CODIGO DE CONTADORES*********************/


	for(i_=0; i_< n_ps ; i_++) {

		switch( pid[i_] = fork() ) 
		{
			case -1: 
				perror("fork"); 
				exit; 
			case 0: 
				/*aun tengo que averiguar como liberar espacio de help*/

				if ( i_ != n_ps - 1) 
					aux = quot; 
				else 
					aux = quot + rem; 
					

				help = (char**) malloc( sizeof(char*) * (aux + 3) );


				getSlice(help, paths, aux, quot*i_);
				
				p_ = 0;
				p_ = intToString(help[1], aux, &p_);
				help[1][p_] = '\0';


				/*debugging de help */
				for(i_=0; i_<aux+2 ; i_++) {
					printf("%s ",help[i_]);
				}
				printf("\n"); 


				/*cierro los pipes*/
				if( close(pipe_fd[READ])  == -1)
					perror("close");

				if( dup2(pipe_fd[WRITE],1)  == -1)
					perror("dup2");

				if( close(pipe_fd[WRITE]) == -1)
					perror("close");


				execv(help[0], help); 

				perror("execv");
			default: 
				continue;

		}
	}

			/*********************FIN DE CODIGO DE CONTADORES*********************/
	
	
	/*********************END*********************/

	/*CIERRO PIPES*/
	if( close(pipe_fd[0]) == -1)
		perror("close");

	if( close(pipe_fd[1]) == -1)
		perror("close");


	/*ESPERA PROCESOS*/
	for (i_=0 ; i_<n_ps ; i_++)   {

		if( (pid_dbg = wait(&status[i_]) ) == -1) 
			perror("waitpid ");

		printf("%d termino\n",pid_dbg);
	}

	if( waitpid(merger_pid,  merger_stat, 0)  == -1)
		perror("waitpid");


	/*ELIMINO LOS SEMAFOROS*/
	if( sem_unlink(SMP0) == -1)
		perror("sem_unlink");

	if( sem_unlink(SMP1) == -1)
		perror("sem_unlink");

	if( sem_unlink(SMP2) == -1)
		perror("sem_unlink");
	

	/*CIERRO LOS SEMAFOROS*/
	if( sem_close(mutex) == -1)
		perror("sem_close");

	if( sem_close(smp_r) == -1)
		perror("sem_close");

	if( sem_close(smp_w) == -1)
		perror("sem_close");


	/*LIBERA ESPACIO*/
	for(i_=0; i_< n_files ; i_++) 
		free(paths[i_]);

	free(paths);


	return 0; 
}


