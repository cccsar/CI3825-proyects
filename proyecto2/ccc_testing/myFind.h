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

/*
 * --------------
 *
 *
 */
int arrangeMod(int a, int b); 


/*
 * --------------
 *
 *
 */
void extendWord(char*** paths, int next_ceil); 

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
void traverseDir(DIR *dir, char *dirname, hasht *inodes, char*** paths, int ind) ; 


/* myFind
 * --------------
 *
 *
 */
int myFind (char *dirname, char*** Paths) ; 
#endif
