#!/bin/bash

#Testing retrieval of paths 

if [ "$1" = "easy" ] ; then
	easy;
elif [ "$1" = "medium" ] ; then
	medium; 
elif [ "$1" = "hard" ] ; then
	hard $2 ;
elif [ "$1" = "links" ] ; then
	links ;
fi

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
		if [ $(( "$i"%2 )) -eq 0 ] ; then 
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
