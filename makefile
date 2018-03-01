all: build archive doc

build: exec

exec: collegemain.o  course.o college.o
	g++ collegemain.o  course.o college.o -o exec

main.o: collegemain.cc
	g++ -c collegemain.cc

game.o: course.cc
	g++ -c course.cc

college.cc : college.cc college.h course.h node.h tarray.h
	g++ -c college.cc

clean: 
	rm -rf *o exec archive1.tar
	rm -rf ./Documentation/latex
	rm -rf ./Documentation/html
	

archive: collegemain.cc college.cc course.cc college.h course.h node.h tarray.h makefile
	tar -cf archive.tar main.cc game.cc othello.cc game.h othello.h colors.h piece.h Makefile

doc: collegemain.cc college.cc course.cc college.h course.h node.h tarray.h makefile
	doxygen

	
