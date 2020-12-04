//Connor Cerisano, 0630428, 2020-01-26

// Debug 4-3
// Function displays course information
// instructor defaults to Staff
// enrollment defualts to 30

#include <iostream> //iosteam.h doesn't exist, use iostream instead
#include <conio.h>

//We need to use a namespace if we want to use cin and cout correctly here
using namespace std;

//Moved function prototypes outside of main function
void displayCourseInfo(const char course[], const char instructor[] = "Staff", int enrollment = 30);

void main()
{
    displayCourseInfo("ENG101");

    //Re-arranged function arguments to follow the order of the function definition
    //(Otherwise, we would be giving the function arguments of the wrong data type!)
    displayCourseInfo("PSY151", "Bossert");
    displayCourseInfo("CIS200", "Dykeman", 24);
     
    _getch(); //getch(); is deprecated, use _getch(); instead
}

//The function definition doesn't need to re-define parameters
void displayCourseInfo(const char course[], const char instructor[], int enrollment)
{
    cout << course << " taught by " << instructor << " enrollment " << enrollment << endl;
}
