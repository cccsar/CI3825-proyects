/*
* File: encryption.c
* Description: Encrypt or decrypt a string
* Author: Carlos Sivira 15-11377
* Group: 18
*/
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "encryption.h"

#define MAXCHARVALUE 254
#define MINCHARVALUE 32
#define CHAROFFSET 222
/*
 * Function: encrypt
 * -------------------
 *  Encrypt a string using a specific offset
 *
 *  string: Pointer of characters to be encrypted
 *  offset: Offset used for the encryption
 *
 *  Return: The encryted string with the specific offset.
 */
char * encrypt(char *string, int offset){
  	/*Seeting the temporal character array and the return variable*/
	char parameter[MAXLEN];
  	char *return_str = malloc(sizeof(MAXLEN) * sizeof(char));
	int i = 0, newOffset = offset % 222;
	strcpy(parameter, string);
	if (newOffset != 0){
		/*Shifting all the characters with the offset value*/
		while(i < strlen(parameter)){
			if(parameter[i]){
				/*Skip the space character*/
				if (parameter[i] != 32){
					/*Verify if the offset is possitive or negative*/
					if (newOffset > 0){
						printf("positivo\n");
						if (parameter[i] + newOffset > MAXCHARVALUE){
							parameter[i] = (int)(parameter[i]) + newOffset - CHAROFFSET;
						} else {
							parameter[i] = (int)(parameter[i]) + newOffset;
							printf("%i \n", parameter[i]);
						}
					} else {
						printf("negativo\n");
						if (parameter[i] + newOffset < MINCHARVALUE){
							parameter[i] = (int)(parameter[i]) + newOffset + CHAROFFSET;
						} else {
							printf("%i \n", parameter[i]);
							parameter[i] = (int)(parameter[i]) + newOffset;
						}
					}
				}
			} else {
				/*Cant read the currect charecter*/
				return NULL;
			}
			i++;
		}
	}
	/*Return the new shifted string*/
	strcpy(return_str, parameter);
	return return_str;
}
