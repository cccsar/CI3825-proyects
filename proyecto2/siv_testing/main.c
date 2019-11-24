#include <stdio.h> 
#include <stdlib.h>
#include <sys/types.h> 
#include <sys/stat.h> 
#include <fcntl.h>  
#include <dirent.h> 
#include <string.h> 
#include <unistd.h>
#include <string.h>
#include "list.h"

#define TRUE 1
#define FALSE 0
#define WORD_SIZE 20

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

/* Funcion memoryError
 * -------
 *	Funcion que imprime un mensaje estandar de error de memoria.
 */
void memoryError() {
	perror("Error, memoria insuficiente\n");
}

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

void AddSort()
{
	if (!(fp = fopen(argv[i],"r")) ){
		dprintf(stderr, "%s",argv[i]);
		perror("fopen"); 
		exit(-3); 
	}

	/*Se reserva espacio para la primera palabra del archivo*/
	current_word = (char*) malloc(WORD_SIZE*sizeof(char));
	if (!current_word) {
		memoryError();	
		exit(-2);
	}

	while( fscanf(fp,"%s",current_word) != EOF) { 

		space = (node*) malloc( sizeof(node) ) ; 
		if(!space) {
			memoryError(); 	
			exit(-2);
		}

		nodeInit(space, current_word); 

		/*En caso de que solo la frecuencia de un elemento */
		/* se aumente como ese nodo ya esta creado, se libera*/
		/* la memoria que se almaceno para insertarlo.*/
		if (listInsert(my_list, space) < 0) {
			free(space);
			free(current_word);
		}

		/*Se reserva espacio para la i-esima palabra*/ 
		/* del archivo*/
		current_word = (char*) malloc(WORD_SIZE*sizeof(char)); 			
		if(!current_word) {
			memoryError(); 
			exit(-2); 
		}

	}
	listSort(my_list);	
}

int main (int argc, char **argv) 
{ 
	/*Definicion de las variables*/
	FILE *fp; 
	int i,j, fd;
	char *current_word;
	node *space;
	list *my_list;

	/*Verificacion del numero de argumentos*/
	if (argc != atoi(argv[2]) + 3) { 
		perror("Error, el formato es:\t ./freecpal <numero de archivos>"
			" {lista de nombre de archivos}\n"); 
		exit(-1); 
	}

	/*Inicializacion de la lista principal*/
 	my_list = (list*)malloc(sizeof(list));
	if (!my_list) {
		memoryError();
		exit(-2);
	}
	listInit(my_list);

	/*Generar hilos para ejecutar AddSort*/

	free(my_list);

	exit(0);
}
