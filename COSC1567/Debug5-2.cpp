// Connor Cerisano (0630428), Lab 4, 2020-02-08

// Debug 5-2

//iostream.h doesn't exist, use iostream instead
#include <iostream>
#include <conio.h>

//We need to use namespace std so we can use cin and cout correctly
using namespace std;

class UsedCar
{
private:
    int vehicleID;
    double price;
    int year;
    int miles;
    double value;
    void determineMileageRating();

public:
    //Added semicolons, missing functions
    void setVehicleID();
    void setPrice();
    void setYear();
    void setMiles();
    void displayUsedCar();
};

void UsedCar::setVehicleID()
{
    cout << "Enter vehicle ID - use 3 digits: ";
    cin >> vehicleID;

    //Changed AND to OR, couldn't ever be both at same time
    while (vehicleID < 99 || vehicleID > 1000)
    {
        cout << "Oops! Use 3 digits please: ";
        cin >> vehicleID;
    }
}

void UsedCar::setPrice()
{
    cout << "Enter price ";
    cin >> price; //cin, not cout
}

void UsedCar::setYear()
{
    cout << "Enter year of car (1940 - 2005): ";
    cin >> year;

    //Changed AND to OR, couldn't ever be both at same time
    while (year < 1940 || year > 2005)
    {
        cout << "Oops! Check the year and reenter: ";
        cin >> year; //Fixed symbols here
    }
}

void UsedCar::setMiles()
{
    cout << "Enter miles on vehicle: ";
    cin >> miles;
    cout << endl;
    determineMileageRating();
}

void UsedCar::determineMileageRating()
{
    int yearsOld;
    //Changed 2005 to 2006 - hidden error here when entering a 2005 car with 1 mileage
    yearsOld = 2006 - year;

    if (miles < yearsOld * 8000)
    {
        cout << "This is a low mileage car.";
        cout << endl;
    }
    else if (miles < yearsOld * 15000)
    {
        cout << "This is an average mileage car.";
        cout << endl;
    }
    else
    {
        cout << "That is a lot of miles for the age!";
        cout << endl;
    }
}

void UsedCar::displayUsedCar()
{
    cout << "ID #" << vehicleID << " Price: $" << price << endl;
    cout << "Miles: " << miles << endl;
}

void main()
{
    UsedCar aCar;
    aCar.setVehicleID();
    aCar.setPrice();
    aCar.setYear();
    aCar.setMiles();
    aCar.displayUsedCar();
    _getch(); //getch(); is deprecated, use _getch(); instead
}