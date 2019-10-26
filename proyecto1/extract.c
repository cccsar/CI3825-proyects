/*
 * Archivo extract.c
 *
 * Descripcion: Archivo fuente con las funciones necesarias para la extraccion
 *  de un archivo .mytar
 *
 * Autores:
 * 	Carlos Alejandro Sivira Munoz 		15-11377
 * 	Cesar Alfonso Rosario Escobar 		15-11295
 */


#include <stdio.h> 
#include <stdlib.h>
#include <sys/types.h> 
#include <sys/stat.h> 
#include <fcntl.h>  
#include <string.h> 
#include <unistd.h>
#include <string.h>
#include "extract.h"

#define STUFF_TOKEN ''
#define CREATION_MODE O_WRONLY | O_TRUNC | O_CREAT
#define max(X,Y) ((X > Y)? X: Y)


/* fileWriterBounded
 * ----------
 * Escribe de un archivo a otro utilizando los "file descriptors" de ambos.
 * Limita el contenido de escritura a un parametro entero.
 *
 *
 * 	fd_source: "file descriptor" del archivo del que se copia.
 * 	fd_dest: "file descriptor" del archivo al que se copia.
 */
void fileWriterBounded(int fd_source, int fd_dest, int total) { 
		
	char buffer[1];
	int just_read, to_write, write_count;
	struct stat st_dest;

	just_read = 1;
	write_count = 0; 
	
	while( (just_read = read(fd_source, buffer, just_read)) != 0 && write_count < total){
	

		to_write = 0;
		while(just_read > to_write)  {
			to_write += write(fd_dest, buffer+to_write, just_read - to_write); /*###ENCRYPT/DECRYPT*/
		}

		write_count += just_read;
	}
}


/* getField
 * --------------
 * Dado un "file descriptor" y un entero, devuelve un string del tamano 
 * especificado obtenido del archivo asociado al "file descriptor". 
 *
 * Como el tamano es calculado antes como el de un campo de cabecera de .mytar,
 * lo que esta funcion realmente devuelve es un "string" asociado a un campo
 * de cabecera.
 *
 *
 * 	fd: "file descriptor" del archivo .mytar.
 *
 * retorna: "string" correspondiente a un campo de cabecera.
 */
char *getField(int fd, int field_length) {
	char *name;
	int just_read;
	int testing;

	name = (char*) malloc ( field_length + 1) ; 

	just_read = read(fd, name, field_length); 
	
	/* se anade terminador de string para no recibir basura adicional */
	name[field_length] = '\0';

	lseek(fd, 1, SEEK_CUR);
	return name; 
}


/* getFieldSize
 * --------------
 * Calcula el tamano de un campo numerico de cabecera, buscando la siguiente
 * aparicion del caracter "" que actua como un separador entre los campos.
 *
 *
 * 	fd: "file descriptor" del .mytar
 *
 * retorna: Un entero que representa el tamano del campo.
 */
int getFieldSize(int fd) { 
	char as;
	int acum;
	int testing;

	as = '0';
	acum = 0;

	while(as != '') {
		acum += read(fd, &as, 1);
	}

	testing = lseek(fd, -acum, SEEK_CUR); 
	acum -=1;

	return acum; 
}


/* putField
 * --------------
 *  Esta funcion utiliza la separacion en campos de la cabecera del archivo 
 *  .mytar para adquirir campos numericos y devolverlos como tipo long.
 *
 *
 *  	fd: file descriptor del .mytar
 *
 *  retorna: un long asociado a un campo numerico de cabecera.
 */
long putField(int fd) {
	char *this_field;
	int size;
	long changed_field;

	size = getFieldSize(fd);
	this_field = getField(fd, size);
	changed_field = atol(this_field);
	free(this_field); 

	return changed_field;
}


/* setModeAndOwn
 * --------------
 * Para cualquier archivo, se encarga de modificar su permisos (bits modales)
 * asi como su dueno y grupo, utilizando ung gid y un uid.
 *
 * 	name: Nombre del archivo
 * 	mode: Bits modales del archivo
 * 	uid: "User ID" del archivo
 * 	gid: "Group ID" del archivo
 */
void setModeAndOwn(char* name, mode_t mode, uid_t uid, gid_t gid) {
	int catcher;
	
	catcher = chmod(name, mode); 
	if (catcher == -1)
		perror("chmod");

	catcher = chown(name, uid, gid);	
	if (catcher == -1) 
		perror("chown");
}


/* createFile
 * --------------
 * Crea un archivo de alguno de los tipos considerados (regulares, directorios,
 * links simbolicos) y actualiza sus atributos.
 *
 *
 * 	fd: "file descriptor" del archivo .mytar
 * 	offset: posicion actual del apuntador en el archivo .mytar
 * 	name: Nombre del archivo que se esta creando
 * 	mode: Modo que se asignara al archivo que se esta creando.
 * 	size: Tamano del archivo que se esta creando
 * 	uid: "User ID" del archivo que se esta creando
 * 	gid: "Group ID" del archivo que se esta creando
 * 	link_name: Nombre del archivo al que apunta un link simbolico (solo para links simbolicos)
 * 	
 * Retorna la posicion actual del apuntador. En caso de error retorna 0.
 */
