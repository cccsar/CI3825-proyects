#include <stdio.h>
#include "list.h"


void list_e_init(list_e *e, char* c) {
	e->content = c; 
	e->next = NULL; 
}

/* List set of definitions */

void list_init(list *l) { 
	l->head = l->tail = NULL; 
	l->size = 0;
}

//Los structs/tipos se pasan por valor.. hay que pasar apuntadores para modificar data members
void list_insert(list *l, list_e e) {

	if (l->size == 0) 
	{
		l->head = &e; 
		l->tail = &e;
	}
	else {
		(l->tail)->next = &e; 
		l->tail = &e; 
	}
	l->size ++; 
}

void list_print(list l) { 

	if (l.size==0) 
		printf("Empty list\n"); 
	else 
	{
		int i; 
		list_e *dummie = l.head;
		for(i=0; i<l.size; i++) { 
			printf("%p ",dummie->content); 
			dummie = dummie->next;
		}

		printf("\n"); 

		printf("head: %s\ttail: %s\tsize: %d\t", (l.head)->content, (l.tail)->content, l.size); 
	}


}
	
