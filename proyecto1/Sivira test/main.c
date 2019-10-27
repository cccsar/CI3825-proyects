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

int main(int argc, char** argv) {
    mytar_instructions *instructions = parse(argc, argv);

    if (!instructions){
        return 0;
    }
    
    if(verifyOptions(*instructions) == -1){
        printf("The mytar options are incorrect\n");
        return 0;
    }

	/* CREACION */
	if (instructions->mytar_options[0]){
        createMyTar(instructions->num_args, instructions->creation_directory, *instructions);
    }
    /* EXTRACCION */
    if (instructions->mytar_options[2]){
        extractMyTar(instructions->creation_directory, *instructions);
    }

    free(instructions);

	return 0;
}
