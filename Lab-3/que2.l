%{ 
#include<stdio.h> 
#include<string.h> 
int count = 0; 
%} 

%% 
[a-zA-Z0-9] {count++;}
<<EOF>> {printf("Total words: %d\n", count); count = 0;return 0;}
%% 

int main() 
{ 
	FILE *file = fopen("input2.txt", "r"); // Change "input.txt" to your desired file path
    if (!file) {
        perror("Error opening file");
        return 1;
    }
    
    yyin = file;
	yylex(); 
	
	return 0; 
} 