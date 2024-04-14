%{
#include <stdio.h>
void yyerror(const char *s);
%}


%token NUMBER

%%

input: /* empty */
     | input line
     ;

line: '\n'
    | expr '\n' { printf("%d\n", $1); }
    ;

expr: expr '+' expr { $$ = $1 + $3; }
    | expr '-' expr { $$ = $1 - $3; }
    | expr '*' expr { $$ = $1 * $3; }
    | expr '/' expr { 
        if ($3 == 0) {
            yyerror("Division by zero");
            $$ = 0;
        } else {
            $$ = $1 / $3;
        }
    }
    | '(' expr ')' { $$ = $2; }
    | NUMBER { $$ = $1; }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "%s\n", s);
}

int main() {
    yyparse();
    return 0;
}
