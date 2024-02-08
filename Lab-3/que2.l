%{
int wordCount = 0;
%}

%%
[a-zA-Z0-9]+    { wordCount++; }
.               { /* Ignore other characters */ }
%%

int main() {
    yylex();
    printf("Number of words: %d\n", wordCount);
    return 0;
}
