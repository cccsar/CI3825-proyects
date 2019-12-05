/*
 * Archivo: nombre.c/.nombre.h
 *
 * Descripcion:	Archivo de cabecera para las funciones asociadas al recorrido
 * de directorio
 *
 * Autores:
 * 	Carlos Alejandro Sivira Munoz		15-11377
 * 	Cesar Alfonso Rosario Escobar		15-11295
 *
 */

#include "hasht.h"

#ifndef __MY_FIND__
#define __MY_FIND__


/* arrangeMod
 * --------------
 * Recibe dos enteros y calcula el modulo del maximo entre el minimo de ellos
 *
 * 	a: entero a considerar
 * 	b: entero a considerar
 *
 */
int arrangeMod(int a, int b); 


/* extendWord
 * --------------
 *  Actualiza la memoria alojada para un arreglo de string
 *
 *  	paths: arreglo de strings
 *  	next_ceil: referencia al tamano actual
 *
 */
void extendWord(char*** paths, int next_ceil); 


/* isTxt
 * --------------
 * Verifica que el sufijo de un string sea ".txt"
 *
 * 	name: string cuyo sufijo se verifica
 *
 */
int isTxt(char *name) ; 


/* traverseDir
 * --------------
 * Funcion que recorre directorios en busqueda de archivos que coincidan
 * con un criterio de busqueda. 
 *
 * Acumula estos archivos en un char**
 *
 *
 *  	dir: Apuntador a directorio que se recorre
 *  	dirname: nombre del directorio que se recorre
 *  	inodes: tabla de hash para inodos
 *  	paths: direccion de memoria del arreglo de strings
 *  	ind: Entero usado para indizar el proximo nombre de archivo a guardar
 *
 * Retorna el numero de archivos que cumplen los criterios mencionados
 */
void traverseDir(DIR *dir, char *dirname, hasht *inodes, char*** paths, int ind) ; 


/* myFind
 * --------------
 * Busca archivos con el sufijo .txt en una jerarquia de directorios,
 * verifica que ninguno sea un hard link de otro y recupera la lista
 * de pathnames
 
 *
 * 	dirname: nombre de la raiz del arbol de directorios
 * 	paths: direccion del arreglo de strings
 *
 * Retorna el numero de archivos que cumplen un criterio
 */
int myFind (char *dirname, char*** Paths) ; 

#endif
