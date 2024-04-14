%{
#include <stdio.h>
int yylex();
void yyerror(const char *s);
int flag=0;
%}

%union {
    int count;
}

%token <count> EMAIL
%token END

%start Patt

%%

Patt: EMAIL {};
 
%%

void yyerror(const char *s) {
   fprintf(stderr, "Invalid Email ID");
   flag = 1;
}

int main() {
   yyparse();
   if(!flag)
   {
      printf("Valid Email ID");
   }
   return 0;
}