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
#include "myFind.h"
#include "list.h"

#define TRUE 1
#define FALSE 0
#define WRITE 1
#define READ 0

#define MAX_PATH 5000
#define MAX_PS 20
#define MAX_FILES 419


#define FD_DIGITS 5
#define FILES_DIGITS 10 
#define MAX_DIGITS 20
#define NAME "freecpal"
#define FREECPAL 8
#define SEM_NAME "/my_semaphore"
#define SEM_VALUE 1
#define SEM_MODE S_IRWXU | S_IRGRP | S_IWGRP | S_IROTH


#define MIN(a,b) (a < b)? a: b;

int count; 


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
	int i_;
	
	/*tamano del slice tiene que ser una ctte grande*/
	
	argl[0] = NAME;
	argl[1] = (char *) malloc( sizeof(char) * MAX_DIGITS) ;
	argl[2] = (char *) malloc( sizeof(char) * MAX_DIGITS );
	argl[3] = (char *) malloc( sizeof(char) * MAX_DIGITS );
	argl[slice_size + 4] =  NULL; 

	for(i_=4; i_<slice_size+4 ; i_++) {
		argl[i_]= (char *) malloc( sizeof(char)* strlen(paths[acummulated + i_ - 4]) );
		strcpy(argl[i_], paths[acummulated + i_ - 4]);
	}

}


void evaHandler() { 
	count++; 
	fprintf(stderr, "RECIBI UNA PUTA SENAL cuenta %d\n", count);
}


/* main
 * --------------
 *
 *
 */
