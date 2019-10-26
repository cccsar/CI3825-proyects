# Autor: Carlos Sivira 15-11377
# Numero de grupo: 18

OPTS=-ansi -g -Wpedantic

mytar: main.o parser.o
	gcc $(OPTS) -o mytar main.o parser.o

main.o: main.c parser.h
	gcc $(OPTS) -c main.c

encryption.o: parser.c parser.h
	gcc $(OPTS) -c parser.c

clean:
	rm -f *.o frecpal
