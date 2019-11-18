
OPTS=-ansi -g -Wpedantic

root: main.o trie.o myFind.o
	gcc ${OPTS} -o root main.o trie.o myFind.o

main.o: main.c myFind.h trie.h
	gcc ${OPTS} -c main.c 

myFind.o: myFind.c myFind.h trie.h
	gcc ${OPTS} -c myFind.c

trie.o: trie.c trie.h
	gcc ${OPTS} -c trie.c	

clean:
	rm -rfv *.o root
