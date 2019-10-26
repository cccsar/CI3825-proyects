#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "parser.h"

int main (int argc, char **argv) {
    /*
    * ENCRYPT
    char *string = "CARLOS SIVIRA";
    printf("%s\n", string);
    string = encrypt(string, 100);
    printf("%s\n", string);
    string = encrypt(string, -100);
    printf("%s\n", string);
    int i;
    for (i = -128; i < 128; i++)
    {
      printf("(%c -- %d)\n", i, i);
    }
    */

    /*
    * PARSER*/
    mytar_instructions *inst;
    inst = parse(argc, argv);
    instructionsPrint(*inst);
    /*char *arg[200];
    char *carlos = malloc(MAXLEN);
    char *sivira = malloc(MAXLEN);

    strcpy(carlos, "Carlos");
    strcpy(sivira, carlos);
    arg[0] = carlos;
    printf("%i -- %i\n", arg[0], &sivira);*/
    
    return(0);
}
