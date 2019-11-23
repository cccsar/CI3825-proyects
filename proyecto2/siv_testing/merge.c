/*
 * Archivo: merge.c/.merge.h
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
#include "merge.h"

/*  Funcion: Merge
 *  --------------
 *	Convina de forma ordenada la lista list_a con las lista list_a.
 *
 *	list_a: Lista de palabras con orden alfanumerico y por frecuencia.
 *  list_b: Lista de todas las palabras con orden alfanumerico y por frecuencia.
 * 
 *  return: lista con el contenido de list_a y list_b de forma ordenada,
 */
list* Merge(list *list_a, list *list_b)
{
    /*Definicion de variables*/
    int size_list_a, size_list_b;
    node *node_a, *node_b;
    list *new_list;

    /*Inicializacion de variables*/
    size_list_a = list_a->size;
    size_list_b = list_b->size;

    /*La memoria reservada para la lista es liberada en el programa principal*/
    new_list = (list*)malloc(sizeof(list));
    node_a = (node*)malloc(sizeof(node));
    node_b = (node*)malloc(sizeof(node));

    /*Se ubica cada nodo al inicio de la lista*/
    node_a = list_a->head;
    node_b = list_b->head;

    while(size_list_a > 0 && size_list_b > 0)
    {
        /*Inserta el nodo con mayor frecuencia y orden alfanumerico*/
        if(node_a->frequency > node_b->frequency)
        {
            listInsert(new_list, node_a);
            size_list_a--;
        }
        else if(node_a->frequency < node_b->frequency)
        {
            listInsert(new_list, node_b);
            size_list_b--;
        }
        else
        {
           if (strcmp(node_a->word,node_b->word) >= 0)
            {
                listInsert(new_list, node_a);
                size_list_a--;
            }
            else
            {
                listInsert(new_list, node_b);
                size_list_b--;
            }
        }
    }

    /*Completa la copia del sobrante de alguna de las listas*/
    if (size_list_a > 0)
    {
        while(size_list_a > 0)
        {
            listInsert(new_list, node_a);  
            size_list_a--;
        }
    }

    if (size_list_b > 0)
    {
        while(size_list_b > 0)
        {
            listInsert(new_list, node_b);  
            size_list_b--;
        }
    }

    /*Se libera la memoria reservada para los nodos*/
    free(node_a);
    free(node_b);

    /*Devuelve la nueva lista mezclada con list_a y list_b ordenada*/
    return new_list;
}