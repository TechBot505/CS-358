%{
#include "y.tab.h"
%}

%%
^[0-9]*        { return DIGIT;}
[\n]          { return 0; }
^[^0-9]|[0-9]*[a-zA-Z]          { }

%%

int yywrap() {
    return 1;
}