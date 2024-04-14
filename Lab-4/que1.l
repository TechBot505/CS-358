%{
#include <stdio.h>
int temp = 2;
%}

%%
[a-zA-Z]    {
                int shift = temp + (yytext[0] - 'a');
                if (shift > 25) {
                    shift = shift % 26;
                }
                char replacedChar = 'a' + shift - 1;
                temp++;
                printf("%c", replacedChar);
            }
.           printf("%s", yytext);
%%

int main() {
    yylex();
    printf("\n");
    return 0;
}
