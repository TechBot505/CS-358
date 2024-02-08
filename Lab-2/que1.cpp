#include <bits/stdc++.h>
using namespace std;

int main() {
    string s;
    int c = 0, flag=0;
    cout << "Enter any string: ";
    cin >> s;
    if ((s[0] >= 'a' && s[0] <= 'z') || (s[0] >= 'A' && s[0] <= 'Z') || (s[0] == '_')) {
        for (int i = 1; i <= s.length(); i++) {

            if ((s[i] >= 'a' && s[i] <= 'z') || (s[i] >= 'A' && s[i] <= 'Z') || (s[i] >= '0' && s[i] <= '9') || (s[i] == '_')) {
                c++;
            }
        }
    }
    if (c == s.length()-1) {
        flag = 0;
    }
    else {
        flag = 1;
    }
    if (flag == 1) {
        cout << s << " is not a valid Identifier" << endl;
    } else {
        cout << s << " is a valid Identifier" << endl;
    } 
    return 0;
}