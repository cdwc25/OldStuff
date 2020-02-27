//Connor Cerisano, 0630428, 2020-01-26

// Debug 4-4
// uses Circle class

#include <iostream> //iosteam.h doesn't exist, use iostream instead
#include <conio.h>

//We need to use a namespace if we want to use cin and cout correctly here
using namespace std;

class Circle
{
    //Made the int radius accessible, by making it public
public:
    int radius;
};

//Moved function prototypes outside of main function
void printArea(Circle c);
void printDiameter(Circle c);

void main()
{
    Circle aBigCircle, aLittleCircle;

    aBigCircle.radius = 50;
    aLittleCircle.radius = 4;

    printArea(aBigCircle);
    printDiameter(aBigCircle);
    printArea(aLittleCircle);
    printDiameter(aLittleCircle);

    _getch(); //getch(); is deprecated, use _getch(); instead
}

void printArea(Circle c)
{
    double area;
    //Make sure we are dealing with the radius of circle c specifically!
    area = c.radius * c.radius * 3.14159;
    cout << "A circle with radius " << c.radius << " has an area of " << area << endl;
}

void printDiameter(Circle c)
{
    int diam;
    //Make sure we are dealing with the diameter of circle c specifically!
    diam = c.radius * 2;
    cout << "A circle with radius " << c.radius << " has a diameter of " << diam << endl;
}
