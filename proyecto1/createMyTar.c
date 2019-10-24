
#include <stdio.h> 
#include <stdlib.h>
#include <sys/types.h> 
#include <sys/stat.h> 
#include <fcntl.h>  
#include <dirent.h> 
#include <string.h> 
#include <unistd.h>
#include <string.h>

#define MAX_RW 16

#define MY_PERM S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH //this is probably optional ###

#define FNAME_LIMIT 256 
#define FINT_LIMIT 10 + 1 

#define STUFF_TOKEN ''

#define TRUE 1
#define FALSE 0


/* writeToDest
 * ----------
 * Writes a string "text" to the file descriptor represented by fd_dest. Since 
 * we are creating a .mytar, it is assumed that fd_dest is asociated with a
 * file opened in append mode. 
 * 
 * 	fd_dest: An integer representing a file descriptor to the file to write.
 * 	text: String containing what will be written.
 * 	size: Size of the string to write.
 *
 */
void writeToDest(int fd_dest, char* text, int size) {	
						
	int read_size ; 
	
	/* secure writting */
	read_size = 0;
	while(size > read_size)
		read_size+=write(fd_dest, text+read_size,size-read_size);
}


/* fillField
 * ----------
 * This function calculates the remaining space after inserting a variable
 * size field, and padds it with a special character  == '\2' (by writting) until fitting 
 * a predefined fixed length field. 
 *
 * After that it calls writeToDest to put the field into the .mytar file
 *
 * fixed length fields are : FNAME_LIMIT, FINT_LIMIT
 *
 *
 * 	fd_dest: file descriptor of the file to write.
 *	content_size:  Size of the field name to write 
 * 	token_field_size:
 */
void fillField(int fd_dest,int content_size, int token_field_size) {
	
	int k, diff, to_write_size, preferred_size;
	
	/* This is added to adjust the buffer for writting depending on the field being set */
	char buffer[token_field_size];

	/* here i calculate how much to fill to keep constant size fields */
	diff = token_field_size - content_size;

	if(diff == 0)
		to_write_size = token_field_size;
	else
		to_write_size = diff;

	// create the padding string and append It to my fd /
	for (k=0; k<to_write_size; ++k)
		buffer[k] = STUFF_TOKEN;
	

	writeToDest(fd_dest, buffer, to_write_size);
}


/* setHeadFields
 * ----------
 * Sets the header fields for files. This fields are name, mode and 
 * only for regular files, the size.
 *
 * 	state: state of the file whose attributes are being added to the archive.
 * 	fd_dest: file descriptor of my archive.
 * 	name: Name of the file being processed.
 *
 */
void setHeadFields(int fd_dest, struct stat state, char *name, int is_dir) {
						//Aun no verifico que lea todo lo que debe leer
	/* There could be more fields added or removed at will. This is 
	 * for now, just a test function */
	int len;

	/*	Anado el nombre del archivo 	*/
	len = dprintf(fd_dest ,"%s", name); 
	len = dprintf(fd_dest,"%s","");
	if (len == -1 ) { 		///  por ahora ###
	 	perror("dprintf");
		exit(0);
		return;
	} 
	//else 
		//fillField(fd_dest, len, FNAME_LIMIT);


	/*	Anado el modo del archivo 	*/
	len = dprintf(fd_dest,"%ld", (unsigned long)state.st_mode);	
	len = dprintf(fd_dest,"%s","");
	if (len == -1 ) { 		///  por ahora ###
	 	perror("dprintf");
		return;
	} 
	//else 
		//fillField(fd_dest, len, FINT_LIMIT);

	// ###probando
	/*	Anado el uid del archivo 	*/
	len = dprintf(fd_dest,"%ld", (unsigned long)state.st_uid);
	len = dprintf(fd_dest,"%s","");
	if (len == -1) {
	 	perror("dprintf");
		return;
	} 
	//else 
		//fillField(fd_dest, len, FINT_LIMIT);
	
	// ###probando
	/*	Anado el gid del archivo 	*/
	len = dprintf(fd_dest,"%ld", (unsigned long)state.st_gid);
	len = dprintf(fd_dest,"%s","");
	if (len == -1) {
	 	perror("dprintf");
		return;
	} 
	//else 
		//fillField(fd_dest, len, FINT_LIMIT);

	if(!is_dir)
       	{
		/* append and stuff the SIZE of the file */
		len = dprintf(fd_dest,"%ld",(unsigned long)state.st_size); 
		len = dprintf(fd_dest,"%s","");
		if (len == -1 ) { 		///  por ahora ###
	 		perror("dprintf");
			return;
		} 
		//else 
			//fillField(fd_dest, len, FINT_LIMIT); 

	}
}



/* fileWriter
 * ----------
 * Writes from a file to another by using its file descriptors.
 *
 * 	fd_source: file descriptor of the file to write from.
 * 	fd_dest: file descriptor of the file to write.
 *
 */
void fileWriter(int fd_source, int fd_dest) { 
		
	char buffer[MAX_RW], header[MAX_RW];
	int just_read, to_write;
	struct stat st_dest;

	just_read = MAX_RW;
	
	while( (just_read = read(fd_source, buffer, just_read)) != 0) {
	
		to_write = 0;
		while(just_read > to_write) 
			to_write += write(fd_dest, buffer+to_write, just_read - to_write);
	}



}


