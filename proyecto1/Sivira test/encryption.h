/*
* File: encryption.h
* Description: Encrypt or decrypt a string
* Author: Carlos Sivira 15-11377
* Group: 18
*/
#ifndef __ENCRYPTION__
#define __ENCRYPTION__
#define MAXLEN 1024
/*
 * Function: encrypt
 * -------------------
 *  Encrypt a string using a specific offset
 *
 *  string: string: Pointer of characters to be encrypted
 *  offset: Offset used for the encryption
 *
 *  Return: The encryted string with the specific offset.
 */
char * encrypt(char *string, int offset);

#endif
