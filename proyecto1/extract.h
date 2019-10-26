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

#ifndef __EXTRACT__
#define __EXTRACT__

/* fileWriterBounded
 * ----------
 * Escribe de un archivo a otro utilizando los "file descriptors" de ambos.
 * Limita el contenido de escritura a un parametro entero.
 *
 *
 * 	fd_source: "file descriptor" del archivo del que se copia.
 * 	fd_dest: "file descriptor" del archivo al que se copia.
 */
void fileWriterBounded(int fd_source, int fd_dest, int total) ; 


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
char *getField(int fd, int field_length) ;


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
int getFieldSize(int fd) ; 


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
long putField(int fd) ;


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
void setModeAndOwn(char* name, mode_t mode, uid_t uid, gid_t gid) ;


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
int createFile(int fd, int offset, char *name, mode_t mode, long size, uid_t uid, gid_t gid, char* link_name) ;


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
int gatherFields(int fd) ;


/* extractMyTar
 * --------------
 * Recibe un archivo .mytar y se encarga de extraer su contenido.
 *
 * 	mt_name: Nombre del archivo .mytar a procesar	
 */
int extractMyTar(char** mt_name);

#endif
