// Connor Cerisano
// DEBUG 10-2
// 2020-03-17

//This program defines a Person class which includes an
//overloaded insertion operator.
// Also included is a personDisplay manipulator
//that displays a message and sets a field size
// An array of persons is entered and displayed

#include <iostream> //added iostream
#include <fstream> //removed .h
#include<conio.h>
#include<string.h>

using namespace std; //We need to use namespace std so we can use cin and cout correctly

class Person
{
private:
    int idNum;
    char name[10];
public:
    Person(const int id, const char nm[]);
    friend ostream& operator<<(ostream& out, const Person& p);
    friend istream& operator>>(istream& in, Person& p);
};

Person::Person(const int id = 000, const char nm[] = "")
{
    idNum = id;
    strcpy_s(name, nm); //use strcpy_s instead
}

ostream& operator<<(ostream& out, const Person& p)
{
    out << p.name << p.idNum << endl;
    return(out);
}

ostream& personDisplay(ostream& s)
{
    cout << "Here is a person: ";
    cout.setf(ios::left);
    cout.width(12);
    return(s);
}

istream& operator>>(istream& in, Person& p) //Added &
{
    cout << "Enter ID Number ";
    cin >> p.idNum;
    cout << "Enter name ";
    cin >> p.name;
    return(in); //return the stream, not the person
}

void main()
{
    Person someBody[5];
    int x;
    for (x = 0; x < 4; ++x)
        cin >> someBody[x];
    for (x = 0; x < 4; ++x) //These didn't match, un-entered data was being displayed
        cout << personDisplay << someBody[x] << endl; //changed >> to <<
    _getch(); //getch(); is deprecated, use _getch(); instead
}