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
#define MIN(a,b) (a < b)? a: b;

int main (int argc, char **argv) { 
	int n_files, i_, fd_tw, ub, quot;
	int pid[MAX_FD]; 
	char **paths; 

	paths = (char**) malloc(sizeof(char*)*MAX_FILES); /*perror*/
	fd_tw = open("destiny", O_WRONLY | O_CREAT | O_APPEND); /*perror*/

	/*consigo los archivos*/
	n_files = myFind(argv[1], paths); 

	/*hasta aqui funciona*/
	return 0;

	/*calculo cuantos archivos le paso a cada proceso*/
	ub = MIN( atoi(argv[1]), n_files);
	if ( atoi(argv[1]) > n_files ) {
		/*si el numero de procesos es mayor que el numero de archivos*/
		/*entonces 1 - 1*/

	}
	else {
		/*si el numero de archivos es mayor al numero de procesos*/
		/*divide and conquer ###*/
		quot = atoi(argv[1]) / n_files;
		rem = atoi(argv[1]) % n_files;

	}



	/*creo los procesos*/
	for(i_=0; i_< ub ; i_++) {
		pid[i_] = fork(); /*perror*/	
		
		if ( fd[i_] == 0 ) {
			/*ver como mierdas le pasas el fd de salida a freecpal*/

			}
	}

	
	return 0; 
}

