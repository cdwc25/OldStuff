#include <iostream>
#include<cstdlib>
#include <conio.h>
using namespace std;

class DayOfYear
{
public:
    DayOfYear(int monthValue, int dayValue);
    DayOfYear(int monthValue);
    DayOfYear( );
    void input( );
    void output( );
    int getMonthNumber( );
    int getDay( );
private:
    int month;
    int day;
    void testDate( );
};

class Holiday
{
public:
    Holiday( );//Initializes to January 1 with no parking enforcement
    Holiday(int month, int day, bool theEnforcement);
    void output( );
private:
    DayOfYear date; //--------------DayOfYear' object being used here---------
    bool parkingEnforcement;//true if enforced
};

int main( )  //no DayOfYear  class used here
{
    //Holiday h(2, 14, true);

	Holiday h(2, 14, false);
    cout << "Testing the class Holiday.\n";
    h.output( );
	_getch();
    
    return 0;
}

Holiday::Holiday( ) : date(1, 1), parkingEnforcement(false)
{/*Intentionally empty*/}

Holiday::Holiday(int month, int day, bool theEnforcement) 
                    : date(month, day), parkingEnforcement(theEnforcement)
{/*Intentionally empty*/}

void Holiday::output( )
{
    date.output( ); // what date is???
    cout << endl;
	if (parkingEnforcement)
	{
		cout << "Parking laws will be enforced.\n";
		_getch();
	}
	else
	{
		cout << "Parking laws will not be enforced.\n";
		_getch();
	}
}

DayOfYear::DayOfYear(int monthValue, int dayValue) 
                          : month(monthValue), day(dayValue)
{
    testDate( );
}

//uses iostream and cstdlib:
void DayOfYear::testDate( )
{
    if ((month < 1) || (month > 12))
    {
        cout << "Illegal month value!\n";
		_getch();
        exit(1);
    }
    if ((day < 1) || (day > 31))
    {
        cout << "Illegal day value!\n";
		_getch();
        exit(1);
    }
}

//Uses iostream:
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
}
