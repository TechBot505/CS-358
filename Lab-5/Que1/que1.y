%{
#include <stdio.h>
int yylex();
void yyerror(const char *s);
%}

%union {
    int count;
}

%token <count> COUNT_A
%token <count> COUNT_B
%token EOL

%type <count> count_A_list
%type <count> count_B_list

%%

start: count_A_list count_B_list EOL {
    printf("String Accepted: %d A's followed by %d B's\n", $1, $2);
}
;

count_A_list: COUNT_A count_A_list {
    $$ = $1 + $2;
}
| /* empty */ {
    $$ = 0;
}
;

count_B_list: COUNT_B count_B_list {
    $$ = $1 + $2;
}
| /* empty */ {
    $$ = 0;
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



echo "AAAAABBCC" | ./a.out