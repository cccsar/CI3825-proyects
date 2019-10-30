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

#include "parser.h"

#define STUFF_TOKEN ''
#define CREATION_MODE O_WRONLY | O_TRUNC | O_CREAT
#define max(X,Y) ((X > Y)? X: Y)
#define MAX_RW 1

/* struct f_att
 * ----------
 *  Estructura en la que se almacenan los atributos correspondientes
 *  a la metadata de un archivo. Estos se usan luego para crear al archivo.
 *
 */
typedef struct {
	mode_t mode; 
	uid_t uid; 
	gid_t gid; 
	long size;
	char* name; 
	char* link_ptr; 
} f_att; 

/* fileWriterBounded
 * ----------
 * Escribe de un archivo a otro utilizando los "file descriptors" de ambos.
 * Limita el contenido de escritura a un parametro entero.
 *
 *
 * 	fd_source: "file descriptor" del archivo del que se copia.
 * 	fd_dest: "file descriptor" del archivo al que se copia.
 * 	inst: Estructura que contiene la informacion de las opciones de mytar
 */
void fileWriterBounded(int fd_source, int fd_dest, int total, mytar_instructions inst) ; 


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
 *  	instructions: Estructura que contiene la informacion de las opciones de
 *  			  mytar.
 * 	
 * Retorna la posicion actual del apuntador
 */
int createFile(int fd, long offset, f_att prueba, mytar_instructions inst) ;


/* gatherFields
 * --------------
 *  Esta funcion junta los campos de cabecera (tanto numericos como no
 *  numericos) correspondientes a la metada de un archivo empaquetado
 *
 *
 *  	fd = "file descriptor" del .mytar
 *      instructions: Estructura que contiene la informacion de las opciones de
 *  	mytar.
 *
 *  retorna: el offset actual del archivo, o -1 en caso de error.
 */
int gatherFields(int fd, mytar_instructions inst) ;


/* extractMyTar
 * --------------
 * Recibe un archivo .mytar y se encarga de extraer su contenido.
 *
 * 	mt_name: Nombre del archivo .mytar a procesar	
 *  	instructions: Estructura que contiene la informacion de las opciones de
 *  			  mytar.
 */
int extractMyTar(char** mt_name, mytar_instructions inst);

#endif




