%option noyywrap
%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
%}

%%
int                         { return IntegerID; }
float                       { return FloatID; }
[0-9]+                      { yylval.int_val = atoi(yytext); return IntegerValue; }
[0-9]+(\.[0-9]*)?           { yylval.float_val = atof(yytext); return FloatValue; }
[a-zA-Z]+                   { yylval.id_val = strdup(yytext); return ID; }
[;="+*/()\[\]'-]            return *yytext;  /*  " */
[ \t\n\r]                   {  }
.                           { printf("Lexical Error: Unknown Character!\n"); }
%%

/*int yywrap(void)
{
    return 1;
}*/
