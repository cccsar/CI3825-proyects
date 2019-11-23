
OPTS=-ansi -g -Wpedantic

freecpalproc: main.o  myFind.o hasht.o singly.o list.o
	gcc ${OPTS} -o freecpalproc main.o myFind.o hasht.o singly.o list.o -lpthread

main.o: main.c myFind.h list.h
	gcc ${OPTS} -c main.c -lpthread 

myFind.o: myFind.c myFind.h hasht.h
	gcc ${OPTS} -c myFind.c

hasht.o: hasht.c hasht.h singly.h
	gcc ${OPTS} -c hasht.c

singly.o: singly.c singly.h
	gcc ${OPTS} -c singly.c

list.o: list.c list.h
	gcc ${OPTS} -c list.c

clean:
	rm -rfv *.o freecpalproc freecpal
