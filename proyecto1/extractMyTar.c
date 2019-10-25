#include <stdio.h> 
#include <stdlib.h>
#include <sys/types.h> 
#include <sys/stat.h> 
#include <fcntl.h>  
#include <dirent.h> 
#include <string.h> 
#include <unistd.h>
#include <string.h>

#define FNAME_LIMIT 256 //this is up to 256 char*
#define FMODE_LIMIT 10  //this is int 
#define FSIZE_LIMIT 20 	//this is long int
#define MAX_RW 32
#define NFIELDS 5
#define STUFF_TOKEN ''

#define MY_PERM S_IRWXU | S_IRGRP | S_IWGRP | S_IROTH
#define CREATION_MODE O_WRONLY | O_TRUNC | O_CREAT

#define TRUE 1
#define FALSE 0

/* fileWriter2
 * ----------
 * Writes from a file to another by using its file descriptors. It optionally
 * writes up to 'total' characters, depending on wether the flag bounded is set.
 *
 * 	fd_source: file descriptor of the file to write from.
 * 	fd_dest: file descriptor of the file to write.
 *
 */
void fileWriter2(int fd_source, int fd_dest, int total) { 
		
	char buffer[MAX_RW], header[MAX_RW];
	int just_read, to_write, write_count;
	struct stat st_dest;

	just_read = 1;
	write_count = 0; 
	
	while( (just_read = read(fd_source, buffer, just_read)) != 0 && write_count <= total){
	
		to_write = 0;
		while(just_read > to_write) 
			to_write += write(fd_dest, buffer+to_write, just_read - to_write);

		write_count += just_read;
	}
}


/* getFieldSize
 * --------------
 *  It reads from the begginning of a field, until the first occurrence of
 *   character, then it returns its size
 *
 * On termination it accommodates file offset for propper writting (on floor)
 *
 * 	fd_orig: file descriptor of the .mytar file
 * 	roof: offset of the .mytar file that matches the end of a field.
 * 	floor: offset of the .mytar file that matches the beggining of a field.
 *
 */
off_t getFieldSize(int fd_orig, int roof,int floor) {
	char char_read;
	off_t current_offset, required_size, final_offset;
	ssize_t just_read ;
	
	char_read = 'a';

	//current_offset = lseek(fd_orig, roof, SEEK_SET);
	current_offset = lseek(fd_orig, floor, SEEK_SET);

	/* Move file offset from roof till the first appareance of the @ 
	 * character */
	while(char_read != 2) {
		just_read = read(fd_orig, &char_read, 1);
		current_offset += just_read; 
		
	}
	
	current_offset -= 1;

	//fprintf(stdout,"size of field %d\n",current_offset); #dbg#

	required_size = current_offset-floor;
	//printf("name size: %ld\n",required_size);  //#dbg#
	
	/* relocate the offset in the beggining. This could be avoided */
	final_offset = lseek(fd_orig, floor, SEEK_SET);
	
	//fprintf(stdout,"final offset %ld\n",final_offset); #dbg# 
	return required_size;
}


/* getField
 * --------------
 * Given a file descriptor and two offset from a .mytar file, it gets
 * the field bounded by roof and floor and returns it as a character
 * for further processing (creating directories, files, and setting 
 * permissions)
 *
 * 	fd: file descriptor of mytar file. 
 * 	roof: offset of the field upper bound. 
 * 	floor: offset of the field lower bound. 
 *
 */
char *getField(int fd, int roof, int floor) {
	char* name;
	int just_read, final_offset;
	off_t field_length;

	field_length = getFieldSize(fd, roof, floor);
	name = (char*) malloc(field_length + 1); 			//###
	just_read = read(fd, name, field_length);
	//printf("numero de caracteres leido: %d\n",just_read); 	//#dbg#
	//printf("caracter leido: %s\n",name); 				//#dbg#

	final_offset = lseek(fd, roof, SEEK_SET);
	//fprintf(stdout,"\t\tcurrent offset: %d\n",final_offset);	#dbg#

	return name;
}

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


char *newGetField(int fd, int field_length) {
	char *name;
	int just_read, final_offset;
	int testing;

	name = (char*) malloc ( field_length) ; //### hacer free de esto

	just_read = read(fd, name, field_length); //no estoy seguro de en donde queda el offset
	if(just_read == -1) 
		perror("read");
	//printf("characters read %d\n",just_read);
	testing = lseek(fd, 1, SEEK_CUR);

	printf("\tfile offset when getting field %d\n",testing); // #dbg# ###

	//final_offset = lseek(fd, field_length + 1, SEEK_CUR); // no estoy seguro de como queda el offset
	return name; 
}


int newGetFieldSize(int fd) { 
	char as;
	int acum;
	int testing;

	as = '0';
	acum = 0;

	while(as != '') {
		acum += read(fd, &as, 1);
	}
	testing = lseek(fd, -(acum), SEEK_CUR); // no estoy seguro de como queda el apuntador
	acum -=1;
	printf("\tfield size: %d\n",acum);
	printf("\tfile offset when getting field size %d\n",testing); // #dbg# ###


	//current_field = NewGetField(fd, acum);
	return acum; 
}


