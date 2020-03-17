//Connor Cerisano, 2020-02-29, Lab 6
//Debug 7-1

#include <iostream> //iostream.h doesn't exist, use iostream instead
#include <conio.h>
#include <string.h>

using namespace std; //We need to use namespace std so we can use cin and cout correctly

class Technician; //Forward declaration of class technician (so the compiler knows what Technician looks like)

class RepairJob
{
    void friend displayRepairJob(RepairJob rj, Technician tech);

private:
    int jobNum;
    int mo;
    int day;
    int yr;
    double amount;
    int techNum;

public:
    RepairJob(int job, int m, int d, int y, double amt, int tech); //Added int d to match
};

class Technician
{
    void friend displayRepairJob(RepairJob rj, Technician tech);

private:
    int techId;
    char name[20];

public:
    Technician(int id, const char nm[]); //Added const here

};

RepairJob::RepairJob(int job, int m, int d, int y, double amt, int tech)
{
    jobNum = job;
    mo = m;
    day = d;
    yr = y;
    amount = amt;
    jobNum = tech;
}

Technician::Technician(int id, const char nm[]) //Added const here
{
    techId = id;
    strcpy_s(name, nm); //use strcpy_s instead
}

void displayRepairJob(RepairJob rj, Technician tech)
{
    cout << "RepairJob " << rj.jobNum << " on " << rj.mo << "/" << rj.day << "/" << rj.yr <<
        " for $" << rj.amount << " repaired by #" << tech.techId << " " << tech.name << endl;
}

void main()
{
    RepairJob job(1386, 9, 2, 2003, 228.95, 345);
    Technician tech(345, "Dunne");
    displayRepairJob(job,tech); //Gave function arguments

    _getch(); //getch(); is deprecated, use _getch(); instead
}


