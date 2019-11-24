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

#define MAX_PATH 5000
#define MAX_PS 20
#define MAX_FILES 419

#define MODE S_IRWXU | S_IRGRP | S_IROTH 

#define FD_DIGITS 5
#define FILES_DIGITS 10 
#define MAX_DIGITS 20
#define NAME "freecpal"
#define FREECPAL 8
#define SEM_NAME "sem"

#define WRITE 1
#define READ 0

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
	argl[slice_size + 3] =  NULL; 

	argl[1] = (char *) malloc( sizeof(char) * MAX_DIGITS) ;
	argl[2] = (char *) malloc( sizeof(char) * MAX_DIGITS );
	argl[3] = SEM_NAME;  

	for(i_=4; i_<slice_size+4 ; i_++) {
		argl[i_]= (char *) malloc( sizeof(char)* strlen(paths[acummulated + i_ - 3]) );
		strcpy(argl[i_], paths[acummulated + i_ - 3]);
	}

}


int main (int argc, char **argv) { 
	int n_files, i_, ub, quot, rem, p_, aux, merger_ps, merger_stat, aux_fd; 
	int pid[MAX_PS], status[MAX_PS], pipe_fd[2]; 
	char **paths, **help;
	char *buff;
	char* palabra; 
	sem_t *mutex; 
	list *freq_list; 
	node *dummie; 


	paths = (char**) malloc(sizeof(char*)*MAX_FILES); /*perror*/
	pipe(pipe_fd); 
	if( unlink(SEM_NAME) == -1)
		perror("unlink");
	sem_open(SEM_NAME, O_CREAT , 0664, 1); /* ### */

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
			/*CODIGO DEL MERGER*/

			/*acomodo pipe*/
			if( close(pipe_fd[WRITE]) == -1)
				perror("close");
			if( dup2(pipe_fd[READ], 0) == -1)
				perror("dup2");
			if( close(pipe_fd[READ]) == -1)
				perror("close");

			listInit(freq_list); 
			printf("Esta en el merger de pid %d \n",getpid());

			/*dummie = (node *) malloc( sizeof(node) );*/
			/*while( read(0, (node *)dummie, sizeof(node) ) <= sizeof(node) ){ */
				/*dummie = (node *) malloc( sizeof(node) );*/
				/*printf("alo? %s\n",dummie->word);*/
				/*listInsert(freq_list, dummie); */
			/*}*/
			palabra = (char *) malloc( sizeof(char)*100 );
			while ( read(0, (char*) palabra, 100) <= 100 ) {
				printf("Dentro del semaforo\n");
				/*printf("%s\n",palabra);*/
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
	for (i_=0 ; i_<ub ; i_++)  
		waitpid(-1,status[i_],0);  

	/*	espera a que el merger termine*/
	waitpid(merger_ps,  merger_stat, 0); 

	/*	destruye el semaforo*/
	sem_destroy(mutex); 

	/*	HAZ FREE*/
	for(i_=0; i_< n_files ; i_++) 
		free(paths[i_]);
	free(paths);

	return 0; 
}