long putField(int fd) {
	char *this_field;
	int size;
	long changed_field;

	size = newGetFieldSize(fd);
	this_field = newGetField(fd, size);
	changed_field = atol(this_field);

	return changed_field;
}

		
int newFileCreation(int fd) {
	mode_t mode;
	uid_t uid;
	gid_t gid;
	int new_fd, propper_read;
	long size, name_size, current_offset;
	char* name;

	/* Asigno los campos de encabezado necesarios */
	mode = putField(fd);
	printf("mode: %ld\n", (long) mode);
	uid = putField(fd);
	printf("uid: %ld\n" ,(long)uid);
	gid = putField(fd);
	printf("gid: %ld\n" ,(long)gid);

	if ( !((mode & S_IFMT) == S_IFDIR) ) {
		size = putField(fd);
		printf("size: %ld\n",size);
	}

	name_size = putField(fd);	
	printf("file name size: %ld\n" ,name_size);

	name = (char*) malloc( name_size  );  		// #malloc# ###
	propper_read = read(fd, name, name_size); 	

	printf("filename: %s\n",name);

	current_offset = lseek(fd, 0, SEEK_CUR);

	/* Creo el tipo de archivo y asigno sus atributos */
	if( (mode & S_IFMT) == S_IFREG) {
		new_fd = open(name, CREATION_MODE); 	// #open#  ###
		if (fd == -1) {
			fprintf(stderr,"Error creando archivo\n");
			perror("open"); //tal vez mover el offset a size
		}
		else {

			chmod(name, mode); 
			chown(name, uid, gid);	
		
			fileWriter2(fd, new_fd, size);
			close(new_fd); 				// #close# ###
		}
		current_offset += size;
	}
	else if( (mode & S_IFMT) == S_IFDIR) {
		
	}
	else if( (mode & S_IFMT) == S_IFLNK) {

	}
	
	printf("current offset :%ld \n", current_offset);
	free(name); 					//#free# ###

	return current_offset;
}




/* extractMytar
 * --------------
 * It receives a .mytar file and extracts it to current path. It uses 
 * file offsets to extract fields and content from .mytar file. 
 *
 * First it receives the name of the .mytar file. If it exists, it starts 
 * parsing its fields. 
 *
 */
int main (int argc, char **argv) {  			//extract file
	
	int fd_s, ith_roof, ith_floor, turn, i, name_size;
	int acum, fd_d, n_fields;
	long stop, file_uid, file_gid, pointer, buffer;
	char *file_name, *fmode, *fsize, *fname_size, *fuid, *fgid;
	char as[1];
	mode_t file_mode;
	off_t file_size;
	struct stat mytar_state, current_filename;

	ith_floor = ith_roof = 0;
	pointer =0 ;

	acum = 0;

	/*ARGV[1] is source file, and contains description for destination files*/

	if ( (fd_s = open(argv[1],O_RDONLY)) == -1)  
		perror("open");

	if ( stat(argv[1], &mytar_state) == -1) 
		perror("stat");

	stop = mytar_state.st_size;
	fprintf(stdout,".mytar total size: %ld\n",stop); //#dbg
	
	while(pointer != stop) {
		pointer = newFileCreation(fd_s);
		printf("%ld\n",pointer);
	}
	/*
	while( ith_roof != stop ) { 				//### Esto puede traer errores
		// All of this is possible thanks to offset updating.
		 * To begin with, ith_floor and ith_roof represent, respectively,
		 * the symbolic beggining of next-to-process field, and the simbolic
		 * limit of next to process field.
		 *
		 * As a field is parsed, the limits are updated, and when a file is written,
		 * they need to be coincident, hence the +=FSIZE_LIMIT in the directory case.
		 *
		 //
		
		// init/udpate mytar file offset //
		ith_roof +=  FNAME_LIMIT;

		// get filename //
		file_name = getField(fd_s, ith_roof, ith_floor) ;

		// 	update mytar file offset //
		ith_roof += FMODE_LIMIT;
		ith_floor += FNAME_LIMIT;

		// get mode //	
		fmode = getField(fd_s, ith_roof, ith_floor);
		file_mode = (mode_t) atol(fmode);

		fprintf(stdout,"file name: %s\n", file_name);		//#dbg#
		fprintf(stdout,"file mode: %d\n",file_mode);	//#dbg#


		// actions depending on the type of file //
		if ( (file_mode & S_IFMT) == S_IFDIR ) 
		{
			struct stat test_state;

			fprintf(stdout,"file type: DIRECTORY\n");  //#dbg#

			if( stat(file_name, &test_state) == -1 ) {
			
				if( mkdir(file_name, file_mode) == -1)
					perror("mkdir");
			}

			ith_floor += FMODE_LIMIT ;
		}
		else if ( (file_mode & S_IFMT) == S_IFREG) {
			int ith_fd;
			
			fprintf(stdout,"file type: REGULAR FILE\n"); //#dbg#
			char *fsize;
			long file_size;

			// 	update mytar file offset //
			ith_roof += FSIZE_LIMIT;
			ith_floor += FMODE_LIMIT;

			// get file size //
			fsize = getField(fd_s, ith_roof, ith_floor) ;
			file_size = (unsigned long) atol(fsize);

			fprintf(stdout,"file size: %ld\n",file_size);	//#dbg#

			ith_fd = open(file_name, CREATION_MODE , file_mode);
			if( ith_fd == -1) 
			{
				printf("arriba\n");
				perror("open");
			}
			else {

				fprintf(stdout,"file %s,created.\nAdding content...\n",file_name); //#dbg#
			
				fileWriter(fd_s, ith_fd, file_size); 

				// 	update mytar file offset //
				ith_roof += file_size;
				ith_floor += file_size+FSIZE_LIMIT;

				// close the ith file descriptor //
				close(ith_fd);
			}
		}
		printf("\n");
	}	
	*/
	/*close source file descriptor */
	close(fd_s);


	return 0; 
}



