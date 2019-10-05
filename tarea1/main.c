// Main

#include <stdio.h> 
#include <stdlib.h>
#include <string.h>
#include "list.h"

#define MAX_ELEMENTS 100
#define WORD_SIZE 20

int main (int argc, char **argv) { 

	FILE *fp; 
	int i,j;
	char *current_word;
	node *space;
	
	/*	considering wether the input is properly formatted	*/
	if (argc != atoi(argv[1]) + 2) { 
		printf("Error, format is:\t ./proy <num files> files ...\n"); 
		exit(-1); 
	}

	/*	Asking space for list 		*/
	list *my_list = (list*) malloc( sizeof(list) );
	listInit(my_list);

	for(i=2; i<atoi(argv[1])+2; i++) {

		fp = fopen(argv[i],"r"); 

		//		see wether to handle it
		if (fp ==  NULL ) { 
			printf("Error opening file\n"); 
			exit(-2); 
		}

		/*	allocate space for initial word 	*/
		current_word = malloc( WORD_SIZE*sizeof(char) ); 			

		while( fscanf(fp,"%s",current_word) != EOF) { //HANDLE WHEN NOT PROPPERLY READ

			/*	 allocate space for a node and initiallize it	*/
			space = (node*) malloc( sizeof(node) ) ; 
			listElInit(space, current_word); 
		
			/*	insert element into list	*/
			listInsert(my_list, space); 

			/*	allocate space for any word other than initial	*/	
			current_word = malloc( WORD_SIZE*sizeof(char) ); 			//pendiente aqui
		}

	} 

	/* 	Initializing and assignment 	*/	
	//tc for swap
	//	two elements
	//	!two elements & first,last
	//	any inside element
	//	one head or tail and any other	
	//list_swap(my_list, my_list->head, (my_list->tail)->prev); 
	listPrint(*my_list);

		

	return 0; 
}

