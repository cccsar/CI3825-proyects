/*
 * Archivo: main.c
 *
 * Descripcion:	Archivo fuente para la rutina principal de la aplicacion
 * frecpalproc
 *
 * Autores:
 * 	Carlos Alejandro Sivira Munoz		15-11377
 * 	Cesar Alfonso Rosario Escobar		15-11295
 *
 */

#include <stdio.h> 
#include <stdlib.h>
#include <sys/types.h> 
#include <sys/stat.h> 
#include <sys/wait.h>
#include <fcntl.h>  
#include <dirent.h> 
#include <string.h> 
#include <unistd.h>
#include <string.h>
#include <signal.h>
#include <semaphore.h>
#include <errno.h>
#include "myFind.h"
#include "list.h"


#define WRITE 1
#define READ 0

#define WORD_SIZE 20

#define STANDARD_SIZE 419 

#define SMP0 "/mutex"
#define SMP1 "/sem_reader"
#define SMP2 "/sem_writer"
#define MODE S_IRWXU | S_IRGRP | S_IWGRP | S_IROTH

#define MIN(a,b) (a < b)? a: b;


/* countFrequencies
 * --------------
 * Cuenta el numero de ocurrencias de una palabra en un archivo. Para ello
 * lee cada palabra del archivo y la inserta en una "lista de frecuencias"
 *
 * Recibe los archivos de un arreglo de strings, seleccionando solo un 
 * segmento de este.
 *
 * 		
 *	my_list:  lista de frecuencias
 *	paths: arreglo con los nombres de los archivos a leer
 *	floor: cota inferior del arreglo de archivos a leer
 *	ceil: cota superior del arreglo de archivos a leer
 *	reference: se utiliza para desplazarse sobre el arreglo de string 
 *
 */
void countFrequencies(list *my_list, char** paths, int floor, int ceil,
	       	int reference){
	int j_; 
	FILE *fp; 

	char* current_word; 
	char* word_buffer; 
	node *space;


	word_buffer = (char *) malloc( sizeof(char) * WORD_SIZE + 1);

	for(j_=floor*reference; j_ < floor*reference + ceil  ; j_++) { 
	
		if ( !(fp = fopen(paths[j_],"r")) ){
			perror("fopen"); 
		
			exit(-3); 
		}

		while( fscanf(fp,"%s", word_buffer) != EOF) { 

			if ( ( space = (node*) malloc( sizeof(node) ) ) == NULL) 
				perror("malloc");
		
			current_word = (char *) malloc( sizeof(char) * 
					strlen(word_buffer) + 1 );
			if(current_word == NULL) 	
				perror("current_word ");

			strcpy(current_word, word_buffer); 
			nodeInit(space, current_word, 1); 
		
			/* En caso de que solo la frecuencia de un elemento 
			 * se aumente como ese nodo ya esta creado, se libera
			 * la memoria que se almaceno para insertarlo. 
			 */

			if (listInsert(my_list, space) < 0) {
				free(current_word);
				free(space);
			}
		
		
		}

		if( fclose(fp) == -1)
			perror("fclose");
		
		free( paths[j_] );
	} 
	free(word_buffer);
}



/* main
 * --------------
 * Metodo principal de la aplicacion frecpalhilo
 *
 * El enfoque que se dio para hacer posible esta aplicacion fue:
 * 	
 * 	Primero se realiza la busqueda de los archivos a revisar desde el proceso
 * 	padre, al comienzo del mismo.
 *
 * 	Despues de esto se calcula la reparticion de archivo a los procesos 
 * 	contadores y se hacen los fork del proceso merger y los procesos contadores.
 *
 * 	Counters: Procesos escritores, abren cada archivo recibido, insertan las 
 * 	palabras encontradas en una lista de frecuencias y escriben la informacion de 
 * 	las mismas en un pipe no nominal, para que el merger las lea. 
 *
 * 	Merger: Proceso lector, recibira entrada formateada de un pipe no nominal y 
 * 	la mezclara en una lista de frecuencias final, que sera presentada de forma
 * 	ordenada por stdout.
 *
 * 	Por ultimo, en cada proceso se cierran file descriptors del pipe, se liberan
 * 	buffers, se hace unlink a semaforos y se cierran.
 */
