%{
#include <stdio.h>
#include <stdlib.h>
extern char *yytext;
int yylex();
void yyerror(const char *);
%}

%union {
    char *str;
}

%token <str> HELPING_VERB
%token <str> WORD
%token OTHER

%%

sentence: parts { printf("\n"); }
         ;

parts: parts part
     | part
     ;

part: WORD { printf("%s: is not a helping verb\n", $1); free($1); }
    | HELPING_VERB { printf("%s: is a helping verb\n", $1); free($1); }
    | OTHER
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "%s\n", s);
}

int main() {
    yyparse();
    return 0;
}
