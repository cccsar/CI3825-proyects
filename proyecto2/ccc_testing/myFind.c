/*
 * Archivo: nombre.c/.nombre.h
 *
 * Descripcion:	Archivo fuente para las funciones asociadas al recorrido 
 * de directorios
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


/* arrangeMod
 * --------------
 * Recibe dos enteros y calcula el modulo del maximo entre el minimo de ellos
 *
 * 	a: entero a considerar
 * 	b: entero a considerar
 */
int arrangeMod(int a , int b) {
	return MAX(a,b) % MIN(a,b); 
}


/* extendWords
 * --------------
 * Actualiza la memoria alojada para un arreglo de string si se acerca a
 * un multiplo de su tamano alojado actual
 *
 *	paths: arreglo de strings
 * 	next_ceil: multiplo de su tamano actual
 *
 */
void extendWords(char*** paths, int next_ceil) { 
	if( ( *paths = (char**) realloc(*paths, sizeof(char*) * 
					(next_ceil + REG_SIZE) ) ) == NULL)
		perror("realloc");
}


/* isTxt
 * --------------
 * Verifica que el sufijo de un string sea ".txt"
 *
 * 	name: string cuyo sufijo se verifica
 */
int isTxt(char *name) { 
	int n = strlen(name); 

	if ( n>4 && (name[n-1] == 't') && (name[n-3] == 't') && 
			(name[n-2] == 'x') && (name[n-4] == '.') ) {
		return TRUE; 
	}

	return FALSE; 
}


/* traverseDir
 * --------------
 * Esta funcion recorre de forma recursiva un arbol de directorios dado un 
 * directorio raiz, y anade a un arreglo de strings aquellos nombres de
 * archivo que tengan el sufijo ".txt".
 *
 * Para evitar repeticiones por hard links, emplea una tabla de hash
 * en la que guarda los inodos de cada nuevo archivo encontrado, asi 
 * si se encuentra otro hard link de un archivo ya revisado, este se evita.
 *  	
 * Se utiliza un char*** para poder actualizar el tamano del arreglo de 
 * strings en caso de que se alcance su cota base, y la nueva direccion se 
 * preserve luego de la llamada a la funcion.
 *
 *
 *  	dir: Apuntador a directorio que se recorre
 *  	dirname: nombre del directorio que se recorre
 *  	inodes: tabla de hash para inodos
 *  	paths: direccion de memoria del arreglo de strings
 *  	ind: Entero usado para indizar el proximo nombre de archivo a guardar
 *
 * Retorna el numero de archivos que cumplen los criterios mencionados.
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

		if( strcmp(current_ent->d_name,".")!=0 
				&& strcmp(current_ent->d_name,"..")!=0) 
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

				paths[0][ind+term] = (char*) malloc(sizeof(char)*
					       	strlen(pathname) + 1); 

				if (paths[0][ind+term] == NULL)
					perror("malloc");

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
 * 	dirname: nombre de la raiz del arbol de directorios
 * 	paths: direccion del arreglo de strings
 *
 * Retorna el numero de archivos que cumplen un criterio.
 */
int myFind (char *dirname, char ***paths) { 

	int n_paths;
	DIR *dir; 
	struct stat d_stat; 	
	hasht inodes; 


	hashtInit(inodes); 


	if ( stat(dirname, &d_stat) == -1 )
		perror("stat"); 

	if( !S_ISDIR(d_stat.st_mode) ) {
		fprintf(stderr,"Not a directory\n");
		exit(-1);
	}
	else { 
		dir = opendir(dirname); 
		n_paths = traverseDir(dir, dirname, inodes, paths, 0); 
	}


	hashtDestroy(inodes);
	closedir(dir);

	return n_paths;
}
