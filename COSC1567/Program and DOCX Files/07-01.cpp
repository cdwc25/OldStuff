#include <iostream>// i/o streams library cin,cout, cerr, and clog,   to include the header file “conio” .
#include <conio.h>
using namespace std;//using is a directive
//In modern C++, all of the functionality in the C++ standard library is now defined inside namespace std
//Namespaces are used in many areas of computing, such as domain names, file paths, and XML documents
/*Namespace is a feature added in C++ and not present in C. A namespace is a declarative region that provides a scope 
to the identifiers (names of the types, function, variables etc) inside it. Multiple namespace blocks with the same name are allowed. 
All declarations within those blocks are declared in the named scope.*/

//#include <conio.h>


int main( )
{
    int numberOfLanguages;

    cout << "Hello reader.\n" 
         << "Welcome to C++.\n";

    cout << "How many programming languages have you used? ";
    cin >> numberOfLanguages;

    if (numberOfLanguages < 1) 
        cout << "Read the preface. You may prefer\n"
             << "a more elementary book by the same author.\n";
    else
        cout << "Enjoy the book.\n";
	_getch();// needs conio.h
	//system ("pause");
	//cin.get();//needs std namespace
    return 0;
}