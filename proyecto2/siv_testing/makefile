OPTS=-ansi -g -Wpedantic -pthread

freecpalhilo: main.o list.o
	gcc ${OPTS} -o freecpalhilo main.o list.o

main.o: main.c list.h
	gcc ${OPTS} -c main.c 

list.o: list.c list.h
	gcc ${OPTS} -c list.c

clean:
	rm -rfv *.o freecpalhilo