// Main

#include <stdio.h> 
#include <stdlib.h>
#include "list.h"

#define MAXELEMENTS 100
int main (int argc, char **argv) { 

	int n;
	printf("how many elements: "); 
	scanf("%d",&n); 

	/*	Asking space for list and elements	*/
	list_e *space = (list_e*) malloc( MAXELEMENTS * sizeof(list_e) );		
	list *my_list = (list*) malloc( sizeof(list_e) );
	
	list_init(my_list);

	int j; 
	char *temp = malloc( sizeof(char*) ); 			//Any pointer type needs a memory address to work

	/* 	Initializing and assignment 	*/	
	for(j=0; j<n; j++) { 

		printf("contenido: "); 
		scanf("%s",temp); 

		list_e_init(&space[j], temp); 

		list_insert(my_list, space[j]); 
		//printf("Size of list: %p\n",my_list->size); 			//%p format writes in hex
	}
	list_print(*my_list);
		

	return 0; 
}

