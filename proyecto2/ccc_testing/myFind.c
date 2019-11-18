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
			
			len = strlen( pathname ); 

			if (pathname[len-1] != '/')
				strcat(pathname,"/"); 

			/* Extiendo el pathname para que incluya el nombre de la 
			 * entrada actual */
			strcat(pathname, current_ent->d_name);	

			if(lstat(pathname, &current_st) == -1)
				perror("stat");
			
			 printf("%s\n",pathname);  
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

				/*implementar find_suffix*/
				if (isTxt(current_ent->d_name)) {
					sprintf(curr_inode,"%ld",current_st.st_ino); 
					printf("%s\n",curr_inode);

					if( trieInsert(inodes, curr_inode) )  {
						paths[ind] = pathname; 
						term += 1; 
					}	


					/* implementar search_dict para buscar inodo 
					 * if ( !dict_contains(current_ent->d_ino) ) { 
					 * 	dict_insert(current_ent->d_ino, current_ent->d_name); 
					 * }
					 */
				}
			}
			else if ( S_ISDIR(current_st.st_mode) ) {
			  	curr_dir = opendir(pathname); 

			 	help = traverseDir(curr_dir, pathname, inodes, paths, ind + term); 

				closedir(curr_dir);
			}

		}
	}


	return help;  
}



/* myFind
 * --------------
 *
 *
 */
int myFind (char *dirname) { /* POR AHORA: 
	 * 	solo funciona buscando archivos en un arbol de directorios y 
	 * 	revisando si son .txt
	 */

	int i_, kk;
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
		kk = traverseDir(dir, dirname, &inodes, paths, 0); 
	}


	visited = (pair *) malloc( sizeof(pair) * inodes.size) ; 
	for(i_=0; i_<inodes.size; i_++) {
		visited[i_].first = -1; 
		visited[i_].second = 0 ;
	}

	trieDfs(&inodes, visited, 0, inodes.root); 
	trieDfsRec(visited, inodes.size ); 



	/* Paths de los archivos encontrados */
	for(i_=0; i_<kk; i_++)
		printf("%s\n",paths[i_]);
	
	free(paths);

	return 0; 
}

