%{
#include "y.tab.h"
%}

%%
[0-9]+         { return DIGIT; }
[\n]          { return 0; }
.             { }

%%

int yywrap() {
    return 1;
}