// Connor Cerisano
// DEBUG 10-1
// 2020-03-17

//This program defines a person class which includes an
//overloaded insertion operator.
// Also included is a personDisplay manipulator
//that displays a message and sets a field size

#include <iostream> //added iostream
#include <fstream> //removed .h
#include <conio.h>
#include <string.h>

using namespace std; //We need to use namespace std so we can use cin and cout correctly

class Person
{
private:
    int idNum;
    char name[10];
public:
    Person(const int id, const char nm[]);
    friend ostream& operator<<(ostream& out, const Person& p);
}; //Class definition needs a semicolon at the end!!!

Person::Person(const int id, const char nm[])
{
    idNum = id;
    strcpy_s(name, nm); //use strcpy_s instead
}

//Added &, for proper function definition
ostream& operator<<(ostream& out, const Person& p) 
{
    out << p.name << p.idNum << endl;
    return out; //<< operator should return a reference to the ostream it was using
}

ostream& personDisplay(ostream& s)
{
    cout << "Here is a person: ";
    cout.setf(ios::left);
    cout.width(12);
    return s;
}

void main()
{
    Person someBody(365, "Gaye");
    cout << personDisplay << someBody << endl;
    _getch(); //getch(); is deprecated, use _getch(); instead
}
