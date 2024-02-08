%{
#include <stdio.h>
%}

%%
[a-zA-Z]    {
                int shift = 2 + (yytext[0] - 'a');
                if (shift > 25) {
                    shift = shift % 26;
                }
                char replacedChar = 'a' + shift - 1;
                printf("%c", replacedChar);
            }
.           printf("%s", yytext);
%%

int main() {
    yylex();
    printf("\n");
    return 0;
}
