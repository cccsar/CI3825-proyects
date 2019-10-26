#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "parser.h"
#include "encryption.h"

int main (int argc, char **argv) {
    /*
    * ENCRYPT
    */
    /*
    char *string = "~CARLOS SIVIRA~";
    printf("%s\n", string);
    string = encrypt(string, 138000);
    printf("%s\n", string);
    string = encrypt(string, -138000);
    printf("%s\n", string);
    */

    /*
    * PARSER
    */
    /*
    mytar_instructions *inst;
    inst = parse(argc, argv);
    instructionsPrint(*inst);
    */

    /*
    * VERBOSE 
    */
    
    mytar_instructions *inst;
    inst = parse(argc, argv);
    verbose_mode(*inst, "culopeluo");
    verbose_mode(*inst, "culonopeluo");
    
    return(0);
}
