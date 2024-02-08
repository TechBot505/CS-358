%{
int pos_int = 0;
int neg_int = 0;
int pos_frac = 0;
int neg_frac = 0;
%}

%%
[-][0-9]+   { neg_int++; }
\+?[0-9]+   { pos_int++; }
\+?[0-9]+[/|.][0-9]+   { pos_frac++; }
[-][0-9]+[/|.][0-9]+   { neg_frac++; }
%%

int main() {
    yylex();
    printf("Positive Integers: %d\n", pos_int);
    printf("Negative Integers: %d\n", neg_int);
    printf("Positive Fractions: %d\n", pos_frac);
    printf("Negative Fractions: %d\n", neg_frac);
    return 0;
}
