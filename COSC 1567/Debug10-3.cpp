// Connor Cerisano
// DEBUG 10-3
// 2020-03-17

// This program defines a person class
// and writes a person to a disk file

#include <iostream> //added iostream
#include <fstream> //removed .h
#include <conio.h> //for _getch();
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

ostream& operator<<(ostream& out, const Person& p)
{
    out << p.name << p.idNum << endl;
    return(out);
}

ostream& personDisplay(ostream& s) //Removed Person::
{
    cout << "Here is a person: ";
    cout.setf(ios::left); //Two colons must be used
    cout.width(12);
    return(s);
}

istream& operator>>(istream& in, Person& p) //Added parameters
{
    cout << "Enter ID Number ";
    cin >> p.idNum;
    cout << "Enter name ";
    cin >> p.name;
    return(in); //always return the stream, not the person
}

void main()
{
    Person aPerson;
	//Removed ":", wasn't showing up in project directory
    ofstream out("aperson.dat");   // change path if necessary
    cin >> aPerson;
    out.write((char*)(&aPerson), sizeof(aPerson)); //No argument conversion is needed if you use sizeof();
    _getch(); //Pause console so we can see results
}