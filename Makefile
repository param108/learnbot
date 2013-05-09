learnbot:	learnbot.tab.h learnbot.tab.c bot.h lex.yy.c
		gcc -o learnbot learnbot.tab.c lex.yy.c

learnbot.tab.h learnbot.tab.c:	learnbot.y bot.h
		bison -tdv learnbot.y
lex.yy.c:	learnbot.lex learnbot.tab.h
		flex learnbot.lex

all: learnbot

clean:
	rm learnbot.tab.*;
	rm lex.yy.c;
