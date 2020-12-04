//Connor Cerisano, 0630428, 2020-01-26

// Debug 4-2
// User enters price
// program computes tax rate
// 5% at $10 and under, otherwise 7%

#include <iostream> //iosteam.h doesn't exist, use iostream instead
#include <conio.h>

//We need to use a namespace if we want to use cin and cout correctly here
using namespace std;

//Moved function prototypes outside of main function
double askPrice();
double calcTax(double price);

void main()
{
    double price = askPrice(); //Since askPrice() returns a value, we can store it to a variable
    double taxRate = calcTax(price); //Same with this function!

    cout << "On $" << price << ", the taxRate is " << taxRate << endl;

    _getch(); //getch(); is deprecated, use _getch(); instead
}

double askPrice()
{
    double price;
    cout << "Enter price $";
    cin >> price;
    return price;
}

//Added corresponding parameters to function definition
double calcTax(double price)
{
    double rate;
    if (price <= 10)
    {
        //Put this statement inside brackets, just in case!
        rate = .05;
    }
    else rate = .07;
    return rate;
}