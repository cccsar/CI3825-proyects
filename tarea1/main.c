// Main

#include <stdio.h> 
#include <stdlib.h>
#include "list.h"

int main (int argc, char **argv) { 

	int n;
	printf("how many elements: "); 
	scanf("%d",&n); 

	list_e *space = (list_e*) malloc( n * sizeof(list_e) );
		
	list my_list; 
	list_init(my_list);

	int j; 
	char *temp;
	/* Inicializado e insercion */
	for(j=0; j<n; j++) { 

		printf("contenido: "); 
		scanf("%p",temp); 

		list_e_init(&space[j], temp); 
		list_insert(my_list, space[j]); 
	}	

	list_print(my_list);
		

	return 0; 
}

