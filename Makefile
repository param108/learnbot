learnbot:	learnbot.tab.h learnbot.tab.c bot.h lex.yy.c hashmap.o strhash.o
		gcc -o learnbot learnbot.tab.c lex.yy.c

learnbot.tab.h learnbot.tab.c:	learnbot.y bot.h
		bison -tdv learnbot.y
lex.yy.c:	learnbot.lex learnbot.tab.h
		flex learnbot.lex
hashmap.o:	hashmap.h hashmap.c
		gcc -c hashmap.c
strhash.o:	strhash.h strhash.c
		gcc -c strhash.c
all: learnbot

clean:
	- rm learnbot.tab.*;
	- rm lex.yy.c;
	- rm *~;
	- rm *.o
