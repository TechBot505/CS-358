%{
#include "y.tab.h"
%}

%%
[A]          { return TokenA;}
[B]          {return TokenB; }
[\n]          { return 0; }
.           { return OTHER;}

%%

int yywrap() {
    return 1;
}