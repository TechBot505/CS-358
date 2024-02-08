#include <bits/stdc++.h>
using namespace std;

void checkIfComment(string input) {

	// Single line comment check
	if (input.size()>=2 && input[0] == '/' && input[1] == '/') {
		cout << "It is a single-line comment" << endl;
		return;
	}

    // Multiple line comment check
	if (input.size()>=4 && input[input.size() - 2] == '*' && input[input.size() - 1] == '/' && input[0] == '/' && input[1] == '*') {
		cout << "It is a multi-line comment" << endl;
		return;
	}

	cout << "It is not a comment";
}

int main() {

	string input;
    cout << "Enter a string: " << endl;
    cin >> input;
    
	checkIfComment(input);

	return 0;
}
