# Autor: Carlos Sivira 15-11377
# Numero de grupo: 18

OPTS=-ansi -g -Wpedantic

mytar: main.o create.o extract.o parser.o encryption.o
	gcc $(OPTS) -o mytar main.o create.o extract.o parser.o encryption.o

main.o: main.c parser.h encryption.h
	gcc $(OPTS) -c main.c

create.o: create.c create.h
	gcc $(OPTS) -c create.c
	
extract.o: extract.c extract.h
	gcc $(OPTS) -c extract.c

parser.o: parser.c parser.h
	gcc $(OPTS) -c parser.c

encryption.o: encryption.c encryption.h
	gcc $(OPTS) -c encryption.c

clean:
	rm -rfv *.o mytar
