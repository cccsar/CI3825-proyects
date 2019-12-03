#include <stdio.h> 
#include <stdlib.h>
#include <sys/types.h> 
#include <sys/stat.h> 
#include <sys/wait.h>
#include <fcntl.h>  
#include <dirent.h> 
#include <string.h> 
#include <unistd.h>
#include <string.h>
#include "hasht.h"

#define TRUE 1
#define FALSE 0
/*constant for debugging*/
#define CONSTANT 20



/*hashtInit
 * --------------
 *
 *
 */
void hashtInit(hasht h_){
	/*every cell has a list with an address*/
	int i_; 

	for(i_=0; i_<HASH_SIZE; i_++)  
		h_[i_] = (singly *) NULL; 		
}


/*hashDestroy
 * --------------
 *
 *
 */
void hashtDestroy(hasht h_) {
	int i_;

	for(i_=0; i_<HASH_SIZE ; i_++) {
		if (h_[i_] != NULL) 
			singlyDestroy(h_[i_]);	
	}	
}


/*hashtInsert
 * --------------
 *
 *
 */
int hashtInsert(hasht h_, int number){
	/*implement hash function and mix it wih list insertion*/
	int index; 
	snode *dummie; 

	index = number % HASH_SIZE; 	


	if (h_[index] != NULL ) { 

		/*printf("list h_[%d] :\tsize: %d | number: %d\n",index, h_[index]->size, number); */

		if ( singlySearch(h_[index], number)  ){ 
			/*la tabla no acepta elementos repetidos*/
			return FALSE; 
		}

	}
	else {
		/*printf("new list h_[%d] :\tnumber: %d \n",index, number); */

		h_[index] = (singly *) malloc( sizeof(singly) );

		singlyInit( h_[index] );

	}


	dummie = (snode *) malloc( sizeof(snode) );
	snodeInit(dummie, number);

	singlyInsert( h_[index], dummie);  

	return TRUE;
}


/*hashtPrint
 * --------------
 *
 *
 */
void hashtPrint(hasht t_) {
	int i_;
	for(i_=0; i_<HASH_SIZE/2; i_++)   {
		if (t_[i_] != NULL ) 
		singlyPrint(t_[i_]); 
	}
}


/*  hashtTesting 
 * --------------
 *
 *
 */
int hashtTesting () { 

	hasht table; 
	int i_;
	
	hashtInit(table); 

	for(i_=0; i_<CONSTANT ; i_++) {
		hashtInsert(table, i_); 
	}	

	hashtPrint(table);

	hashtDestroy(table);

	return 0; 
}

