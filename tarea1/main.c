// Main

#include <stdio.h> 
#include <stdlib.h>
#include "list.h"

#define MAXELEMENTS 100
int main (int argc, char **argv) { 

	int n,j;
	char *temp;
	list_e *space;


	printf("how many elements: "); 
	scanf("%d",&n); 

	/*	Asking space for list and elements	*/
	/* Pensar en estooooooo */
	//list_e **space = (list_e**) malloc( MAXELEMENTS * sizeof(list_e*) );		
	list *my_list = (list*) malloc( sizeof(list) );
	
	list_init(my_list);


	/* 	Initializing and assignment 	*/	
	for(j=0; j<n; j++) { 
		
		temp = malloc( 50*sizeof(char) ); 			//Any pointer type needs a memory address to work
		printf("contenido: "); 
		scanf("%s",temp); 
		space = (list_e*) malloc( sizeof(list_e) ) ; 
		//space[j] = (list_e *)malloc(sizeof(list_e));
		//list_e_init(space[j], temp); 
		list_e_init(space, temp);			

		//list_insert(my_list, space[j]); 
		list_insert(my_list, space); 
 			//%p format writes in hex

	}
	list_print(*my_list);
		

	return 0; 
}

