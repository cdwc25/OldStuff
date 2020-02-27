//Connor Cerisano, c0630428, 2-4, 1/17/2020

// Debug 2-4
#include <iostream> //iostream.h does not exist
#include <conio.h>

using namespace std; //We need to use a namespace so that we can use cin and cout correctly

class Apartment
{
public:
	double rent;
	int dayOfMonthRentDue;
};

void main()
{
	Apartment myApt;
	int lastDigit;
	cout << "Enter rent: ";
	cin >> myApt.rent;
	cout << "Enter dayOfMonthRentDue: ";
	cin >> myApt.dayOfMonthRentDue;
	cout << "The rent is $" << myApt.rent << " and it is due on the "
		<< myApt.dayOfMonthRentDue;
	lastDigit = myApt.dayOfMonthRentDue % 10;
	//Add semicolons to lines, no brackets are needed since there is only one statement
	if (lastDigit == 1) cout << "st ";
	else if (lastDigit == 2) cout << "nd ";
	else if (lastDigit == 3) cout << "rd";
	else cout << "th ";
	cout << "of the month." << endl;
	_getch(); //getch(); is deprecated, use _getch(); instead.
}