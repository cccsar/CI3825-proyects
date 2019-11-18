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
#include "trie.h"

#ifndef __MY_FIND__
#define __MY_FIND__

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
void traverseDir(DIR *dir, char *dirname, trie *inodes, char* paths, int ind) ; 


/* myFind
 * --------------
 *
 *
 */
int myFind (char *dirname) ; 

#endif
