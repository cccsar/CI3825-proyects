#!/bin/bash

#Testing retrieval of paths 


function easy() {
	mkdir easy; 
	cd easy; 
	touch {1..100}.txt; 
	touch {101..200}.tx;
	cd ../;
}

function medium() {
	mkdir medium; 
	cd medium;
	touch {1..100}.txt; 
	touch {1..100}.tx; 
	mkdir 1; 
	cd 1;
	touch {101..200}.txt;
	touch {300..400}.tx; 
	cd ../../;
}

function hard() { 
	mkdir hard; 
	cd hard; 
	for i in {1..$1}; do 
		if [ $(( $i%2 )) -eq 0 ] ; then 
			touch {1..$(($i*5))}.txt; 
		else  
			touch {1..$i}.txt;
		fi
		mkdir $i; 
		cd $i;
	done
	
	for i in {1..$i};  do
		cd ../; 
	done
}

function links() {
	mkdir links; 
	cd links; 
	touch 1.txt; 
	for i in {2..20}; do 
		ln 1.txt $i; 
	done
}

function generateTrash() { 
	trash_size=`echo $(($RANDOM%691))`; 
	
	for i in {1.."$trash_size"}; do 
		touch "$i"; 
	done
}

DICT="/usr/share/dict/cracklib-small";

function fumado() {

	mkdir fumado; 
	cd fumado ; 

	for i in {1..10} ; do 
		tail -n ` echo $(( $i * 2))` $DICT > proof"$i".txt;
	done

	cd ../
}

function maldito() { 
	
	mkdir megaMaldito; 
	cd megaMaldito;
	for i in {1..419} ; do 
		if [ `echo $(( $i % 2 )) ` -eq 0 ] ; then
			tail -n `echo $(( $i * 10 )) ` $DICT > proof"$i".txt; 
		else  
			head -n `echo $(( $i * 10 )) ` $DICT > proof"$i".txt 
		fi;
	done
	cd ../;
}

if [ "$1" = "easy" ] ; then
	easy;
elif [ "$1" = "medium" ] ; then
	medium; 
elif [ "$1" = "hard" ] ; then
	hard $2 ;
elif [ "$1" = "links" ] ; then
	links ;
elif [ "$1" = "xiao" ] ; then
	xiao;
elif [ "$1" = "maldito" ] ; then
	maldito; 
elif [ "$1" = "fumado" ] ; then
	fumado; 
elif [ "$1" = "prueba" ] ; then
	generateTrash; 
fi
