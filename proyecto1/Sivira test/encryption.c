/*
 * Archivo: encryption.c
 *
 * Descripcion: Encrypta una cadena con un desplazamiento dado
 *
 * Autores:
 *	Carlos Alejandro Sivira Munoz 		15-11377
 * 	Cesar Alfonso Rosario Escobar		15-11295
 * Grupo: 18
 */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "encryption.h"

#define MAXCHARVALUE 127
#define MINCHARVALUE 32
#define COFFSET 96

/*
 *  encrypt
 * -------------------
 *  Encripta una cadena dado un desplazamiento.
 *
 *  string: Cadena de caracteres a encriptar.
 *  offset: Desplazamiento de la encriptacion.
 *
 *  Retornp: Una cadena de caracteres encriptada por el desplazamiento offset.
 */
char* encrypt(char *string, int offset){
  	/*Establecer cadenas auxiliares y de retorno*/
	char new_str[MAXLEN];
  	char *return_str = malloc(MAXLEN * sizeof(char)); 
	int i = 0, c_offset = offset % COFFSET; 
	strcpy(new_str, string);
	if (c_offset != 0){
		/*Desplazando todos los caracteres con offset*/
		while(i < strlen(new_str)){
			if(new_str[i]){
				/*El espacio en blanco y el caracter de separacion son saltados*/
				if (new_str[i] != 32 && new_str[i] != 2){
					/*Verifica si el offset es positivo o negativo*/
					if (c_offset > 0){ 
						/*Desplaza a la izquierda*/
						if (new_str[i] + c_offset > MAXCHARVALUE){
							new_str[i] = new_str[i] + c_offset - COFFSET;
						} else {
							new_str[i] = new_str[i] + c_offset;
						}
					} else {
						/*Desplaza a la derecha*/
						if (new_str[i] + c_offset < MINCHARVALUE){
							new_str[i] = new_str[i] + c_offset + COFFSET;
						} else {
							new_str[i] = new_str[i] + c_offset;
						}
					}
				}
			} else {
				/*El caracter no pudo ser leido*/
				return NULL;
			}
			i++;
		}
	}
	/*Retorno de la nueva cadena encryptada*/
	strcpy(return_str, new_str);
	return return_str;
}
