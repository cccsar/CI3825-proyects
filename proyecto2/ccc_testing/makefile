
OPTS=-ansi -g -Wpedantic

root: main.o  myFind.o hasht.o singly.o
	gcc ${OPTS} -o root main.o myFind.o hasht.o singly.o

main.o: main.c myFind.h 
	gcc ${OPTS} -c main.c 

myFind.o: myFind.c myFind.h hasht.h
	gcc ${OPTS} -c myFind.c

hasht.o: hasht.c hasht.h singly.h
	gcc ${OPTS} -c hasht.c

singly.o: singly.c singly.h
	gcc ${OPTS} -c singly.c

clean:
	rm -rfv *.o root 
