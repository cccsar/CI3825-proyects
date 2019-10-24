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
 *  parse
 * -------------------
 *  Read the command line and store that values in an organized structure
 *
 *  num_arguments: Number of arguments to read
 *  arguments: Arguments to store
 *
 * Return:  The pointer to the position of the struct mytar_instructions.
 *					If an error exist, the return value is NULL
 */
mytar_instructions* parse(int num_arguments, char const *arguments[]){
	int i;
	/*Initialize the mytar_instructions structure*/
	mytar_instructions *instructions = instructions_init();
	/*Verify if the structure was initialized correctly*/
	if (!instructions){
		perror("Error: ");
		return NULL;
	}
	/*Iterate over the arguments of the mytar executable*/
	for (i = 1; i < num_arguments; i++){
		/*Character array to storing temporal string values*/
		char parameter[MAXLEN];
		int j = 0;
		strcpy(parameter, arguments[i]);
		/*Iterate over the characters of parameter array*/
		while(j < strlen(parameter)){
			/*Saving the last character visited*/
			char last_option;
			/*Look if the character is the beginning of a mytar option*/
			if (parameter[j] == '-' || parameter[j] == '-'){
				/*Counter of the while cycle*/
				j++;
				/*Looking for the options that will be used*/
				while(parameter[j]){
					switch (parameter[j])
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
							return NULL;
							break;
					}
					last_option = parameter[j];
					j++;
				}
			/*Looking for arguments for mytar options*/
			} else {
				/*Saving the corresponding argument to its mytar option*/
				switch (last_option)
				{
					case 'o':
						strcpy(instructions->output_directory, parameter);
						break;
					case 'z':
						instructions->encryption_offset = atoi(parameter);
						break;
					case 'y':
						instructions->encryption_offset = atoi(parameter);
						break;
					case 'v':
						strcpy(instructions->output_verbose, parameter);
						break;
					case 'f':
						/*Saving the f argument and the creation directory for 'c' option*/
						strcpy(instructions->mytar_file, parameter);
						if (i + 1 < num_arguments){
							strcpy(parameter, arguments[i + 1]);
							if(parameter[0] != '-' && parameter[0] != '-'){
								strcpy(instructions->creation_directory, parameter);
								i++;
							}
						}
						break;
					case 's':
						strcpy(instructions->file_extraction, parameter);
						break;
				}
			}
			break;
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
 *					If an error exist, the return value is NULL
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
	for (i = 0; i < 10; i++) {
		new_instructions->mytar_options[i] = 0;
	}
	/*Setting the default values for all arguments*/
	new_instructions->encryption_offset = 0;
	strcpy(new_instructions->creation_directory, "");
	strcpy(new_instructions->mytar_file, "");
	strcpy(new_instructions->output_directory, "");
	strcpy(new_instructions->output_verbose, "");
	strcpy(new_instructions->file_extraction, "");

	return new_instructions;
}
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
	int i;
	printf("\n");
	for (i = 0; i < 10; i++) {
		printf("%i\n", instructions.mytar_options[i]);
	}
	printf("\n");
	printf("encryption_offset --> %i\n",instructions.encryption_offset);
	printf("creation_directory --> %s\n",instructions.creation_directory);
	printf("mytar_file --> %s\n",instructions.mytar_file);
	printf("output_directory --> %s\n",instructions.output_directory);
	printf("output_verbose --> %s\n",instructions.output_verbose);
	printf("file_extraction --> %s\n",instructions.file_extraction);
}
