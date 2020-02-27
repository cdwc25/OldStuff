// Connor Cerisano (0630428), Lab 4, 2020-02-08

// Debug 5-3

//iostream.h doesn't exist, use iostream instead
#include <iostream>
#include <conio.h>

//We need to use namespace std so we can use cin and cout correctly
using namespace std;

class RaceHorse
{
private:
    char name[20];
    int age;
    double winnings;
    static double stableWinnings;

public:
    //Changed "char" to "const char"
    void setRaceHorseData(const char raceHorseName[], int raceHorseAge, double raceHorseWinnings);
    void showRaceHorse();
};

/*
Because static member variables are not part of the individual class objects 
(they are treated similarly to global variables, and get initialized when the program starts), 
you must explicitly define the static member outside of the class, in the global scope.
*/
double RaceHorse::stableWinnings;

void RaceHorse::setRaceHorseData(const char raceHorseName[], int raceHorseAge, double raceHorseWinnings)
{
    //strcpy is deprecated, use strcpy_s instead
    strcpy_s(name, raceHorseName);

    age = raceHorseAge;
    winnings = raceHorseWinnings;
    stableWinnings += winnings;
}

//Added "void" here
void RaceHorse::showRaceHorse()
{
    cout << "RaceHorse: " << name << ", aged " << age
         << ", has won $" << winnings << "." << endl
         << "Total stable winnings are $" << stableWinnings << "\n\n";
}

void main()
{
    RaceHorse stable[3];

    //For stableWinnings to add up correctly, a for statement is not needed here.
    stable[0].setRaceHorseData("Secretariat", 25, 32000);
    stable[0].showRaceHorse();
    stable[1].setRaceHorseData("Old Bones", 30, 15000);
    stable[1].showRaceHorse();
    stable[2].setRaceHorseData("Citation", 5, 3500);
    stable[2].showRaceHorse();

    _getch(); //getch(); is deprecated, use _getch(); instead
}