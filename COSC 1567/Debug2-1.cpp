//Connor Cerisano, c0630428, 2-1, 1/17/2020

// DEBUG2-1
// Perform arithmetic with values

//iostream.h does not exist, use iostream instead
#include <iostream>
#include <conio.h>

using namespace std; //Need to include a namespace so we can use cin and cout correctly

void main()
{
	double val1, val2;
	cout << "Enter a value: ";
	cin >> val1;
	cout << "Enter another value: ";
	cin >> val2;
	cout << val1 << "+" << val2 << "=" << val1 + val2 << endl; //Added quotation marks to the + and =
	cout << val1 << "-" << val2 << "=" << val1 - val2 << endl; //Added quotation marks to the - and =
	_getch(); //_getch(); is correct, not just getch();
}
