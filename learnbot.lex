%{
#include <stdlib.h>
#include <learnbot.tab.h>
%}
EQ       =
STMTEND  ;
DIGIT    [0-9]
NUMBER   {DIGIT}+
VAR      a{NUMBER}
PROP     bot.[:alpha:]+
IF       if
LOOP     loop
THEN     then
ENDLOOP  endloop
RIGHT    right
LEFT     left
TURN     turn
FI       fi
PUNCT    [:ispunct:]
ADVANCE  advance
EQCHK    "=="
%%

[\t\n ]   {;}
{NUMBER}    {yylval.num = atoi(yytext); return NUMBER;}
{VAR}       {yylval.num = atoi(yytext + 1); return VARIABLE;}
{PROP}      {yylval.str = strdup(yytext + 4); return PROPERTY;}
{IF}        {return IF;}
{FI}        {return FI;}
{LOOP}      {return LOOP;}
{ENDLOOP}   {return ENDLOOP;}
THEN      {return THEN;}
TURN      {return TURN;}
{STMTEND}     {return STMTEND;}
{EQ}          {return EQ;}
[+]             {return PLUS;}
[-]            {return MINUS;}
[*]            {return INTO;}
END           {return END;}
{ADVANCE}     {return ADVANCE;}
[<]           {return LT;}
[>]           {return GT;}
or            {return OR;}
and           {return AND;}
{EQCHK}     {return EQC;}
%%









