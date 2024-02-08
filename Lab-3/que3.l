%{
int comment_count = 0;
%}

%x COMMENT MULTI_LINE_COMMENT SINGLE_LINE_COMMENT

%%

"/*"    { comment_count++; BEGIN(MULTI_LINE_COMMENT); }
"//"    { comment_count++; BEGIN(SINGLE_LINE_COMMENT); }

<INITIAL><<EOF>>    { /* End of file */ }

<INITIAL>.|\n       { /* Ignore other characters in the main state */ }

<COMMENT>"*/"       { BEGIN(INITIAL); }
<COMMENT>[^*\n]+    { /* Ignore characters within a multi-line comment */ }
<COMMENT>"*"+[^*/\n] { /* Ignore characters within a multi-line comment */ }

<SINGLE_LINE_COMMENT>\n  { BEGIN(INITIAL); }
<SINGLE_LINE_COMMENT>.   { /* Ignore characters within a single-line comment */ }

%%

int main() {
    yylex();
    printf("Number of comments: %d\n", comment_count);
    return 0;
}
