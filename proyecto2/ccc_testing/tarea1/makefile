OPTS = -ansi -Wpedantic

all: freecpal

freecpal: main.o list.o 
	@echo "linking... "
	gcc ${OPTS} -o freecpal main.o list.o -pthread

%.o: %.c
	@echo "compiling... "
	gcc ${OPTS} -I. -c $< -pthread

clean: 
	@echo ${OPTS} "removing object and linked files"
	rm -rvf *.o freecpal
