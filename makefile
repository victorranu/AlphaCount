# Victor Ranu
# victorranu@gmail.com


#ps aux | grep `whoami` | grep -v root

CC=gcc
DEBUG=-g
CFLAGS=$(DEBUG) -Wall -Wshadow -Wunreachable-code -Wredundant-decls -Wmissing-declarations -Wold-style-definition -Wmissing-prototypes -Wdeclaration-after-statement -std=c99
PROGS= uniqify

all: $(PROGS)

uniqify: uniqify.o
	$(CC) $(CFLAGS) -o uniqify uniqify.o
uniqify.o: uniqify.c
	$(CC) $(CFLAGS) -c uniqify.c

test: uniqify
	rm -f myout.* yourout.* out.*
	./uniquify.bash < websters.txt > yourout.web
	uniqify -n 5 < websters.txt > myout.web
	diff myout.web yourout.web

testwords: uniqify
	rm -f myout.* yourout.* out.*
	./uniquify.bash < words.txt > yourout.words
	uniqify -n 5 < words.txt > myout.words
	diff myout.words yourout.words

testsimple: uniqify
	rm -f myout.* yourout.* out.*
	./uniquify.bash < simple.txt > yourout.simple
	uniqify -n 5 < simple.txt > myout.simple
	diff myout.simple yourout.simple

testiliad: uniqify
	rm -f myout.* yourout.* out.*
	./uniquify.bash < iliad.txt > yourout.iliad
	uniqify -n 5 < iliad.txt > myout.iliad 
	diff yourout.iliad myout.iliad

testdec: uniqify
	rm -f myout.* yourout.* out.*
	./uniquify.bash < decl-indep.txt > yourout.dec
	uniqify -n 5 < decl-indep.txt > myout.dec
	diff myout.dec yourout.dec
clean:
	rm -f $(PROGS) *.o *~ out.* myout.* yourout.*
