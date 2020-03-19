// Connor Cerisano
// DEBUG 10-4
// 2020-03-17

// This program defines a person class
// and writes 3 persons to a disk file

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
    friend istream& operator>>(istream& in, Person& p);
};

Person::Person(const int id = 000, const char nm[] = "")
{
    idNum = id;
    strcpy_s(name, nm); //use strcpy_s instead 
}

ostream& operator<<(ostream& out, const Person& p) //Added &
{
    out << p.name << " " << p.idNum << endl; //Referenced by adding "p."
    return(out);
}

ostream& personDisplay(ostream s)
{
    cout << "Here is a person: ";
    //setf and width are functions, so use the dot operator
    cout.setf(ios::left);
    cout.width(12);
    return(s);
}

istream& operator>>(istream& s, Person& p) //Added &
{
    cout << "Enter ID Number ";
    cin >> p.idNum; //Added "p." to reference
    cout << "Enter name ";
    cin >> p.name; //Added "p." to reference
    return(s);
}

void main()
{
    Person aPerson[3];
    //Removed ":", wasn't showing up in project directory
    ofstream out("aperson.dat");
    for (int x = 0; x < 3; ++x)
        cin >> aPerson[x];
    for (int y = 0; y < 3; ++y)
        out.write((char*)(&aPerson[y]), sizeof(aPerson)); //Force, or cast, conversion to type char*
    _getch(); //getch(); is deprecated, use _getch(); instead
}