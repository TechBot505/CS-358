%{
#include <stdio.h>
int yylex();
void yyerror(const char *s);
%}

%token NUMBER
%left '+'  '-'
%left '*'  '/'
%right UMINUS
%right '^'

%%
lines: E '\n' { printf("\n");}
	 |
	 ;
E :E'+'E { printf(" + ");}
  |E'-'E { printf(" - ");}
  |E'*'E { printf(" * ");}
  |E'/'E { printf(" / ");}
  |'('E')' 
  |NUMBER { printf("%g ",yylval);}
  ;
%%

void yyerror(const char *s) {
 fprintf(stderr, "%s\n", s);
}

int main(void) {
 printf("Enter the infix : ");
 yyparse();
 return 0;
} 