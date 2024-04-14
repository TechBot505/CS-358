%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void yyerror(const char *s);

%}

%union {
    int num;
    char *id;
    struct {
        int operands;
        int operators;
    } expr_info;
}

%token <num> NUM
%token <id> ID
%token EOL

%type <expr_info> program expression term factor

%%

program: expression EOL {
    printf("Valid expression: Total operands = %d, operators = %d\n", $1.operands, $1.operators);
}
;

expression: expression '+' term {
    $$ = $1;
    $$ .operators++;
    $$ .operands += $3.operands;
}
| expression '-' term {
    $$ = $1;
    $$ .operators++;
    $$ .operands += $3.operands;
}
| term {
    $$ = $1;
}
;

term: term '*' factor {
    $$ = $1;
    $$ .operators++;
    $$ .operands += $3.operands;
}
| term '/' factor {
    $$ = $1;
    $$ .operators++;
    $$ .operands += $3.operands;
}
| factor {
    $$ = $1;
}
;

factor: NUM {
    $$ .operands = 1;
    $$ .operators = 0;
}
| ID {
    $$ .operands = 1;
    $$ .operators = 0;
}
| '(' expression ')' {
    $$ = $2;
}
;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    yyparse();
    return 0;
}
