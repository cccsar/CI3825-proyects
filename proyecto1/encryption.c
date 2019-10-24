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
/*
 *  encrypt
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
	int i = 0;
  strcpy(parameter, string);
  /*Shifting all the characters with the offset value*/
	while(i < strlen(parameter)){
			if(parameter[i]){
        parameter[i] = parameter[i] + offset;
      }
      i++;
  }
  /*Return the new shifted string*/
  strcpy(return_str, parameter);
  return return_str;
}
