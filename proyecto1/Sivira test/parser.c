/*
* Archivo: parser.c
* Description: Read the comand line and return the content in a specific format
* Author: Carlos Sivira 15-11377
* Group: 18
*/
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "parser.h"
/*
*/
int f_argument(char *string){
	const char c[2] = ".";
	char *token;
	token = strtok(string, c);
	token = strtok(NULL, c);
	if (!token){
		return -1;
	}
	return strcmp(token, "mytar");
}

/*
*/
int set_options(mytar_instructions *instructions, char c){
	switch (c)
	{
		case 'c':
			instructions->mytar_options[0] = 1;
			break;
		case 't':
			instructions->mytar_options[1] = 1;
			break;
		case 'x':
			instructions->mytar_options[2] = 1;
			break;
		case 'o':
			instructions->mytar_options[3] = 1;
			break;
		case 'n':
			instructions->mytar_options[4] = 1;
			break;
		case 'z':
			instructions->mytar_options[5] = 1;
			break;
		case 'y':
			instructions->mytar_options[6] = 1;
			break;
		case 'v':
			instructions->mytar_options[7] = 1;
			break;
		case 'f':
			instructions->mytar_options[8] = 1;
			break;
		case 's':
			instructions->mytar_options[9] = 1;
			break;
		default:
			/*Throwing an error for undefined mytar option*/
			printf("%s undefined mytar option\n");
			return -1;
			break;
	}
	return 0;
}
/*
*/
int set_arguments(mytar_instructions *inst, char *c, char lo, int counter){
	char *aux_string = malloc(MAXLEN);
	char *aux_value = malloc(MAXLEN);
	/*Saving the corresponding argument to its mytar option*/
	switch (lo)
	{
		case 'o':
			strcpy(inst->output_directory, (c));
			break;
		case 'z':
			inst->encryption_offset = -atoi(c);
			break;
		case 'y':
			inst->encryption_offset = atoi(c);
			break;
		case 'v':
			inst->output_verbose = atoi(c);
			break;
		case 'f':
			/*Saving the f arguments*/
			strcpy(aux_string, c);
			strcpy(aux_value, c);
			/*Verify if the arg is the first argument .mytar*/
			if (f_argument(aux_string) == 0){
				inst->creation_directory[0] = aux_value;
			} else {
				inst->creation_directory[counter] = aux_value;
			}
			counter++;
			break;
		case 's':
			strcpy(inst->file_extraction, c);
			break;
	}
	return counter;
}
/*
 *  parse
 * -------------------
 *  Read the command line and store that values in an organized structure
 *
 *  num_arguments: Number of arguments to read
 *  arguments: Arguments to store
 *
 * Return:  The pointer to the position of the struct mytar_instructions.
 *			If an error exist, the return value is NULL
 */
mytar_instructions* parse(int num_arguments, char **arguments){
	int i;
	/*The number of arguments of f option*/
	int f_count = 1;
	/*Store the arguments of f option*/
	char f_string[MAXLEN];
	/*Initialize the mytar_instructions structure*/
	mytar_instructions *instructions = instructionsInit();
	/*Verify if the structure was initialized correctly*/
	if (!instructions){
		perror("Error: ");
		return NULL;
	}
	/*Iterate over the arguments of the mytar executable*/
	for (i = 1; i < num_arguments; i++){
		/*Character array to storing temporal string values*/
		char *arg = malloc(MAXLEN);
		int j = 0;
		strcpy(arg, arguments[i]);
		/*Iterate over the characters of arg array*/
		while(j < strlen(arg)){
			/*Saving the last character visited*/
			char last;
			/*Look if the character is the beginning of a mytar option*/
			if (arg[j] == '-' || arg[j] == '-'){
				/*Counter of the while cycle*/
				j++;
				/*Looking for the options that will be used*/
				while(arg[j]){
					if (set_options(instructions ,arg[j]) != 0){
						return NULL;
					}
					last = arg[j];
					j++;
				}
			/*Looking for arguments for mytar options*/
			} else {
				f_count = set_arguments(instructions, arg, last, f_count);
			}
		}
	}
	return instructions;
}
/*
 *  instructionsInit
 * -------------------
 *  Initialize the structure tar_instructions
 *
 * 	Return: The pointer to the position of the struct mytar_instructions.
 *			If an error exist, the return value is NULL
 */
mytar_instructions* instructionsInit(){
	/*Counter of the for cycle*/
	int i;
	/*The new mytar_instructions struct*/
	mytar_instructions *new_instructions = malloc(sizeof(mytar_instructions));
	/*Verify if the memory allocation was correct*/
	if (!new_instructions){
		perror("Error: ");
		return NULL;
	}
	/*Initialize the array of options*/
	for (i = 0; i < NUMOPTIONS; i++) {
		new_instructions->mytar_options[i] = 0;
	}
	/*Setting the default values for all arguments*/
	new_instructions->encryption_offset = 0;
	new_instructions->output_verbose = 1;
	new_instructions->creation_directory[0] = "file.mytar";
	strcpy(new_instructions->mytar_file, "");
	strcpy(new_instructions->output_directory, "");
	strcpy(new_instructions->file_extraction, "");

	return new_instructions;
}
/*
 *	verboseMode
 * -------------------
 *  Add more details about the execution of mytar command and its options
 *
 *	instructions: Struct that contains the commands of mytar executable
 *  filePath: The file path in string format
 *
 * 	Return: void
 */
void verboseMode(mytar_instructions instructions, char *filePath){}

/*
 *  instructiosPrint
 * -------------------
 *  Show in console the structure tar_instructions
 *
 *	instructions: Struct that contains the commands of mytar executable
 *
 * 	Return: void
 */
void instructionsPrint(mytar_instructions instructions){
	if (!&instructions){
		printf("No hay instrucciones");
	}
	
	int i;
	printf("\n");
	for (i = 0; i < NUMOPTIONS; i++) {
		printf("%i\n", instructions.mytar_options[i]);
	}
	printf("\n");
	printf("encryption_offset--> %i\n",instructions.encryption_offset);
	printf("\n");
	i = 0;
	while (i < MAXLEN){
		if (instructions.creation_directory[i]) {
			printf("--> %s\n",instructions.creation_directory[i]);
		}
		i++;
	}
	printf("\n");
	printf("mytar_files--> %s\n",instructions.mytar_file);
	printf("output_directory--> %s\n",instructions.output_directory);
	printf("output_verbose--> %i\n",instructions.output_verbose);
	printf("file_extraction--> %s\n",instructions.file_extraction);
}