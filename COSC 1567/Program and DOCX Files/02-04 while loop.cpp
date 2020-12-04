//02-04.cpp
#include <iostream>
using namespace std;
#include <conio.h>
int main( )
{
    int countDown;

    cout << "How many greetings do you want? ";
    cin >> countDown;

    while (countDown > 0)
    {
        cout << "Hello ";
        countDown = countDown - 1;
    }

    cout << endl;
    cout << "That's all!\n";
	_getch();
    return 0;
}