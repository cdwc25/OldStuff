
#include <iostream>
#include <cmath>
using namespace std;
#include <conio.h>

int roundmy(double number);
//Assumes number >= 0.  
//Returns number rounded to the nearest integer.

int main( )
{
    double doubleValue;
    char ans;

    do
    {
        cout << "Enter a double value: ";
        cin >> doubleValue;
        cout << "Rounded that number is " << roundmy(doubleValue) << endl;
        cout << "Again? (y/n): ";
        cin >> ans;
    }while (ans == 'y' || ans == 'Y');
    cout << "End of testing.\n";
	_getch();
    return 0;
}

//Uses cmath:
int roundmy(double number)
{
    return static_cast<int>(floor(number + 0.5));
}
