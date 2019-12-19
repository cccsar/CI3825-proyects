OPTS = -ansi -Wpedantic

all: freecpal

freecpal: main.o list.o 
	@echo "linking... "
	gcc ${OPTS} -o freecpal main.o list.o

%.o: %.c
	@echo "compiling... "
	gcc ${OPTS} -I. -c $< 

clean: 
	@echo ${OPTS} "removing object and linked files"
	rm -rvf *.o freecpal
