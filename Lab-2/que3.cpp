#include<iostream>
#include<fstream>
using namespace std;

int main() {
   char filename[30], ch;
   int total=0, lines=0, spaces=0;
   ifstream fp;
   cout << "Enter the Name of File: ";
   cin >> filename;
   fp.open(filename, ifstream::in);
   if(!fp) {
      cout << endl << "File doesn't exist or Access denied!";
      return 0;
   }
   while(!fp.eof()) {
      ch = fp.get();
      if(ch == '\n') lines++;
      else if(ch == ' ') spaces++;
      else total++;
   }
   fp.close();
   cout << endl << "Total Characters = " << total << endl;
   cout << endl << "Total Lines = " << lines+1 << endl;
   cout << endl << "Total Spaces = " << spaces << endl;
   return 0;
}