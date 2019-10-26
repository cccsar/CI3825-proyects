/*
 * Archivo: parser.c
 *
 * Descripcion: Recibe una entrada por la linea de comandos y retorna una 
 * estructura con ls informacion de las opciones activas de mytar y sus 
 * argumentos.
 *
 * Autores:
 *	Carlos Alejandro Sivira Munoz 		15-11377
 * 	Cesar Alfonso Rosario Escobar		15-11295
 * Grupo: 18
 */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include "parser.h"
/*
 * 	fArgument
 * -------------------
 *  Recibe una cadena de caracteres y verifica si esta es el nombre del archivo 
 * .mytar.
 *
 *  string: cadena de caracteres a verificar.
 *
 *  Retorno: Resultado de la llamada strcmp. -1 en caso de error.
 */
int fArgument(char *string){
	const char c[2] = ".";
	char *token;
	token = strtok(string, c);
	token = strtok(NULL, c);
	/*No es posible conseguir el token*/
	if (!token){
		return -1;
	}
	/*Verifica si .mytar esta contenido en la cadena*/
	return strcmp(token, "mytar");
}
/*
 * 	setOptions
 * -------------------
 *  Guarda las opciones activas de mytar en la estructura mytar_instructions.
 *
 *  instructions: estructura de opciones mytar.
 *  c: caracter actual a ser verificado y/o guardado.
 *
 *  Retorno: 0 si la ejecucion fue correcta. -1 en caso de error.
 */
int setOptions(mytar_instructions *instructions, char c){
	/*Verifica si c es uanopcion valida*/
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
			/*Arroja error por caracter desconocido*/
			printf("%s undefined mytar option\n");
			return -1;
			break;
	}
	return 0;
}
/*
 * 	parse
 * -------------------
 *  Recibe la entrada del comando mytar y retorna la estructura de opciones.
 *
 *  num_arguments: numero de argumentos suministrados.
 *  arguments: argumentos dados para almacenar en la estructura.
 *
 *  Retorno: apuntador a la estructura de opciones mytar_instructions.
 */
mytar_instructions* parse(int num_arguments, char **arguments){
	int i;
	/*El numero de argumentos de la opcion f*/
	int f_count = 1;
	/*Se inicializa la estructura de opciones mytar*/
	mytar_instructions *instructions = instructionsInit();
	/*Verifica si la inicializacion fue correcta*/
	if (!instructions){
		perror("Error: ");
		return NULL;
	}
	/*Recorre todos los argumentos dados*/
	for (i = 1; i < num_arguments; i++){
		int j = 0;
		/*Salva el ultimo caracter visitado*/
		char last;
		/*Cadena que almacena temporalmente los argumentos*/
		char *arg = malloc(MAXLEN);
		strcpy(arg, arguments[i]);
		/*Verifica si el argumento actual es una serie opciones*/
		if (arg[j] == '-' || arg[j] == '-'){
			j++;
			/*Recorre cada caracter de la serie de comandos*/
			while(j < strlen(arg) && arg[j]){
				/*Verifica si son comando validos*/
				if (setOptions(instructions ,arg[j]) != 0){
					return NULL;
				}
				last = arg[j];
				j++;
			}
		/*Salva los argumentos de cada opcion de forma ordenada*/
		} else {
			char *aux_string = malloc(MAXLEN);
			char *aux_val = malloc(MAXLEN);
			int fldes;
			/*Salva el argumento correspondiente a la ultima opcion visitada*/
			switch (last)
			{
				case 'o':
					strcpy(instructions->output_directory, (arg));
					break;
				case 'z':
					instructions->encryption_offset = -atoi(arg);
					break;
				case 'y':
					instructions->encryption_offset = atoi(arg);
					break;
				case 'v':
					/*Verifica si existe el archivo destino para verboso*/
					fldes = open(arg, O_RDWR);
					if (fldes < 0){
						return NULL;
					}
					instructions->output_verbose = fldes;
					break;
				case 'f':
					/*Salva todos los argumentos de f*/
					strcpy(aux_string, arg);
					strcpy(aux_val, arg);
					/*Verifica si el argumentos es el archivo .mytar*/
					if (fArgument(aux_string) == 0){
						instructions->creation_directory[0] = aux_val;
					} else {
						instructions->creation_directory[f_count] = aux_val;
					}
					f_count++;
					break;
				case 's':
					strcpy(instructions->file_extraction, arg);
					break;
				default:
					/*Arroja error por caracter desconocido*/
					printf("%s undefined mytar option\n");
					return NULL;
					break;
			}
			free(aux_string);
		}
		free(arg);
	}
	return instructions;
}
/*
 * 	instructionsInit
 * -------------------
 *  Inicializa la estructura de opciones mytar_instructions.
 *
 * 	Retorno: apuntador a la estructura de opciones mytar_instructions. Si 
 * 	existe un error, returna NULL. 
 */
