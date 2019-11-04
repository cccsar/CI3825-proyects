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

#define TRUE 1
#define FALSE 0
#define MAX_PATHNAME 5000


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

void traverseDir(DIR *dir, char *dirname) { 

	int len; 
	char path[MAX_PATHNAME], pathname[MAX_PATHNAME]; 
	DIR *curr_dir;
	struct dirent *current_ent; 
	struct stat current_st; 

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

					/* implementar search_dict para buscar inodo 
					 * if ( !dict_contains(current_ent->d_ino) ) { 
					 * 	dict_insert(current_ent->d_ino, current_ent->d_name); 
					 * }
					 */
				}
			}
			else if ( S_ISDIR(current_st.st_mode) ) {
			  	curr_dir = opendir(pathname); 

			 	traverseDir(curr_dir, pathname); 

				closedir(curr_dir);
			}

		}
	}

}

int main (int argc, char **argv) { 
	/* POR AHORA: 
	 * 	solo funciona buscando archivos en un arbol de directorios y 
	 * 	revisando si son .txt
	 */

	DIR *dir; 
	struct stat d_stat; 	

	if ( stat(argv[1], &d_stat) == -1 )
		perror("stat"); 

	/* Verificar que es un directorio antes de recorrer */
	if( !S_ISDIR(d_stat.st_mode) ) {
		fprintf(stderr,"Not a directory\n");
		exit(-1);
	}
	else { 
		dir = opendir(argv[1]); 
		traverseDir(dir, argv[1]); 
	}

	return 0; 
}

