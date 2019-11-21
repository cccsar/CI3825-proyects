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
#define MAX_FD 20
#define MAX_FILES 419
#define FREECPAL 8
#define FD_DIGITS 5
#define FILES_DIGITS 10 

#define MIN(a,b) (a < b)? a: b;


char** getSlice(char** paths, int this, int hm) {
	int i_;
	char **new; 
	
	new = (char**) malloc( sizeof(char*) * (this + 3) );
	
	/*reservo espacio para el nombre del ejecutable*/
	new[0] = (char *) malloc( sizeof(char) * FREECPAL );
	/*reservo espacio para el file descriptor de escritura*/
	new[1] = (char *) malloc( sizeof(char) * FD_DIGITS) ;
	/*reservo espacio para el numero de archivos*/
	new[2] = (char *) malloc( sizeof(char) * FILES_DIGITS );

	/*aqui incluyo cada pathname*/
	for(i_=0; i_<this-3 ; i_++) {
		new[i_+3]= (char *) malloc( sizeof(char)* strlen(paths[hm + i_]);
		strcpy(new[i_], paths[hm + i_]);
	}

	return new;
}

int main (int argc, char **argv) { 
	int n_files, i_, fd_tw, ub, quot;
	int pid[MAX_FD]; 
	char **paths; 
	char **help;

	paths = (char**) malloc(sizeof(char*)*MAX_FILES); /*perror*/
	fd_tw = open("destiny", O_WRONLY | O_CREAT | O_APPEND); /*perror*/

	/*consigo los archivos*/
	n_files = myFind(argv[1], paths); 

	/*hasta aqui funciona*/
	return 0;

	/*calculo cuantos archivos le paso a cada proceso*/
	if ( atoi(argv[1]) >= n_files ) {
		/*si el numero de procesos es mayor que el numero de archivos*/
		/*entonces 1 - 1*/

	}
	else {
		/*si el numero de archivos es mayor al numero de procesos*/
		/*divide and conquer ###*/
		quot = atoi(argv[1]) / n_files;
		rem = atoi(argv[1]) % n_files;
	}


	ub = MIN( atoi(argv[1]), n_files);

	/*creo los procesos*/
	for(i_=0; i_< ub ; i_++) {
		pid[i_] = fork(); /*perror*/	
		
		if ( fd[i_] == 0 ) {
			/*ver como mierdas le pasas el fd de salida a freecpal*/
			if (i_ != ub - 1)
				help = getslice(paths, quot, quot*i_ );
			else
				help = getslice(paths, quot + rem, quot*i_);

			execv(help[0], help); 
		}
	}

	
	eturn 0; 
}

