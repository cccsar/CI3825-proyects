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
#define SEM_NAME "my_semaphore"
#define SEM_VALUE 1
#define SEM_MODE S_IRWXU | S_IRGRP | S_IWGRP | S_IROTH


#define MIN(a,b) (a < b)? a: b;


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


void getSlice(char** argl, char** paths, int slice_size, int acummulated) {
	int i_;
	
	/*tamano del slice tiene que ser una ctte grande*/
	
	argl[0] = NAME;
	argl[1] = (char *) malloc( sizeof(char) * MAX_DIGITS) ;
	argl[2] = (char *) malloc( sizeof(char) * MAX_DIGITS );
	argl[slice_size + 3] =  NULL; 

	for(i_=3; i_<slice_size+3 ; i_++) {
		argl[i_]= (char *) malloc( sizeof(char)* strlen(paths[acummulated + i_ - 3]) );
		strcpy(argl[i_], paths[acummulated + i_ - 3]);
	}

}


int main (int argc, char **argv) { 
	int n_files, i_, ub, quot, rem, p_, aux, merger_ps, merger_stat, aux_fd; int pid[MAX_PS], status[MAX_PS], pipe_fd[2]; 
	char **paths, **help;
	char *buff;
	char* palabra; 
	int sem_val;
	sem_t *mutex; 
	list *freq_list; 
	node *dummie; 
	int pid_dbg; 
	int count ; 

	count = 0;


	paths = (char**) malloc(sizeof(char*)*MAX_FILES); /*perror*/

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

	/*	consigo los archivos*/
	n_files = myFind(argv[2], paths); 
	printf("numero de archivos: %d\n",n_files);


	/*	creo al proceso merger*/

	switch( merger_ps = fork() ) 
	{
		case -1: 
			perror("fork");
			dprintf(stderr, "No se pudo abrir el merger\n");
			exit(-1);
		case 0: 
			/*********************CODIGO DEL MERGER*********************/

			/*	acomodo pipe*/
			if( close(pipe_fd[WRITE]) == -1)
				perror("close");

			if( dup2(pipe_fd[READ], 0) == -1)
				perror("dup2");

			if( close(pipe_fd[READ]) == -1)
				perror("close");

			listInit(freq_list); 
			printf("Esta en el merger de pid %d \n",getpid());


			/*	leo del pipe los nodos de frecuencia*/

			/*dummie = (node *) malloc( sizeof(node) );*/
			/*while( read(0, (node *)dummie, sizeof(node)) <= sizeof(node) ){ */
				/*printf("alo? %s\n",dummie->word);*/
				/*dummie = (node *) malloc( sizeof(node) );*/
				/*listInsert(freq_list, dummie); */
			/*}*/

			palabra = (char *) malloc( sizeof(char)*100 );
			while ( read(0, (char*) palabra, 100) <= 100  && count < 100) {
				printf("palabra: %s\n",palabra);
				count++;
			}
			printf("salio?\n");

			/*listSort(freq_list);*/
			/*listPrint(freq_list); */

			/*listDestroy(freq_list);*/
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

	ub = MIN(atoi(argv[1]), n_files);
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

				p_ = 0;
				p_ = intToString(help[1] , pipe_fd[WRITE], &p_); 
				help[1][p_] = '\0';

				/*cierro el pipe luego de guardar su fd*/

				p_ = 0;
				p_ = intToString(help[2], quot, &p_);
				help[2][p_] = '\0';

				/*debugging de help */
				/*for(i_=0; i_<aux+3 ; i_++) {*/
					/*printf("%s\n",help[i_]);*/
				/*}*/

				printf("Estoy en %d\n", getpid()); 
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
	waitpid(merger_ps,  merger_stat, 0); 

	/*	cierra y destruye el semaforo*/
	if( sem_unlink(SEM_NAME) == -1)
		perror("sem_ulink ");
	if( sem_close(mutex) == -1)
		perror("sem_close");

	/*	HAZ FREE*/
	for(i_=0; i_< n_files ; i_++) 
		free(paths[i_]);
	free(paths);

	return 0; 
}