/* handleFileType
 * --------------
 *  Esta funcion recibe un 'struct stat' que le permite determinar el tipo 
 *  de archivo, y asignar campos de cabecera de .mytar en funcion de ello.
 *
 *  	fd_dest: File descriptor de archivo .mytar.
 *  	pathname: nombre del archivo que se esta procesando.
 *  	current_st: Estado del archivo.
 *
 * Retorna NULL, o DIR* en caso de que el archivo procesado sea un directorio.
 * Esto porque si es un directorio, debo procesar sus campos de cabecera y 
 * luego recorrerlo recursivamente y para esto necesito devolver un apuntador
 * al directorio abierto a la funcion que llama.
 *
 */
DIR *handleFileType(int fd_dest, char* pathname, struct stat current_st) {

	DIR *ith_pointer;
	int current_fd_dest;

	if ( (current_st.st_mode & S_IFMT) == S_IFDIR ) {

		ith_pointer = opendir(pathname); 			//#a#d ### 
		if ( ith_pointer == NULL ) { 			
			fprintf(stderr,"No se pudo abrir %s\n", pathname);
			perror("opendir");
			return NULL;
		}

		printf("archiving %s\n",pathname); 

		setHeadFields(fd_dest, current_st, pathname, TRUE);
		
		return ith_pointer;
	}
	else if ( (current_st.st_mode & S_IFMT) == S_IFREG ) {
	
		current_fd_dest = open(pathname, O_RDONLY); 		//#a# ### 
		if(current_fd_dest == -1)  {
			fprintf(stderr,"No se pudo abrir %s\n",pathname);
			perror("open");
			return NULL;
		}

		printf("archiving %s\n",pathname); 

		setHeadFields(fd_dest, current_st, pathname, FALSE);
		fileWriter(current_fd_dest, fd_dest); 
		close(current_fd_dest);				//#c# ###
	}
	else if ( (current_st.st_mode & S_IFMT) == S_IFLNK) {

		printf("DO SOMETHING\n");
	}
	else if ( (current_st.st_mode & S_IFMT) == S_IFIFO) { 

		printf("DO SOMETHING\n");
	}

	return NULL;
}


/* traverseDir
 * ----------
 * Used to traverse a directory tree and write file fields into the archive, along with
 * the file content. It does this recursively, in a similar way to a dfs graph traverse.
 *
 * It does this by, first, avoiding "." and ".." directory entries and 
 * from there it goes by each directory entry, processing it fields (name, permissions, 
 * and size only for regfiles), and copying directories and regfile metadata to .mytar
 * as well as regfile content.
 *
 * 	dir: Directory pointer to the dir to traverse.
 * 	dirname: name of the directory to traverse.
 * 	fd: file descriptor of the archive file.
 *
 */
void traverseDir(DIR *dir, char *dirname, int fd) { 

	int len; 
	char path[256], pathname[256];
	DIR *is_dir;
	struct dirent *current_ent; 
	struct stat current_st; 

	strcpy(path, dirname); 

	while( (current_ent=readdir(dir)) != NULL ) { 

		if( strcmp(current_ent->d_name,".")!=0 && strcmp(current_ent->d_name,"..")!=0) 
		{
			strcpy(pathname, path); 		
			
			len = strlen( pathname ); 
			//strcpy(pathname_buff, pathname); 

			if (pathname[len-1] != '/')
				strcat(pathname,"/"); 

			/* Extiendo el pathname para que incluya el nombre de la 
			 * entrada actual */
			strcat(pathname, current_ent->d_name);	


			if(lstat(pathname, &current_st) == -1)
				perror("stat");
			
			is_dir = handleFileType(fd, pathname, current_st);
			if (is_dir != NULL) {
				traverseDir(is_dir, pathname, fd);
				closedir(is_dir);
			}

			//strcpy(pathname, pathname_buff);	 // funciona sin esto
		}
	}

}


/* createMyTar
 * --------------
 * Used to create the .mytar file. It beggins setting up the 
 * process creation mask and then it creates the .mytar file.
 *
 * After that it parses every file in the commandline first finding out
 * wether it exists, setting its head field, and then:
 * 	if it is a directory: open it -> traversing it -> on termination it is
 * 		closed
 * 	if it is a regular file: open it -> write it to mytar -> 
 * 		on termination it is closed
 *
 * Requires: 
 * 	access to argv
 *
 */
int main (int argc, char **argv) {  		//File create
	
	
	int fd, current_fd, i;
	char *local_path = (char*) malloc(1000*sizeof(char));
	DIR *dir, *current_dir;
	struct stat current_st;

	/* comandline goes like  traverseDir name_dest arg** */
	/*First assuming the commandline goes right */
	 

	umask(0000); 				//### Probablemente quiera cambiarla cuando vaya a crear
						//mejor dejar que open(..O_CREATE) haga el set de los permisos
						//la umask sera la del usuario
	fd = open(argv[1], O_WRONLY | O_APPEND | O_TRUNC | O_CREAT, MY_PERM);
	if (fd == -1)
	{
		perror("open\n"); 
		exit(-1); 
	}


	for(i=2; i<argc; i++) { 

		if( stat(argv[i], &current_st) != 0) { 					//verifico que el stat se guarde
			perror("stat");
			continue;
		}
		
		//strcat(local_path,"./");
		strcat(local_path, argv[i]);
		
		current_dir = handleFileType(fd, local_path, current_st) ;

		if (current_dir != NULL) {
			traverseDir(current_dir, argv[i], fd);
			closedir(current_dir); 					//#c# ###
		}
	}

	close(fd);								//#c# ###
		
	exit(0);	
}


