// Connor Cerisano, 0630428, 2020-02-03, Lab 3

// DEBUG 3-1
// accumulates total sales from each of 10 salespeople

//Library iostream.h doesn't exist, but iostream does!
#include <iostream>
#include <conio.h>

//We need a namespace to use cin and cout correctly
using namespace std;

void main()
{
    double earnings[10] = { 0.0 };
    double amt;
    int person;

    cout << "Enter salesperson number 1 - 10. Enter 99 to quit. ";
    cin >> person;

    while (person != 99)
    {
        cout << "Enter the sale amount ";
        cin >> amt;
        //Since we are entering a number STARTING at 1, but the array starts at zero, just enter size - 1
        earnings[person - 1] = amt;
        cout << "Enter another salesperson number (1 - 10) or 99 to quit ";
        cin >> person;
    }
    cout << "Salesperson totals are:" << endl;

    //Added brackets, changed ++person to person++
    for (person = 0; person < 10; person++) {
        //Specified what person's earnings we are trying to display
        cout << "Salesperson " << (person + 1) << "  $" << earnings[person] << endl;
    }

    _getch(); //getch(); is deprecated, use _getch(); instead
}


