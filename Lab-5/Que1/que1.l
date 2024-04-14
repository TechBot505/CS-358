%{
#include "y.tab.h"
%}

%%
A+          { yylval.count = yyleng; return COUNT_A; }
B+          { yylval.count = yyleng; return COUNT_B; }
\n          { return EOL; }
.           { /* ignore other characters */ }

%%

int yywrap() {
    return 1;
}
