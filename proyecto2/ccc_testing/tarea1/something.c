/*Funcion: listPrint
 * ------------
 *	Imprime en consola el contenido de la lista
 *
 * 	l: lista a imprimir
 */
void listPrint(list l) {

	if (l.size==0) 
		printf("Empty list\n"); 
	else 
	{
		node *dummie = l.head;
		
		while (dummie != NULL ) { 

			printf("%s %d \n",dummie->word,dummie->frequency); 
			if (l.head == l.tail) 
				break ;
			dummie = dummie->next;
		}
	}

}
