#include <iostream>
#include <cstdlib> //for exit
#include <conio.h>
using namespace std;

class DayOfYear
{
public:
    DayOfYear(int monthValue, int dayValue);// constructor (no type in front), in public
    //Initializes the month and day to arguments.
   
    DayOfYear(int monthValue);// condstructor
    //Initializes the date to the first of the given month.
   
    DayOfYear( );// no arguments-default constructor
    //Initializes the date to January 1.
   
    void input( );
    void output( );
    int getMonthNumber( );
    //Returns 1 for January, 2 for February, etc.
	//no member functions set here, but they are in 06.04
    int getDay( );
private:
    int month;
    int day;
    void testDate( );//private!! to bne used in constructors
};

int main( )
{
    DayOfYear date1(2, 21), date2(5), date3;//objects declared and initialized, date3 no paranthesis
    cout << "Initialized dates:\n";
    date1.output( ); cout << endl;
	_getch();
    date2.output( ); cout << endl;
	_getch();
    date3.output( ); cout << endl;
	_getch();

    date1 = DayOfYear(10, 31);//explicit call to the constructor, October 31
	//if no argument constructor, use paranthesis  DayOfYear()
    cout << "date1 reset to the following:\n";
    date1.output( ); cout << endl;
	_getch();
    return 0;
}


DayOfYear::DayOfYear(int monthValue, int dayValue) 
                          : month(monthValue), day(dayValue) //alternative initialization. section
{
    testDate( );
}

DayOfYear::DayOfYear(int monthValue) : month(monthValue), day(1)
{
    testDate( );
}

DayOfYear::DayOfYear( ) : month(1), day(1) //default constructor andf member variables initial.
{/*Body intentionally empty.*/}

//uses iostream and cstdlib:
void DayOfYear::testDate( )
{
    if ((month < 1) || (month > 12))
    {
        cout << "Illegal month value!\n";
		//_getch();
        exit(1);
    }
    if ((day < 1) || (day > 31))
    {
        cout << "Illegal day value!\n";
		//_getch();
        exit(1);
    }
}

int DayOfYear::getMonthNumber( )
{
    return month;
}

int DayOfYear::getDay( )
{
    return day;
}

//Uses iostream and cstdlib:
void DayOfYear::input( )  //has not been used in 07-01.cpp
{
    cout << "Enter the month as a number: ";
    cin >> month;
	//_getch();
    cout << "Enter the day of the month: ";
    cin >> day;
	//_getch();
    if ((month < 1) || (month > 12) || (day < 1) || (day > 31))
    {
        cout << "Illegal date! Program aborted.\n";
		//_getch();
        exit(1);
    }
}

void DayOfYear::output( )
{
    switch (month)
    {
        case 1:
            cout << "January "; break;
        case 2:
            cout << "February "; break;
        case 3:
            cout << "March "; break;
        case 4:
            cout << "April "; break;
        case 5:
            cout << "May "; break;
        case 6:
            cout << "June "; break;
        case 7:
            cout << "July "; break;
        case 8:
            cout << "August "; break;
        case 9:
            cout << "September "; break;
        case 10:
            cout << "October "; break;
        case 11:
            cout << "November "; break;
        case 12:
            cout << "December "; break;
        default:
            cout << "Error in DayOfYear::output. Contact software vendor.";
    }

    cout << day;
	//_getch();
}





