//Connor Cerisano (0630428), Proj 2, 2020-02-29

#include <iostream> //cin,cout
#include <conio.h> //_getch();
using namespace std; //Namespace

//Class to represent several hot dog stands distributed throughout town
class HotDogStand
{
private:
    //Declare variables
    int standID;
    int numberSold;
    static int totalSold;

public:
    //Declare functions
    void justSold();
    HotDogStand(int id, int ns);

    //Declare "get" (return) functions
    int getID();
    int getNumSold();
    static int getTotalSold(); //Static function that returns the value of totalSold
};

int HotDogStand::totalSold = 0; //Define static variable outside of class definition, initialize to 0

HotDogStand::HotDogStand(int id, int ns) //Constructor, initialize both variables
{
    standID = id;
    numberSold = ns;
}
void HotDogStand::justSold() //Function that increments # of hot dogs the stand has sold
{
    numberSold++; //Increment hot dogs sold for the stand
    totalSold++; //Increment hot dogs sold for every stand
}
int HotDogStand::getNumSold() //Get how many hot dogs were sold by the stand
{
    return numberSold;
}
int HotDogStand::getID() //Get the ID number of the stand
{
    return standID;
}
int HotDogStand::getTotalSold() //Get how many hot dogs were sold by EVERY stand (incremented in justSold())
{
    return totalSold;
}

//Main function, to test class with three stands that sell different amounts of hot dogs
void main()
{
    //Create three stands, with IDs 1,2,3, and start each with zero hot dogs sold
    HotDogStand stand1(1, 0), stand2(2, 0), stand3(3, 0);

    //Sell hot dogs!
    stand3.justSold();
    stand2.justSold();
    stand1.justSold();
    stand3.justSold();
    stand2.justSold();
    stand2.justSold();

    //Display total hot dogs sold by EACH stand
    cout << "Stand " << stand1.getID() << " sold " << stand1.getNumSold() << " hot dog(s)." << endl;
    cout << "Stand " << stand2.getID() << " sold " << stand2.getNumSold() << " hot dog(s)." << endl;
    cout << "Stand " << stand3.getID() << " sold " << stand3.getNumSold() << " hot dog(s)." << endl;

    //Display total hot dogs sold by ALL stands
    //Note: We could use stand1, stand2, or stand3 and getTotalSold() would return the same value.
    cout << "Total hot dogs sold = " << stand3.getTotalSold() << endl << endl;

    _getch(); //Pause console so we can see results
}