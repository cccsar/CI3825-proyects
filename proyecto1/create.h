/* 
 * Archivo: create.h 
 *
 * descripcion: Archivo de cabecera con las firmas de funciones usadas para
 * crear un archivo .mytar
 *
 * Autores:
 *	Carlos Alejandro Sivira Munoz 		15-11377
 * 	Cesar Alfonso Rosario Escobar		15-11295
 */

#ifndef __CREATE__
#define __CRATE__

/* setHeadFields
 * ----------
 * Asigna los campos de cabecera del archivo .mytar utilizando los atributos
 * de los archivos que se recibieron para empaquetar.
 *
 * Estos son:
 *  	modo # uid # gid [ # size] # name_size # name [# link_pointer] #
 *
 *
 * 	fd_dest: "file descriptor" del archivo .mytar
 * 	state: Estado del archivo actual.
 * 	name: Nombre del archivo a empaquetar.
 */
void setHeadFields(int fd_dest, struct stat state, char *name) ;


/* fileWriter
 * ----------
 * Escribe de un archivo a otro utilizando sus "file descriptors"
 *
 *
 * 	fd_source: "file descriptor" del archivo del que se lee
 * 	fd_dest: "file descriptor" del archivo al que se escribe
 */
void fileWriter(int fd_source, int fd_dest) ; 



/* handleFileType
 * --------------
 *  Esta funcion recibe un 'struct stat' que le permite determinar el tipo 
 *  de archivo, y asignar campos de cabecera de .mytar en funcion de ello.
 *
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
DIR *handleFileType(int fd_dest, char* pathname, struct stat current_st) ;


/* traverseDir
 * ----------
 * Esta funcion recorre un arbol de directorios anadiendo campos de cabecera al archivo
 * .mytar que se esta procesando, junto con el contenido de los archivos procesados.
 *
 * Consigue esto procesando los atributos de cada uno de los archivos encontrados
 * como entrada de directorio, y anadiendolos ar archivo .mytar
 *
 *
 * 	dir: apuntador al directorio que se esta recorriendo
 * 	dirname: nombre del directorio que se esta recorriendo
 * 	fd: file descriptor del archivo .mytar que se esta creando
 */
void traverseDir(DIR *dir, char *dirname, int fd) ; 


/* createMyTar
 * --------------
 * Se utiliza para crear el archivo .mytar. Funciona procesando cada
 * archivo recibido en la linea de comandos para obtener atributos que usar
 * como campos de cabecera para el archivo .mytar.
 *
 * Procesa cada argumento recibido, primero verificando que exite y luego:
 * 	Si es un directorio:
 * 		lo abre, lo recorre (asignando los respectivos campos) y lo cierra.
 * 	En caso contrario:
 * 		asigna los campos de cabecera y el contenido del archivo recibido.
 *	
 *	files: Archivos a procesar
 *	n_files: Numero de archivos a procesar
 */
int createMyTar(int n_files, char**files);

#endif

