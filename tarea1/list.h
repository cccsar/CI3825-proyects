
#ifndef __LIST__ 
#define __LIST__

typedef struct list_element{ 
	char *content; 
	struct list_element *next; 
} list_e; 

void list_e_init(list_e *e, char *c); 

/* List set of definitions */

typedef struct { 
	list_e *head, *tail; 
	int size; 
} list;

void list_init(list *l);  
void list_insert(list *l, list_e e);
void list_print(list l);

#endif
