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
#include "hasht.h"

#define TRUE 1
#define FALSE 0

#define MAX_PATHNAME 5000

#define STANDARD_SIZE 419 
#define REG_SIZE 419 

#define MIN(a,b) ((a < b)? a: b)
#define MAX(a,b) ((a > b)? a: b) 


int arrangeMod(int a , int b) {
	return MAX(a,b) % MIN(a,b); 
}

/* extendWords
 * --------------
 *	Actualiza la memoria aloja para un arreglo de string si se acerca a
 *	un multiplo de su tamano alojado actual
 *
 *
 *	paths: arreglo de strings
 *	next_ceil: multiplo de su tamano actual
 *
 */
void extendWords(char*** paths, int next_ceil) { 
	char** newpaths; 
	
	/*printf("previous size: %d\t address:%p\n",next_ceil, (void*)*paths); */

	if( ( *paths = (char**) realloc(*paths, sizeof(char*) * (next_ceil + REG_SIZE) ) ) == NULL)
		perror("realloc");

	/*printf("new size: %d\taddress: %p\n", (next_ceil + REG_SIZE) * 4, (void*)*paths ); */


}


/* isTxt
 * --------------
 * 	Verifica que el sufijo de un string sea ".txt"
 *
 *
 * 	name: string cuyo sufijo se verifica
 */
int isTxt(char *name) { 
	int n = strlen(name); 

	if ( n>4 && (name[n-1] == 't') && (name[n-3] == 't') && (name[n-2] == 'x') && (name[n-4] == '.') ) {
		return TRUE; 
	}

	return FALSE; 
}


/* traverseDir
 * --------------
 *
 *
 */
int traverseDir(DIR *dir, char *dirname, hasht inodes, char*** paths, int ind) { 

	int len, term, help; 
	char path[MAX_PATHNAME], pathname[MAX_PATHNAME]; 
	DIR *curr_dir;
	struct dirent *current_ent; 
	struct stat current_st; 


	help = 0;
	term = 0;
	strcpy(path, dirname); 

	while( (current_ent = readdir(dir)) != NULL ) { 

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

			/*printf("pathname: %s\n",pathname); */
			
			/*Se ignoraran links simbolicos*/
			if ( S_ISREG(current_st.st_mode) &&
				       	isTxt(current_ent->d_name) &&
					hashtInsert(inodes,current_st.st_ino) ) 
			{

				if ((arrangeMod(STANDARD_SIZE, ind+term+1) == 0) 
						&& (ind + term + 1 != 1))	
				{
					extendWords(paths, ind + term + 1); 
				}

				/*pido el espacio exacto para cada string*/
				paths[0][ind+term] = (char*) malloc(sizeof(char)*
					       	strlen(pathname) + 1); 

				if (paths[0][ind+term] == NULL)
					perror("malloc");
				/*copio el string, puede traer problemas###*/


				strcpy( paths[0][ind+term],pathname);
				term++;
			}
			else if ( S_ISDIR(current_st.st_mode) && 
					!S_ISLNK(current_st.st_mode) ) 
			{
			  	if( (curr_dir = opendir(pathname) ) == NULL)
					perror("opendir ");


			 	term += traverseDir(curr_dir, pathname, 
						inodes, paths, ind + term ); 

				closedir(curr_dir);
			}

		}
	}



	help += term;
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
int myFind (char *dirname, char ***paths) { 

	int i_, n_paths;
	DIR *dir; 
	struct stat d_stat; 	
	hasht inodes; 


	hashtInit(inodes); 


	if ( stat(dirname, &d_stat) == -1 )
		perror("stat"); 

	/* Verificar que es un directorio antes de recorrer */
	if( !S_ISDIR(d_stat.st_mode) ) {
		fprintf(stderr,"Not a directory\n");
		exit(-1);
	}
	else { 
		dir = opendir(dirname); 
		n_paths = traverseDir(dir, dirname, inodes, paths, 0); 
	}


	/*fprintf(stderr,"final address within myFind: %p\n", (void *)*paths); */
	hashtDestroy(inodes);

	  /* Paths de los archivos encontrados   */
	/*for(i_=0; i_<n_paths; i_++)   */
		/*printf("%s\n",paths[0][i_]);   */
	return n_paths;


}

				/*MODULO DEBUGGING*/
				/*printf("numero de archivos encontrados %d,\t %d %% %d = %d\n",*/
						/*ind+term,STANDARD_SIZE, ind+term+1,*/
						/*MAX(STANDARD_SIZE, (ind+term+1))%*/
				     		/*MIN(STANDARD_SIZE,(ind+term+1) ) );*/