int createFile(int fd, long offset, char *name, mode_t mode, long size, uid_t uid, gid_t gid, char* link_name) {
	int new_fd;
	int catcher;
	int return_v;
	struct stat test_state;

	return_v = offset;

	/* El archivo es regular */
	if( (mode & __S_IFMT) == __S_IFREG) {
		return_v +=  size;

		new_fd = open(name, CREATION_MODE); 	
		if (new_fd == -1) {
			lseek(fd, size , SEEK_CUR);
			fprintf(stderr,"Error creando archivo %s\n", name); 
			perror("open");
		}
		else {

			setModeAndOwn(name, mode & 07777, uid, gid);
			printf("extracting %o %d %d %ld %s\n", mode & 07777, uid, gid, size, name); /*###VERBOSE*/

			fileWriterBounded(fd, new_fd, size);
			lseek(fd, -1, SEEK_CUR);

			close(new_fd); 			
		}
	}
	/* El archivo es un directorio */
	else if( (mode & __S_IFMT) == __S_IFDIR) {

		if( stat(name, &test_state) == -1 ) {
		
			if( mkdir(name, mode) == -1) {
				fprintf(stderr,"Error creando directorio %s\n",name);
				perror("mkdir");
			}
			else {

				setModeAndOwn(name, mode & 07777, uid, gid);
				printf("extracting %o %d %d %s\n", mode & 07777, uid, gid, name); /*###VERBOSE*/
			}
		}


	}
	/* El archivo es un link simbolico */
	else if( (mode & __S_IFMT) == __S_IFLNK) { /*###IGNORE LINK*/

		new_fd = symlink(link_name, name);
		if (new_fd == -1) {
			fprintf(stderr,"Error creando link\n");
			perror("symlink");
		}	
		else {

			setModeAndOwn(name, mode & 07777, uid, gid);
			printf("extracting %o %d %d %ld %s->%s\n", mode & 0777, uid, gid, size, name, link_name); /*###VERBOSE*/

			free(link_name);
		}

	}

	return return_v;
}


/* gatherFields
 * --------------
 *  Esta funcion junta los campos de cabecera (tanto numericos como no
 *  numericos) con el objeto de reunir los atributos necesarios para 
 *  crear el archivo empaquetado. Esto ultimo lo hace con una llamada a 
 *  create().
 *
 *  Los campos estan ordenados de la forma:
 *  	modo # uid # gid [ # size] # name_size # name [# link_pointer] #
 *
 *  En donde size y link pointer son atributos que solo se extraen de 
 *  directorios y links simbolicos respectivamente.
 *
 *
 *  	fd = "file descriptor" del .mytar
 *
 *  retorna: el offset actual del archivo, o -1 en caso de error.
 */
int gatherFields(int fd) {
	mode_t mode;
	uid_t uid;
	gid_t gid;
	int new_fd, propper_read;
	long size, name_size, current_offset, previous_offset, local;
	char* name;
	char* link_pointer;

	
	mode = putField(fd);
	uid = putField(fd);
	gid = putField(fd);

	if ( (mode & __S_IFMT) != __S_IFDIR ) {
		size = putField(fd);
	}
	name_size = putField(fd);	

	name = (char*) malloc(name_size + 1);  		
	propper_read = read(fd, name, name_size ); 	
	name[name_size] = '\0';

	/* Para los links simbolicos, extraigo el apuntador */
	if( (mode & __S_IFMT) == __S_IFLNK) {
		current_offset = lseek(fd, 1, SEEK_CUR); 

		link_pointer = (char*) malloc(size + 1);
		propper_read = read(fd, link_pointer, size);

		if (propper_read == -1)
			perror("read");
		link_pointer[size] = '\0';
	}

	previous_offset = lseek(fd, 1, SEEK_CUR); 

	/* Creo el tipo de archivo y asigno sus atributos */
	current_offset = createFile(fd, previous_offset, name, mode, size, uid, gid, link_pointer);


	free(name); 					
	return max(previous_offset, current_offset);
}



/* extractMyTar
 * --------------
 * Recibe un archivo .mytar y se encarga de extraer su contenido.
 *
 * 	mt_name: Nombre del archivo .mytar a procesar	
 */
int extractMyTar(char **mt_name) {  			
	
	int fd_s;
	long stop, pointer;
	struct stat mytar_state;

	if ( (fd_s = open(mt_name[1],O_RDONLY)) == -1)   {
		perror("open");
		return -1;
	}

	if ( stat(mt_name[1], &mytar_state) == -1)  {
		perror("stat");
		return -1;
	}

	pointer =0 ;
	stop = mytar_state.st_size;

	fprintf(stdout,".mytar total size: %ld\n",stop); /*#dbg*/
	
	while(pointer != stop) {
		pointer = gatherFields(fd_s);
	}

	close(fd_s);

	return 0; 
}




