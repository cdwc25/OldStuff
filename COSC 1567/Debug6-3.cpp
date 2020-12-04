// Connor Cerisano
// 2020-02-22
// Lab 5, Debug 6-3

//Debug 6-3

#include <iostream> //iostream.h doesn't exist, use iostream instead
#include <conio.h>

using namespace std; //We need a namespace so we can use cin and cout correctly

class ClubMember
{
private:
    static int count;
    char name[20];

public:
    ClubMember(const char identity[]); //The constructor needs a parameter to work with.
    ~ClubMember();
};

//Definition of static variable outside of class
int ClubMember::count = 0;

//Constructor
ClubMember::ClubMember(const char identity[])
{
    ++count;
    strcpy_s(name, identity); //use strcpy_s instead
    cout << "ClubMember #" << count << " created: ";
    cout << name << " has joined the club" << endl;
}

//Destructor
ClubMember::~ClubMember()
{
    --count;
    cout << name << " has left the club" << endl;
    cout << count << " ClubMembers left" << endl;
}

void main()
{
    {
        cout << "This program shows five club members" << endl << "joining, then leaving, the club" << endl;
        ClubMember club[5] = { ClubMember("Jim"),ClubMember("Tom"),
            ClubMember("Julie"),ClubMember("Jane"),ClubMember("Kate") };
    }

    _getch(); //getch(); is deprecated, use _getch(); instead
}