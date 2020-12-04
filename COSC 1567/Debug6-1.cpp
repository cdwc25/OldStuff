// Connor Cerisano
// 2020-02-22
// Lab 5, Debug 6-1

//Chapter 6 Debug 1

#include <iostream> //iostream.h doesn't exist, use iostream instead
#include <conio.h>

using namespace std; //We need a namespace so we can use cin and cout correctly

class Auto
{
private:
    int autoId;
    char mechanicName[20];
    double fee;

public:
    //Added a default parameter for name[], made the char const
    Auto(int id = 999, const char name[] = "Mechanic", double amt = 25.00);
    void showAuto();
};

//Added "Auto::" so the scope changes, we can define the function outside of the class
Auto::Auto(int id, const char name[], double amt)
{
    autoId = id;
    strcpy_s(mechanicName, name); //strcpy_s is a safer version of strcpy, avoids overflows
    fee = amt;
}

void Auto::showAuto()
{
    cout << "Auto #" << autoId << " worked on by " << mechanicName << " Amount due $" << fee << endl;
}

void main()
{
    cout << "Mike's Service " << endl << "Autos Worked on Today" << endl << endl;
    cout << "Mike works on most cars. Occasionally he assigns a job to another mechanic" << endl;
    cout << "Minimum charge $25" << endl << endl;

    Auto car1, car2(321), car3(456, "Amy"), car4(567, "Jeremy", 149);

    car1.showAuto();
    car2.showAuto();
    car3.showAuto();
    car4.showAuto();

    _getch(); //getch(); is deprecated, use _getch(); instead
}