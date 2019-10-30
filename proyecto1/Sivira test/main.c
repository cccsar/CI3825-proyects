#include <stdio.h> 
#include <stdlib.h>
#include <sys/types.h> 
#include <sys/stat.h> 
#include <fcntl.h>  
#include <dirent.h> 
#include <string.h> 
#include <unistd.h>
#include <string.h>
#include "create.h"
#include "extract.h"
#include "parser.h"
#include "encryption.h"

/*
*   main
* -------------------
*   Metodo principal de la aplicacion mytar
*
*   argc: Numero de argumentos suministrados.
*   argv: Argumentos suministrados.
*
*   Retorno: 0 en caso de ejecucion correcta. Numero negativo en caso de error.
*/
int main(int argc, char** argv) {
    /*Se crear la estructura contenedora de las opciones de mytar*/
    mytar_instructions *instructions = parse(argc, argv);
    /*Error de creacion*/
    if (!instructions){
        return 0;
    }
    /*Verifica si las opciones son validas*/
    if(verifyOptions(*instructions) == -1){
        printf("The mytar options are incorrect\n");
        return 0;
    }

	/*Se realiza la creacion del .mytar con las opciones y argumentos dados*/
	if (instructions->mytar_options[C]){
        createMyTar(instructions->num_args, instructions->creation_directory, *instructions);
    }

    /*
    Se realiza la extracion o muestra del .mytar con las opciones y argumentos dados
    */
    if (instructions->mytar_options[X] || instructions->mytar_options[T]){
        extractMyTar(instructions->creation_directory, *instructions);
    }

    free(instructions);

	return 0;
}
