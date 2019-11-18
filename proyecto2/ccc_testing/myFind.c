/*
 * Archivo: nombre.c/.nombre.h
 *
 * Descripcion:	
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
#include <fcntl.h>  
#include <dirent.h> 
#include <string.h> 
#include <unistd.h>
#include <string.h>
#include "trie.h"

#define TRUE 1
#define FALSE 0
#define MAX_PATHNAME 5000
#define INODE_SIZE 20
#define MAX_FILES 200


/* isTxt
 * --------------
 *
 *
 */
int isTxt(char *name) { 
	int n = strlen(name); 

	if ( n>4 && (name[n-1] == 't') && (name[n-3] == 't') && (name[n-2] == 'x') && (name[n-4] == '.') ) {
		return TRUE; 
	}
	/* o tambien se puede usar 
	if (strstr(name, ".txt") ){ 
		return TRUE; 
	}
	*/

	return FALSE; 
}


/* traverseDir
 * --------------
 *
 *
 */
int traverseDir(DIR *dir, char *dirname, trie *inodes, char** paths, int ind) { 

	int len, term, help; 
	char path[MAX_PATHNAME], pathname[MAX_PATHNAME], curr_inode[INODE_SIZE]; 
	DIR *curr_dir;
	struct dirent *current_ent; 
	struct stat current_st; 

	term = 0;
	strcpy(path, dirname); 

	while( (current_ent=readdir(dir)) != NULL ) { 

		if( strcmp(current_ent->d_name,".")!=0 && strcmp(current_ent->d_name,"..")!=0) 
		{
			strcpy(pathname, path); 		
			
			len = strlen( pathname ) ;

			if (pathname[len-1] != '/')
				strcat(pathname,"/"); 

			/* Extiendo el pathname para que incluya el nombre de la 
			 * entrada actual */
			strcat(pathname, current_ent->d_name);	

			if(lstat(pathname, &current_st) == -1)
				perror("stat");
			
			/* Verifica que la entrada revisada sea un directorio
			 * Si lo es: 
			 * 	lo recorre
			 * de lo contrario 
			 * 	revisa el sufijo del nombre:
			 * 	Si es .txt:
			 * 		si no esta registrado el inodo asociado:
			 * 			lo guarda
			 * 		de lo contrario:
			 * 			lo ignora
			 * 	de lo contrario:
			 * 		lo ignora
			 */
			if ( S_ISREG(current_st.st_mode) || S_ISLNK(current_st.st_mode) )  {

				/*esto podria ser una funcion###*/
				if (isTxt(current_ent->d_name)) {

					/* utilizar mejor lectura/escritura segura ###*/
					sprintf(curr_inode,"%ld",current_st.st_ino); 

					if( trieInsert(inodes, curr_inode) == TRUE )  {
						/*pido el espacio exacto para cada string*/
						paths[ind + term] = (char* ) malloc( sizeof(char) * strlen(pathname) + 1); 
						/*copio el string, puede traer problemas###*/
						strcpy(paths[ind+term],pathname);
						term += 1; 
					}	
				}
			}
			else if ( S_ISDIR(current_st.st_mode) ) {
			  	curr_dir = opendir(pathname); 

			 	help +=traverseDir(curr_dir, pathname, inodes, paths, ind + term); 

				closedir(curr_dir);
			}

		}
	}

	help += ind+term; 
	return help;  
}



/* myFind
 * --------------
 * Busca archivos con el sufijo .txt en una jerarquia de directorios,
 * verifica que ninguno sea un hard link de otro y recupera la lista
 * de pathnames
 *
 *
 * 	dirname: nombre de la raiz del arbol de directorios
 *
 * Retorna >0 si hay error, 1 en caso de exito
 */
int myFind (char *dirname) { /* POR AHORA: 
	 * 	solo funciona buscando archivos en un arbol de directorios y 
	 * 	revisando si son .txt
	 */

	int i_, n_paths;
	pair *visited; 
	char **paths; 
	DIR *dir; 
	struct stat d_stat; 	
	trie inodes; 

	/* se asume maximo de archivos por ahora */
	paths = (char **) malloc( sizeof(char*) * MAX_FILES ); 
	trieInit(&inodes); 

	if ( stat(dirname, &d_stat) == -1 )
		perror("stat"); 

	/* Verificar que es un directorio antes de recorrer */
	if( !S_ISDIR(d_stat.st_mode) ) {
		fprintf(stderr,"Not a directory\n");
		exit(-1);
	}
	else { 
		dir = opendir(dirname); 
		n_paths = traverseDir(dir, dirname, &inodes, paths, 0); 
	}

	printf("n_paths %d\n",n_paths); 
	  /* Paths de los archivos encontrados   */
	/*for(i_=0; i_<n_paths; i_++)   */
		/*printf("%s\n",paths[i_]);   */



	/*frees*/
	for(i_=0; i_<n_paths; i_++)   
		free(paths[i_]);
	free(paths);


	printf("Current size %d\n",inodes.size);
	printf("Current capacity %d\n",inodes.capacity); 
	printf("Number of words inserted %d\n",inodes.n_words);
	exit(1);
}

	/* DGB for trie 
	visited = (pair *) malloc( sizeof(pair) * inodes.size) ; 
	for(i_=0; i_<inodes.size; i_++) {
		visited[i_].first = -1; 
		visited[i_].second = -1 ;
	}
	visited[0].first = 0;

	trieDfs(&inodes, visited, 0, inodes.root); 
	trieDfsRec(visited, inodes.size );  

	printf("Current size %d\n",inodes.size);
	printf("Current capacity %d\n",inodes.capacity); 
	printf("Number of words inserted %d\n",inodes.n_words);
	*/