int main (int argc, char **argv) { 
	int n_files, i_, ub, quot, rem, p_, aux, merger_pid, merger_stat, aux_fd;
       	int pid[MAX_PS], status[MAX_PS], pipe_fd[2]; 
	char **paths, **help;
	char *buff;

	int pid_dbg; 
	int *sem_deb; 

	sem_t *mutex; 
	list *freq_list; 
	node *dummie; 

	char* word; 
	int frequency;

	/*sem_unlink(SEM_NAME);*/
	/*return 0;*/

	signal(SIGCHLD, evaHandler);
	paths = (char**) malloc(sizeof(char*)*MAX_FILES); /*perror*/
	count = 0;

	/*	creo el pipe*/
	if( pipe(pipe_fd)  == -1) {
		fprintf(stderr, "Error abriendo pipe");
		perror("pipe");
		exit(-1);
	}

	/*	creo el semaforo*/
	if( ( mutex = sem_open(SEM_NAME, O_CREAT , SEM_MODE, SEM_VALUE) ) == SEM_FAILED)
		perror("sem_open");
	printf("Direccion del semaforo %p\n", (void *)mutex);
	

			/* ### DBG */	
	sem_deb = (int *) malloc( sizeof(int) ); 
	if( sem_getvalue(mutex, sem_deb) == -1)
		perror("sem_getvalue");
	fprintf(stderr,"Valor inicial del semaforo: %d\n", *sem_deb);
			/* ### DBG */	


	/*if( sem_close(mutex) == -1)*/
		/*perror("sem_close");*/


	/*	consigo los archivos*/
	n_files = myFind(argv[2], paths); 
	printf("numero de archivos: %d\n",n_files);


	ub = MIN(atoi(argv[1]), n_files);

	switch( merger_pid = fork() ) 
	{
		case -1: 
			perror("fork");
			dprintf(stderr, "No se pudo abrir el merger\n");
			exit(-1);
		case 0: 
			/*********************CODIGO DEL MERGER*********************/
			/*	acomodo pipe*/
			/*signal(SIGUSR1, evaHandler);*/

			if( close(pipe_fd[WRITE]) == -1)
				perror("close");

			if( dup2(pipe_fd[READ], 0) == -1)
				perror("dup2");

			if( close(pipe_fd[READ]) == -1)
				perror("close");

			freq_list = (list *) malloc( sizeof(list) );
			listInit(freq_list); 


			printf("\t\testoy en el merger de pid %d\n", getpid() );
			do {
				pause; 
			}while (count != ub);

			/*	leo del pipe los nodos de frecuencia*/

			/*while ( count != ub )  {*/
			while (TRUE) {
				/*count ++; */
				/*********************REGION CRITICA *********************/
				/*if( sem_wait(mutex) == -1)*/
					/*perror("sem_wait");*/


				if( scanf("%s", word) == -1)
					perror("scanf");
				if( scanf("%d", &frequency)  == -1)
					perror("scanf");


				/*if( sem_post(mutex) == -1)*/
					/*perror("sem_post");*/
				/*********************FIN DE REGION CRITICA *********************/


				printf("word: %s, frequency: %d\n",word , frequency);
				dummie = (node *) malloc( sizeof(node) );
				nodeInit(dummie, word, frequency); 
				printf("hizo algo: palabra %s frecuencia %d\n",dummie->word, dummie->frequency);

				listInsert(freq_list, dummie);
				sleep(2);
			}

			printf("salio de la insercion\n");

			/*listSort(freq_list);*/
			listPrint(freq_list); 
			printf("size: %d\n",freq_list->size); 

			listDestroy(freq_list);
			exit(0);
		default: 
			break; 
	}




	/*	calcula la reparticion de archivos*/
	if ( atoi(argv[1]) >= n_files ) {
		quot = 1; 
		rem = 0;
	}
	else {
		quot = n_files / atoi(argv[1]) ;
		rem = n_files % atoi(argv[1]) ;
	}

	printf("Numero de procesos a usar %d\n",ub);

	/*	crea los procesos contadores*/
	for(i_=0; i_< ub ; i_++) {

		switch( pid[i_] = fork() ) 
		{
			case -1: 
				perror("fork"); 
				exit; 
			case 0: 
				/*********************CODIGO DE CONTADORES*********************/

				/*aun tengo que averiguar como liberar espacio de help*/

				/*esto funcion pero ser ve horrible aaaaaaaah ###*/
				/*no se como hacer free de algo que se envia por exec :(*/

				help = (char**) malloc( sizeof(char*) * (quot + 4) );

				aux = (i_ != ub-1)? quot: quot + rem; 

				getSlice(help, paths, aux, quot*i_);


				/*anado argumentos numericos a help*/
				p_ = 0;
				p_ = intToString(help[1] , pipe_fd[WRITE], &p_); 
				help[1][p_] = '\0';

				p_ = 0;
				p_ = intToString(help[2], aux, &p_);
				help[2][p_] = '\0';

				p_ = 0;
				p_ = intToString(help[3], merger_pid, &p_);
				help[2][p_] = '\0';


				/*debugging de help */
				/*for(i_=0; i_<aux+3 ; i_++) {*/
					/*printf("%s\n",help[i_]);*/
				/*}*/

				printf("estoy en el proceso: %d\n", getpid()); 

				/*cierro los pipes*/

				if( close(pipe_fd[READ])  == -1)
					perror("close");

				if( (aux_fd = dup2(pipe_fd[WRITE],1))  == -1)
					perror("dup2");

				if( close(pipe_fd[WRITE]) == -1)
					perror("close");
				
				execv(help[0], help); 
				perror("execv");
			default: 
				continue;

		}
	}

	
	
	/*	cierra los extremos del pipe en el padre*/
	close(pipe_fd[0]);
	close(pipe_fd[1]);


	/*	espera que los contadores terminen*/
	for (i_=0 ; i_<ub ; i_++)   {
		if( (pid_dbg = wait(&status[i_]) ) == -1) 
			perror("waitpid ");
		printf("%d termino\n",pid_dbg);
	}

	/*	espera a que el merger termine*/
	if( waitpid(merger_pid,  merger_stat, 0)  == -1)
		perror("waitpid");

	/*	cierra y destruye el semaforo*/

	if( sem_unlink(SEM_NAME) == -1)
		perror("sem_ulink ");


	/*	HAZ FREE*/
	for(i_=0; i_< n_files ; i_++) 
		free(paths[i_]);
	free(paths);

	return 0; 
}


