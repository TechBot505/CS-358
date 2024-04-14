%{
#include <stdio.h>
#include <string.h>
#include "y.tab.h"
%}

%%
am|is|are|was|were|being|been|be|have|has|had|do|does|did|will|would|shall|should|may|might|must|can|could { yylval.str = strdup(yytext); return HELPING_VERB; }
[a-zA-Z]+ { yylval.str = strdup(yytext); return WORD; }
. { return OTHER; }
%%

int yywrap() {
    return 1;
}
