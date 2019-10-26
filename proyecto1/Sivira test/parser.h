/*
* Archivo: parser.c
* Description: Read the comand line and return the content in a specific format
* Author: Carlos Sivira 15-11377
* Group: 18
*/
#ifndef __PARSER__
#define __PARSER__
#define MAXLEN 1024
#define NUMOPTIONS 10

/*
* Structure to store all mytar options and its arguments
*/
typedef struct tar_instructions{
  int mytar_options[NUMOPTIONS];
	int encryption_offset;
	char *creation_directory[MAXLEN];
	char mytar_file[MAXLEN];
	char output_directory[MAXLEN];
	int output_verbose;
	char file_extraction[MAXLEN];
} mytar_instructions;
/*
 * 	parse
 * -------------------
 *  Read the command line and store that values in an organized structure
 *
 *  num_arguments: Number of arguments to read
 *  arguments: Arguments to store
 *
 *  Return: 0 if the execution was correct. Otherwise, return -1
 */
mytar_instructions* parse(int num_arguments, char **arguments);
/*
 * 	instructionsInit
 * -------------------
 *  Initialize the structure tar_instructions
 *
 * 	Return: The pointer to the position of the struct mytar_instructions.
 *					If an error exist, the return value is NULL
 */
mytar_instructions* instructionsInit();
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
void verboseMode(mytar_instructions instructions, char *filePath);
/*
 *	instructionsPrint
 * -------------------
 *  Show in console the structure tar_instructions
 *
 *	instructions: Struct that contains the commands of mytar executable
 *
 * 	Return: void
 */
void instructionsPrint(mytar_instructions instructions);

#endif