int main (int argc, char **argv) { 
	int n_files, n_ps, quot, rem, aux, i_; 
	char **paths ;

	/*	Procesos 	*/
	int status; 
	
	/*	Pipe	*/
	int pipe_fd[2]; 

	/*	Semaforo	*/
	sem_t *mutex, *smp_r, *smp_w; 
	int  *r_controller; 
	int trash;

	/*	Proceso mezclador	 */
	char* word; 
	int terminated;
	int* word_size, *frequency; 
	list *freq_list; 
	node *dummie; 

	/*	Procesos contadores 	*/
	list *my_list;



	/*	Creo pipe	*/
	if( pipe(pipe_fd)  == -1) {
		fprintf(stderr, "Error abriendo pipe");
		perror("pipe");

		exit(-3);
	}

	/* 	Elimino a los semaforos en caso de que existan antes 	*/
	trash = sem_unlink(SMP0);
	if( trash != 0 && errno != ENOENT)
		perror("sem_unlink");	

	trash = sem_unlink(SMP1);
	if( trash != 0 && errno != ENOENT)
		perror("sem_unlink");	

	trash = sem_unlink(SMP2);
	if( trash != 0 && errno != ENOENT)
		perror("sem_unlink");	


	/*	 Ubico los archivos a procesar		*/
	paths = (char**) malloc(sizeof(char*) * STANDARD_SIZE); /*perror*/
	if (paths == NULL )  
		perror("malloc");

	n_files = myFind(argv[2], &paths); 


	/*	Calculo el numero de procesos a usar 	*/
	n_ps = MIN(atoi(argv[1]), n_files);


	/*	Creo a los semaforos	*/
	if((mutex=sem_open(SMP0, O_CREAT | O_RDWR, MODE, 1)) == SEM_FAILED){
		perror("sem_open");

		exit(-2); 
	}

	if((smp_r=sem_open(SMP1, O_CREAT | O_RDWR, MODE, n_ps)) == SEM_FAILED){
		perror("sem_open");

		exit(-2); 
	}

	if((smp_w=sem_open(SMP2, O_CREAT | O_RDWR, MODE, 0))  == SEM_FAILED){
		perror("sem_open");

		exit(-2); 
	}


	/* 		Proceso merger
	 *
	 * 	Para empezar cierra los extremos del pipe que no se usaran
	 *
	 * 	Luego espera por la escritura al pipe en un semaforo
	 *
	 * 	Del pipe primero lee una variable "r_controller", que indica si 
	 * 	un proceso contador ha escrito o si ya termino de escribir. 
	 * 	En el primer caso, continua leyendo en el formato de escritura
	 * 	de los procesos contadores.
	 * 	
	 * 	Este proceso espera hasta que los contadores hayan dejado de 
	 * 	escribir al pipe, y luego imprime una lista de frecuencias 
	 * 	ordenada por salida estandar
	 */

	switch( fork() ) 
	{
		default: 
			break; 

		case -1: 
			perror("fork");
			fprintf(stderr, "No se pudo abrir el merger\n");

			exit(-4);

		case 0: 

			if( close(pipe_fd[WRITE]) == -1) 
				perror("close");

			if( dup2(pipe_fd[READ], 0) == -1) 
				perror("dup2");

			if( close(pipe_fd[READ]) == -1) 
				perror("close");



			word_size = (int *) malloc( sizeof(int) );
			if( word_size == NULL)  
				perror("malloc"); 

			frequency = (int*) malloc(sizeof(int));
			if( frequency == NULL )  
				perror("malloc");

			r_controller = (int *) malloc( sizeof(int) );
			if( r_controller == NULL ) 
				perror("malloc");

			freq_list = (list *) malloc( sizeof(list) );
			if( freq_list == NULL ) 
				perror("malloc");


			listInit(freq_list); 
			terminated = 0; 

			while (terminated != n_ps) {

				if( sem_wait(smp_w) == -1) {
					perror("sem_wait");
					exit(-2);
				}

				if( sem_wait(mutex)  == -1) {
					perror("sem_wait");
					exit(-2);
				}


				read(0, r_controller, sizeof(int) ) ; 

 
				if( *r_controller != -1) { 
					/*Inicializo nodo*/
					dummie = (node *) malloc( sizeof(node) );
					if( dummie == NULL ) {
						perror("malloc");
					}

					/*leo el tamano de la palabra*/
					read(0, word_size, sizeof(int) ); 

					/*leo la la palabra*/
					word = (char *) malloc(*word_size * 
							sizeof(char) ); 
					if( word == NULL ) 
						perror("malloc");

					read(0, word, *word_size + 1 );

					/*leo la frecuencia*/
					read(0, frequency, sizeof(int) );

					nodeInit(dummie, word, *frequency); 
					listInsert(freq_list, dummie);
				}
				else  
					terminated++; 


				if( sem_post(mutex)  == -1) {
					perror("sem_post");
					exit(-2);
				}

				if( sem_post(smp_r)  == -1) {
					perror("sem_post");
					exit(-2);
				}
				
			}

			close(0); 

			free(word_size); 
			free(frequency); 
			free(r_controller); 

			listSort(freq_list);
			listPrint(freq_list); 

			exit(0);
	}



	/*		 Se calcula la reparticion de archivos		
	 *
	 *	Si se piden mas procesos que archivos encontrados, entonces se utilizaran
	 *	tantos procesos como archivos.
	 *
	 *	De lo contrario	se reparte una cantidad de "quot" archivos por proceso, 
	 *	salvo en el ultimo proceso, que recibe "quot + rem" archivos.
	 *
	 */
	
	if ( n_ps >= n_files ) {
		quot = 1; 
		rem = 0;
	}
	else {
		quot = n_files / atoi(argv[1]) ;
		rem = n_files % atoi(argv[1]) ;
	}


	/*		Procesos contadores
	 *
	 *	Luego calculan la frecuencia de las palabras en los archivos 
	 *	recibidos. Esto se almacena en una lista de frecuencias
	 *
	 *	Despues de esto pasan a escribir el contenido de la lista en un 
	 *	pipe, un nodo a la vez (con un formato en particular). Esto es 
	 *	mediado por semaforo, de forma que mientras un proceso escribe, ninguno 
	 *	otro lee o escribe. 
	 *
	 *	por ultime liberan buffers y cierran file descriptors
	 */

	for(i_=0; i_< n_ps ; i_++) {

		switch( fork() ) 
		{
			default: 
				continue;

			case -1: 
				perror("fork"); 

				exit(-4); 

			case 0: 

				if ( i_ != n_ps - 1) 
					aux = quot; 
				else 
					aux = quot + rem; 


				/*Cierro extremos del pipe no usados*/
				if( close(pipe_fd[READ])  == -1) {
					perror("close");

					exit(-3); 
				}

				if( dup2(pipe_fd[WRITE],1)  == -1) {
					perror("dup2");

					exit(-3); 
				}

				if( close(pipe_fd[WRITE]) == -1) {
					perror("close");

					exit(-3); 
				}


				my_list = (list*) malloc( sizeof(list) ); 
				if (my_list == NULL ) {
					perror("malloc"); 

					exit(-1); 
				}
				listInit(my_list);
			

				/*	Inserto nodos y cuento frecuencias	*/
				countFrequencies(my_list, paths, quot, aux, i_); 
				
				/*	Escribo mi lista de frecuencias al pipe	*/
				listPrintRC(my_list, mutex, smp_r, smp_w);



				if( sem_close(mutex) == -1) 
					perror("sem_close");
				
				if( sem_close(smp_r) == -1)
					perror("sem_close");
				
				if (sem_close(smp_w) == -1) 
					perror("sem_close"); 


				close(1); 
				free(my_list); 

				exit(0);


		}
	}

	
	/*	Cierro pipes	*/
	if( close(pipe_fd[0]) == -1)
		perror("close");

	if( close(pipe_fd[1]) == -1)
		perror("close");

	/*	Espero procesos		*/
	for (i_=0 ; i_<n_ps + 1 ; i_++)   {
		if(  wait(&status)  == -1) 
			perror("waitpid ");
	}

	/*	Elimino Semaforos	*/
	if( sem_unlink(SMP0) == -1)
		perror("sem_unlink");

	if( sem_unlink(SMP1) == -1)
		perror("sem_unlink");

	if( sem_unlink(SMP2) == -1)
		perror("sem_unlink");
	
	/*	Cierro los semaforos 	*/
	if( sem_close(mutex) == -1)
		perror("sem_close");

	if( sem_close(smp_r) == -1)
		perror("sem_close");

	if( sem_close(smp_w) == -1)
		perror("sem_close");


	exit(0);
}



