OPTS= -ansi -Wpedantic

all: mytar

mytar: main.o create.o extract.o
	@echo "linking ..."
	gcc ${OPTS} -o mytar main.o create.o extract.o

%.o: %.c
	@echo "compiling..."
	gcc ${OPTS} -I. -c $<

clean:
	@echo "removing object and linked files..."
	rm -rfv *.o mytar
