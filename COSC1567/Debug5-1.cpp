// Connor Cerisano (0630428), Lab 4, 2020-02-08

// Debug 5-1

//iostream.h doesn't exist, use iostream instead
#include <iostream>
#include <conio.h>

//We need to use namespace std so we can use cin and cout correctly
using namespace std;

class Worker
{
private:
    int idNum;
    char lastName[20];
    char firstName[20];
    double salary;

//Made the function prototypes public so we can use them in main
public:
    void setIdNum(int id);

    //Updated these to type "const char *"
    void setLastName(const char * last);
    void setFirstName(const char * first);

    void setSalary(double payRate);
    void displayWorker();
};

//Added "Worker::" to all function definitions, so they can access idNum, lastName, firstName, and salary
void Worker::setIdNum(int id)
{
    if (id < 0 || id > 999)
    {
        idNum = 0;
    }
    else 
    { 
        idNum = id; 
    }
}

void Worker::setLastName(const char* last)
{
    //Apparently strcpy is deprecated, use strcpy_s instead
    strcpy_s(lastName, last);
}

void Worker::setFirstName(const char* first)
{
    //strcpy is deprecated, use strcpy_s instead
    strcpy_s(firstName, first);
}

void Worker::setSalary(double payRate)
{
    if (payRate <= 5.75 || payRate > 99.99)
    {
        salary = 5.75;
    }
    else 
    { 
        salary = payRate; 
    }
}

void Worker::displayWorker()
{
    cout << "ID #" << idNum << " Name: " << firstName << " " << lastName
        << " Salary: $" << salary << endl;
}

void main()
{
    Worker aWorker;
    aWorker.setIdNum(333);
    aWorker.setLastName("Vasquez");
    aWorker.setFirstName("Juan");
    aWorker.setSalary(15.65);
    aWorker.displayWorker();

    _getch(); //getch(); is deprecated, use _getch(); instead
}