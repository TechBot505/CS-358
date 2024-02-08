#include <string.h>
#include <iostream>
using namespace std;

int isKeyword(char[] &temp) {
    char key[32][10] = {"auto", "break", "case", "char", "const", "continue", "default", "do", "double", "else", "enum", "extern", "float", "for", "goto", "if", "int", "long", "register", "return", "short", "signed", "sizeof", "static", "struct", "switch", "typedef", "union", "unsigned", "void", "volatile", "while"};
    int i=0;
    int flag=0;

    for (i = 0; i < 32; i++) {
        // if two strings matches strcmp returns 0
        if (strcmp(temp, key[i]) == 0)
            flag = 1;
    }
}

int main() {
    int i, n, flag = 0;
    char key[32][10] = {"auto", "break", "case", "char", "const", "continue", "default", "do", "double", "else", "enum", "extern", "float", "for", "goto", "if", "int", "long", "register", "return", "short", "signed", "sizeof", "static", "struct", "switch", "typedef", "union", "unsigned", "void", "volatile", "while"};
    
    char str[100];

    // taking input from user
    cout << "Enter string: " << endl;
    cin >> str;

    while(str[i] != '\n') {
        
    }

    for (i = 0; i < 32; i++) {
        // if two strings matches strcmp returns 0
        if (strcmp(str, key[i]) == 0)
            flag = 1;
    }

    // if flag=1 then it is a keyword else it is not a keyword
    if (flag)
        cout << str << " is a Keyword";
    else
        cout << str << " is not a Keyword";
    return 0;
}