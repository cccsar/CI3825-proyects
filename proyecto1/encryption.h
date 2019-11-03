/*
 * Archivo: encryption.c
 *
 * Descripcion: Encripta una cadena con un desplazamiento dado.
 *
 * Autores:
 *	Carlos Alejandro Sivira Munoz 		15-11377
 * 	Cesar Alfonso Rosario Escobar		15-11295
 * Grupo: 18
 */
#ifndef __ENCRYPTION__
#define __ENCRYPTION__
#define MAXLEN 1024
/*
 *  encrypt
 * -------------------
 *  Encripta una cadena dado un desplazamiento.
 *
 *  string: Cadena de caracteres a encriptar.
 *  offset: Desplazamiento de la encriptacion.
 *
 *  Retorno: Una cadena de caracteres encriptada por el desplazamiento offset.
 */
char * encrypt(char *string, int offset);

#endif
