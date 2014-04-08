CC=g++
FLAGS=-Wall -c
LIBS=-lncurses
SDIR=./
DESTDIR=/usr/local/bin/

trilobite: trilobite.o diskItem.o file.o directory.o
	$(CC) $(LIBS) trilobite.o diskItem.o file.o directory.o -o trilobite

trilobite.o: $(SDIR)trilobite.cpp
	$(CC) $(FLAGS) trilobite.cpp 

diskItem.o: $(SDIR)diskItem.h $(SDIR)diskItem.cpp
	$(CC) $(FLAGS) diskItem.cpp

file.o: $(SDIR)file.h $(SDIR)file.cpp 
	$(CC) $(FLAGS) file.cpp

directory.o: $(SDIR)directory.h $(SDIR)directory.cpp
	$(CC) $(FLAGS) directory.cpp

.PHONY: install clean
install:
	install -m 0755 trilobite $(DESTDIR)

clean:
	rm *.o
