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

#define MAXCHARVALUE 127
#define MINCHARVALUE 32
#define COFFSET 96
/*
 * 	encrypt
 * -------------------
 *  Encrypt a string using a specific offset
 *
 *  string: Pointer of characters to be encrypted
 *  offset: Offset used for the encryption
 *
 *  Return: The encryted string with the specific offset.
 */
char* encrypt(char *string, int offset){
  	/*Seeting the temporal character array and the return variable*/
	char new_str[MAXLEN];
  	char *return_str = malloc(sizeof(MAXLEN) * sizeof(char));
	int i = 0, c_offset = offset % COFFSET;
	strcpy(new_str, string);
	if (c_offset != 0){
		/*Shifting all the characters with the offset value*/
		while(i < strlen(new_str)){
			if(new_str[i]){
				/*Skip the space character*/
				if (new_str[i] != 32){
					/*Verify if the offset is possitive or negative*/
					if (c_offset > 0){
						if (new_str[i] + c_offset > MAXCHARVALUE){
							new_str[i] = new_str[i] + c_offset - COFFSET;
						} else {
							new_str[i] = new_str[i] + c_offset;
						}
					} else {
						if (new_str[i] + c_offset < MINCHARVALUE){
							new_str[i] = new_str[i] + c_offset + COFFSET;
						} else {
							new_str[i] = new_str[i] + c_offset;
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
	strcpy(return_str, new_str);
	return return_str;
}
