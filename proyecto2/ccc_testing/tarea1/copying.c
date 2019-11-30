
	int j_;

	FILE *fp; 

	char *current_word;
	node *space;
	list *my_list;

	if ( (my_list = (list*) malloc( sizeof(list) ) ) == NULL ) {
		perror("malloc");

		exit(-2); 
	}


	listInit(my_list);


	/*INSERTO NODOS*/

	for(j_=quot*i_; j_ < quot*i_ + aux  ; j_++) { 

		/*if ( !(fp = fopen(argv[j_],"r")) ){*/
			/*dprintf(stderr, "%s",argv[j_]);*/
			/*perror("fopen"); */

			/*exit(-3); */
		/*}*/

		/*Se reserva espacio para la primera palabra del archivo*/
		if ( (current_word = (char*) malloc(WORD_SIZE * sizeof(char)) ) == NULL ) {
			perror("malloc");
			exit(-2);
		}
	
		while( fscanf(fp,"%s",current_word) != EOF) { 

			if ( ( space = (node*) malloc( sizeof(node) ) ) == NULL ) {
				perror("malloc");

				exit(-2);
			}

			nodeInit(space, current_word, 1); 

			/*En caso de que solo la frecuencia de un elemento */
			/* se aumente como ese nodo ya esta creado, se libera*/
			/* la memoria que se almaceno para insertarlo.*/
			if (listInsert(my_list, space) < 0) {
				free(space);
				free(current_word);
			}

			/*Se reserva espacio para la i-esima palabra*/ 
			/* del archivo*/
			if ( (current_word = (char*) malloc(WORD_SIZE*sizeof(char)) ) == NULL ) {
				perror("malloc");

				exit(-2);
			}
	

		}


	} 



	/*AQUI SE ENTRA EN LA REGION CRITICA*/
	listPrintRC(my_list, mutex, sem_r, sem_w);

	fprintf(stderr,"qk\n"); 

	/*CIERRO SEMAFOROS*/
	if( sem_unlink(SMP0) == -1)
		perror("sem_close");

	if( sem_unlink(SMP1) == -1)
		perror("sem_close");

	if (sem_unlink(SMP2) == -1) 


	/*CIERRO FD QUE APUNTA A PIPE*/
	close(1);

	/*FREE SPACE*/
	listDestroy(my_list);

	exit(0);
}
