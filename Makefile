MDIR=${shell util/dirname.sh}
CFLAGS=-I ${MDIR} -I ${MDIR}/build

bin/learnbot:	bin build build/learnbot.tab.h build/learnbot.tab.c bot.h build/lex.yy.c build/hashmap.o build/strhash.o
		gcc ${CFLAGS} -o bin/learnbot build/learnbot.tab.c build/lex.yy.c

build/learnbot.tab.h build/learnbot.tab.c:	build learnbot.y bot.h
		bison -tdv -o build/learnbot.tab.c learnbot.y
build/lex.yy.c:	build learnbot.lex build/learnbot.tab.h
		flex -o build/lex.yy.c learnbot.lex 
build/hashmap.o:	build hashmap.h hashmap.c
		gcc ${CFLAGS} -c hashmap.c -o build/strhash.o
build/strhash.o:	build strhash.h strhash.c
		gcc ${CFLAGS} -c strhash.c -o build/strhash.o
all: bin/learnbot

build:		
		- rm -rf build
		- mkdir build

bin:
		- rm -rf bin
		- mkdir bin

clean:
	- rm -rf build
	- rm *~;