mytar_instructions* instructionsInit(){
	int i;
	/*Nueva estructura de opciones mytar*/
	mytar_instructions *new_instructions = malloc(sizeof(mytar_instructions));
	/*Verifica si la solicitud de memoria fue correcta*/
	if (!new_instructions){
		perror("Error: ");
		return NULL;
	}
	/*Inicializa el arreglo de opciones*/
	for (i = 0; i < NUMOPTIONS; i++) {
		new_instructions->mytar_options[i] = 0;
	}
	/*Inicializa los argumentos de las opciones con sus valores por defecto*/
	new_instructions->encryption_offset = 0;
	new_instructions->output_verbose = 1;
	new_instructions->creation_directory[0] = "file.mytar";
	strcpy(new_instructions->output_directory, ".");
	strcpy(new_instructions->file_extraction, "");

	return new_instructions;
}
/*
 *	verboseMode
 * -------------------
 *  Agrega informacion adicional sobre la ejecucion mytar y sus opciones.
 *
 *	instructions: Estructura que contiene la informacion de las opciones de
 *  			  mytar.
 *  filePath: La ruta del archivo actual.
 *
 * 	Retorno: vacio.
 */
void verboseMode(mytar_instructions instructions, char *filePath){
	/*Cadenas de caracteres auxiliares*/
	char *output = malloc(MAXLEN);
	char *string = malloc(MAXLEN);
	memset(output, '\0', MAXLEN);
	memset(string, '\0', MAXLEN);

	/*Verifica si el modo c esta activo*/
	if(instructions.mytar_options[0]){
		strcat(output, "Adding ");
		strcat(output, filePath);
		strcat(output, " to ");
		strcat(output, instructions.creation_directory[0]);
		/*Verifica si la opcion z esta activa*/
		if(instructions.mytar_options[5]){
			sprintf(string,"%i", instructions.encryption_offset);
			strcat(output, " encrypting with ");
			strcat(output, string);
		}
		/*Verifica si la opcion n esta activa*/
		if(instructions.mytar_options[4]){
			strcat(output, " ignoring non regular file or directory");
		}
	}

	/*Verifica si el modo t esta activo*/
	if(instructions.mytar_options[1]){
		strcat(output, "Showing ");
		strcat(output, filePath);
		strcat(output, " from ");
		strcat(output, instructions.creation_directory[0]);
		/*Verifica si la opcion y esta activa*/
		if(instructions.mytar_options[6]){
			sprintf(string,"%i", instructions.encryption_offset);
			strcat(output, " decrypting with ");
			strcat(output, string);
		}
		/*Verifica si la opcion z esta activa*/
		if(instructions.mytar_options[5]){
			sprintf(string,"%i", instructions.encryption_offset);
			strcat(output, " encrypting with ");
			strcat(output, string);
		}
		/*Verifica si la opcion n esta activa*/
		if(instructions.mytar_options[4]){
			strcat(output, " ignoring non regular file or directory");
		}
	}

	/*Verifica si el modo x esta activo*/
	if(instructions.mytar_options[2]){
		strcat(output, "Extracting ");
		/*Verifica si la opcion s esta activa*/
		if(instructions.mytar_options[9]){
			strcat(output, "specifically ");
		}
		strcat(output, filePath);
		strcat(output, " from ");
		strcat(output, instructions.creation_directory[0]);
		strcat(output, " with:");
		/*Verifica si la opcion y esta activa*/
		if(instructions.mytar_options[6]){
			sprintf(string,"%i", instructions.encryption_offset);
			strcat(output, " decrypting with ");
			strcat(output, string);
		}
		/*Verifica si la opcion n esta activa*/
		if(instructions.mytar_options[4]){
			strcat(output, " ignoring non regular file or directory");
		}
		/*Verifica si la opcion o esta activa*/
		if(instructions.mytar_options[3]){
			strcat(output, " in ");
			strcat(output, instructions.output_directory);
		}
	}
	/*Muesta en la salida espeficiada la descripcion*/
	strcat(output, "\n");
    write(instructions.output_verbose, output, strlen(output));
}