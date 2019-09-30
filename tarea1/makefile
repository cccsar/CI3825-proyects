

proy: main.o list.o 
	@echo "linking... "
	gcc -o proy main.o list.o

%.o: %.c
	@echo "compiling... "
	gcc -I. -c $< 

clean: 
	@echo "removing object and linked files"
	rm -rvf *.o proy
