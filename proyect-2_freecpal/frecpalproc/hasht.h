/*
 * Archivo: hasht.h
 *
 * Descripcion:	Archivo de cabecera para la estructura hasht
 *
 * Autores:
 * 	Carlos Alejandro Sivira Munoz		15-11377
 * 	Cesar Alfonso Rosario Escobar		15-11295
 *
 */
#include "singly.h"

#ifndef __HASHT__
#define __HASHT__

#define HASH_SIZE 419

/* Tipo: hasht
 * --------------
 * Tabla de hash, se implimenta como un arreglo de listas singly de 
 * tamano igual a un primo no muy grande
 */
typedef singly * hasht[HASH_SIZE]; 

/* hashtInit
 * --------------
 * Da un valor inicial a cada entra de la tabla de hash
 *
 *	h_: tabla de hash a inicializar
 */
void hashtInit(hasht h_);


/* hashtDestroy
 * --------------
 * Libera la memoria de cada lista lista asociada a la tabla
 *
 * 	h_: tabla de hash a destruir
 *
 */
void hashtDestroy(hasht h_) ;


/* hashtInsert
 * --------------
 * Inserta un elemento en la tabla
 *
 * 	h_: tabla de hash que recibe el elemento
 *	number: elemento a insertar
 */
int hashtInsert(hasht h_, int number);

#endif
