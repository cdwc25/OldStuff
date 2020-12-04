//Connor Cerisano, 0630428, 2020-01-26

// Debug 4-1
// function counts down from higher number to lower number entered
// e.g., if numbers entered are 4 and 8
// output is: 8 7 6 5 4

#include <iostream> //iosteam.h doesn't exist, use iostream instead
#include <conio.h>

//We need to use a namespace if we want to use cin and cout correctly here
using namespace std;

//Put function prototype outside of the main function
void countDown(double highest, double lowest);

void main()
{
    double high, low, temp;
    cout << "Enter a number ";
    cin >> high;
    cout << "Enter another number ";
    cin >> low;
    if (high < low) {
        temp = high;
        high = low;
        low = temp;
    }
    countDown(high, low);
    _getch(); //getch(); is deprecated, use _getch(); instead
}

//Added corresponding parameters to function definition
void countDown(double highest, double lowest)
{
    int x;
    for (x = highest; x >= lowest; --x)
        cout << x << " " << endl;
}