/*
 * Archivo: merge.c/.merge.h
 *
 * Descripcion:	
 *
 * Autores:
 * 	Carlos Alejandro Sivira Munoz		15-11377
 * 	Cesar Alfonso Rosario Escobar		15-11295
 *
 */

#ifndef __MERGE__
#define __MERGE__

#include "list.h"

list all_words;
/*  Funcion: Merge
 *  --------------
 *	Convina de forma ordenada la lista list_a con las lista list_a.
 *
 *	list_a: Lista de palabras con orden alfanumerico y por frecuencia.
 *  list_b: Lista de todas las palabras con orden alfanumerico y por frecuencia.
 * 
 *  return: lista con el contenido de list_a y list_b de forma ordenada,
 */
list* Merge(list *list_a, list *list_b);

#endif