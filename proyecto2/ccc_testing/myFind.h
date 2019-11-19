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

#ifndef __MY_FIND__
#define __MY_FIND__

#include "hasht.h"

/* isTxt
 * --------------
 *
 *
 */
int isTxt(char *name) ; 


/* traverseDir
 * --------------
 *
 *
 */
void traverseDir(DIR *dir, char *dirname, hasht *inodes, char* paths, int ind) ; 


/* myFind
 * --------------
 *
 *
 */
int myFind (char *dirname) ; 

#endif
