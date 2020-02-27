// Connor Cerisano, 0630428, 2020-02-03, Lab 3

// DEBUG 3-1
// Allows user to select an option and displays the price

//Library iostream.h doesn't exist, but iostream does!
#include <iostream>
#include<conio.h>

//We need a namespace to use cin and cout correctly
using namespace std;

void main()
{
    //Semicolon was in here, oops
    char answers[5] = { 'a', 'b', 'c', 'd', 'e' };
    double price[5] = { 149.95, 215.66, 239.77, 308.11, 500.99 };
    char selection;
    int x;

    cout << "Enter your choice of our hotel suites" << endl;
    cout << "a for the alyse, b for the botanical, c for the crimson" << endl;
    cout << "d for the darlton, or e for the edwardian" << endl;
    cout << "Enter x to quit ";
    cin >> selection;

    //Added a condition so we can exit if the user enters z
    while (selection == 'x' || selection != 'z')
    {
        //Added brackets to statements accordingly
        for (x = 0; x <= 5; ++x) {
            if (selection == answers[x]) {
                cout << "Price $" << price[x] << endl;
            }
        }
        //Made the user able to enter another option
        cout << "Enter next selection or z to quit ";
        cin >> selection;
    }

    cout << "Thank you!" << endl;
    _getch(); //getch(); is deprecated, use _getch(); instead
}
