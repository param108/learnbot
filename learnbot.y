%{
#define YYPRINT(file, type, value)   yyprint (file, type, value)
%}

%union {
  int num;
  char* str;
};
%token   NUMBER 0
%token   VARIABLE 1
%token   PROPERTY 2
%token   IF 3
%token   FI 4
%token   LOOP 5
%token   ENDLOOP 6
%token   THEN 7
%token   TURN 8
%token   STMTEND 9
%token   EQ 10
%token   END 11
%token   PLUS 12
%token   MINUS 13
%token   INTO 14
%token   ADVANCE 15
%token   LT 16
%token   GT 17
%token   OR 18
%token   AND 19
%token   EQC 20
%{
  #define YYDEBUG 1
  #include "bot.h"
  #include "hashmap.h"
  
  void yyerror (char *s)
  {
    fprintf (stderr, "%s\n", s);
  }

  int yywrap()
  {
    return 1;
  }
  static void yyprint (FILE* file, int type, YYSTYPE value)
  {
    if (type == NUMBER) 
      printf ("NUMBER %d\n", value.num);
    else if (type == VARIABLE)
      printf ("VARIABLE %d\n", value.num);
    else if (type == PROPERTY)
      printf ("PROPERTY %s\n", value.str);
  }
%}

%type<num> var NUMBER VARIABLE expr
%type<str> PROPERTY

%%
expr: VARIABLE EQ var STMTEND { printf("setting %d\n",rt_setVarVal($1,$3));$$ = $3;} |
expr expr {;} |
expr END {printf("End Of FIle reached\n");}

var: NUMBER {/*printf("Got Number %d\n",$1);*/$$ = $1;} | 
VARIABLE {/*printf("Got Var %d = %d\n",$1,rt_getVarVal($1));*/
  $$ = rt_getVarVal($1);} |
var PLUS var {$$ = $1 + $3;}|
var MINUS var {$$ = $1 - $3;}|
var INTO var {$$ = $1 * $3;}
%%

int varmap[100];                         
void main() {
  //yydebug = 1;
  yyparse();
}		       

