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



#ifndef __SOMETHING__
#define

/*	CODE GOES HERE		*/


#endif
typedef struct { 
	/* podria ser ino_t o long */
	int inode; 
	char *name; 
} dict_entry;

typedef struct {
	dict_entry* entries; 
} dict; 
