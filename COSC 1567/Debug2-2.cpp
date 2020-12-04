//Connor Cerisano, c0630428, 2-2, 1/17/2020

//DEBUG2-2
#include<iostream> //iostream.h is not valid, use iostream instead
#include<conio.h>

using namespace std; //We need a namespace so we can use cin and cout correctly here

void main()
{
	double salary;
	cout << "Enter salary. " << endl;
	cout << "Salary must be no less than 5.85 and no more than 45.95 ";
	cin >> salary;
	while (salary < 5.85 || salary > 45.95)
	{ //Added curly brackets to contain the while statement
		cout << "Please re-enter." << endl << "Value must be between 5.85 and 45.95. ";
		cin >> salary;
	}
	cout << "Thank you. Salary is " << salary << endl;
	_getch(); //_getch(); is used instead because getch(); is deprecated.
}
