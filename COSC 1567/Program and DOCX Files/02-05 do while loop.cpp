//02-05.cpp
#include <iostream>
using namespace std;
# include <conio.h>
int main( )
{
    int countDown;

    cout << "How many greetings do you want? ";
    cin >> countDown;

    do
    {
        cout << "Hello ";
        countDown = countDown - 1;
    }while (countDown > 0);

    cout << endl;
    cout << "That's all!\n";
	_getch();
    return 0;
}