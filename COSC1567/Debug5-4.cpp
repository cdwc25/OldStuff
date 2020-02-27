// Connor Cerisano (0630428), Lab 4, 2020-02-08

// Debug 5-4

//iostream.h doesn't exist, use iostream instead
#include <iostream>
#include <conio.h>

//We need to use namespace std so we can use cin and cout correctly
using namespace std;

class Office
{
private:
    int officeNum;
    char tenant[30];
    //Created totalRent, made it static
    static int rentDueDate, totalRent;

public:
    //Changed from type char to const char
    void setOfficeData(int num, const char occupant[], int rent);
    static void showRentDueDate();
    void showOffice();
};

//Definition of static variables outside of class
int Office::rentDueDate = 1;
int Office::totalRent;

void Office::setOfficeData(int num, const char occupant[], int rent)
{
    officeNum = num;
    //strcpy is deprecated, use strcpy_s instead
    strcpy_s(tenant, occupant);
    //Add up total rent, supports multiple people in office
    totalRent += rent;
}

void Office::showOffice()
{
    cout << "Office " << officeNum << " is occupied by " << tenant << endl;
    cout << "The rent $" << totalRent << " is due on day " << rentDueDate << " of the month" << endl;
}

void Office::showRentDueDate()
{
    //Should be <<, not <
    cout << "All rents are due on day " << rentDueDate << " of the month" << endl;
}

void main()
{
    //Created an object, myOffice
    Office myOffice;

    myOffice.showRentDueDate();
    myOffice.setOfficeData(234, "Dr. Albright", 450);
    myOffice.showOffice();

    _getch(); //getch(); is deprecated, use _getch(); instead
}