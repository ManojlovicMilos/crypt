#include<stdlib.h>

int main()
{
    system("yacc -d crypt.y");
    system("lex crypt.l");
    return system("gcc y.tab.c lex.yy.c -o crypt");
}
