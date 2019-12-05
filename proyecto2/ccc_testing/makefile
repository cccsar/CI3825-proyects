
OPTS=-ansi -g -Wall -Wpedantic

freecpalproc: main.o  myFind.o hasht.o singly.o list.o
	gcc ${OPTS} -o freecpalproc main.o myFind.o hasht.o singly.o list.o -pthread

main.o: main.c myFind.h list.h
	gcc ${OPTS} -c main.c -pthread 

myFind.o: myFind.c myFind.h hasht.h
	gcc ${OPTS} -c myFind.c -pthread

hasht.o: hasht.c hasht.h singly.h
	gcc ${OPTS} -c hasht.c

singly.o: singly.c singly.h
	gcc ${OPTS} -c singly.c

list.o: list.c list.h
	gcc ${OPTS} -c list.c

clean:
	rm -rfv *.o freecpalproc freecpal
