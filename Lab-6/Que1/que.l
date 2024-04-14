%{
#include "y.tab.h"
int yyerror(const char *s);
%}


%%

[0-9]+      { yylval = atoi(yytext); return NUMBER; }
[-+*/\n]    { return *yytext; }
[ \t]       ;
.           { yyerror("Invalid character"); }

%%

int yywrap() {
    return 1;
}
