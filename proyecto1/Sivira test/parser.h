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
#ifndef __PARSER__
#define __PARSER__
#define MAXLEN 1024
#define NUMOPTIONS 10
#define C 0
#define T 1
#define X 2
#define O 3
#define N 4
#define Z 5
#define Y 6
#define V 7
#define F 8
#define S 9
/*
* Estructura que contiene la informaci[on de las opciones activas y sus 
* argumentos.
*/
typedef struct tar_instructions{
  	int mytar_options[NUMOPTIONS];
	int encryption_offset;
	char *creation_directory[MAXLEN];
	char output_directory[MAXLEN];
	int output_verbose;
	char file_extraction[MAXLEN];
	int is_encripted;
	int num_args;
} mytar_instructions;
/*
 * 	parse
 * -------------------
 *  Recibe la entrada del comando mytar y retorna la estructura de opciones.
 *
 *  num_arguments: numero de argumentos suministrados.
 *  arguments: Argumentos dados para almacenar en la estructura.
 *
 *  Retorno: apuntador a la estructura de opciones mytar_instructions.
 */
mytar_instructions* parse(int num_arguments, char **arguments);
/*
 * 	instructionsInit
 * -------------------
 *  Inicializa la estructura de opciones mytar_instructions.
 *
 * 	Retorno: apuntador a la estructura de opciones mytar_instructions. Si 
 * 	existe un error, returna NULL. 
 */
mytar_instructions* instructionsInit();
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
void verboseMode(mytar_instructions instructions, char *filePath);

#endif
