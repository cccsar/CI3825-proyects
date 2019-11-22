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
#include "myFind.h"

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

	for(i_=3; i_<slice_size+3 ; i_++) {
		argl[i_]= (char *) malloc( sizeof(char)* strlen(paths[acummulated + i_ - 3]) );
		strcpy(argl[i_], paths[acummulated + i_ - 3]);
	}

}


int main (int argc, char **argv) { 
	int n_files, i_, fd_tw, ub, quot, rem, p, aux, n_ps;
	int pid[MAX_PS], status[MAX_PS], counts[2]; 
	char **paths, **help;
	char *buff;

	paths = (char**) malloc(sizeof(char*)*MAX_FILES); /*perror*/
	fd_tw = open("destiny", O_WRONLY | O_CREAT | O_TRUNC | O_APPEND, MODE); /*perror*/

	/*consigo los archivos*/
	n_files = myFind(argv[2], paths); 
	n_ps = atoi(argv[1]);
	/*n_files = myFind(argv[1], paths); */


	if ( atoi(argv[1]) >= n_files ) {
		quot = 1; 
		rem = 0;
	}
	else {
		quot = n_files / atoi(argv[1]) ;
		rem = n_files % atoi(argv[1]) ;
	}


	ub = MIN( atoi(argv[1]), n_files);


	for(i_=0; i_< ub ; i_++) {
		pid[i_] = fork(); /*perror*/	
		

		if ( pid[i_] == 0 ) {

			/*esto funcion pero ser ve horrible aaaaaaaah ###*/
			/*no se como hacer free de algo que se envia por exec :(*/
			help = (char**) malloc( sizeof(char*) * (quot + 4) );

			aux = (i_ != ub-1)? quot: quot + rem; 

			getSlice(help, paths, aux, quot*i_);

			p = 0;
			p = intToString(help[1] , fd_tw, &p); 
			help[1][p] = '\0';

			p = 0;
			p = intToString(help[2], quot, &p);
			help[2][p] = '\0';
			

			execv(help[0], help); 
			perror("execv");
		}
	}


	for (i_=0 ; i_<ub ; i_++)  
		waitpid(-1,status[i_],0);  


	/*HAZ FREE*/
	for(i_=0; i_<n_paths ; i_++) 
		free(pahts[i_];
	free(paths);

	return 0; 
}


