%{
#include <stdio.h>
#include <stdlib.h>

extern int yylex();
void yyerror(char* m)
{
	fprintf(stderr,"%s\n",m);
	exit(EXIT_FAILURE);
}
%}

%union
{
	int        int_val;
	float      float_val;
	char*      id_val;
}
%token                          IntegerID
%token                          FloatID
%token      <int_val>           IntegerValue
%token      <float_val>         FloatValue
%token      <id_val>            ID 
%type       <float_val>         Expression

%%
Application         :       Application Command ';'
                    |
                    ;
Command             :       Expression '+' Expression       { printf("%f\n", $1 + $3); }
                    |       Expression '-' Expression       { printf("%f\n", $1 + $3); }
                    |       Expression '*' Expression       { printf("%f\n", $1 + $3); }
                    ;
Expression          :       IntegerValue                    { $$ = $1; }
                    |       FloatValue                      { $$ = $1; }
                    ;
%%

int main()
{
	return yyparse();
}
