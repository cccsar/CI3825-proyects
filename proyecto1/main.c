/* 
 * Archivo: create.c 
 *
 * descripcion: Archivo fuente con las funciones necesarios para la creacion
 * de un archivo .mytar
 *
 * Autores:
 *	Carlos Alejandro Sivira Munoz 		15-11377
 * 	Cesar Alfonso Rosario Escobar		15-11295
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
#include "create.h"
#include "extract.h"
//#include "parser.h"
//#include "encryption.h"


int main(int argc, char** argv) {
	
	/* CREACION */
	//createMyTar(argc, argv);

	/* EXTRACCION */
	extractMyTar(argv);

	return 0;
}
