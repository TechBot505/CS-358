%{
#include "y.tab.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
%}

%%
[ \t]            /* Ignore whitespace */
[0-9]+           { yylval.num = atoi(yytext); return NUM; }
[a-zA-Z]+        { yylval.id = strdup(yytext); return ID; }
[+\-*/=]         { return *yytext; }
\n               { return EOL; }
.                { yyerror("Invalid character"); }

%%

int yywrap() {
    return 1;
}
