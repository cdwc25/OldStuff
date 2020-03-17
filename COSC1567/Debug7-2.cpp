//Connor Cerisano, 2020-02-29, Lab 6
//Debug 7-2

//iostream.h doesn't exist, use iostream instead
#include <iostream>
#include <conio.h>
#include <string.h>

//We need to use namespace std so we can use cin and cout correctly
using namespace std;

class College; //Forward declaration

class Student
{
    void friend displayStudent(Student student, College school);

private:
    int studentNum;
    char studentName[30];
    char college[30];

public:
    Student(int id, const char name[], const char col[]); //Added const
};

class College
{
    void friend displayStudent(Student student, College school); //Made these classes friends! :)

private:
    char collegeName[30];
    char collegeCity[30];

public:
    College(const char col[], const char city[]); //Added const
};

Student::Student(int id, const char name[], const char col[]) //Added const
{
    studentNum = id;
    strcpy_s(studentName, name); //strcpy is deprecated, use strcpy_s instead
    strcpy_s(college, col); //strcpy is deprecated, use strcpy_s instead
}

College::College(const char col[], const char city[]) //Added const
{
    strcpy_s(collegeName, col); //strcpy is deprecated, use strcpy_s instead
    strcpy_s(collegeCity, city); //strcpy is deprecated, use strcpy_s instead
}

void displayStudent(Student student, College school)
{
    cout << student.studentName << " goes to " << school.collegeName << " in " << school.collegeCity << endl;
}

void main()
{
    Student aStudent(6772, "Natalie Tripp", "Southern Illinois University");
    College aCollege("Southern Illinois University", "Carbondale, IL");

    displayStudent(aStudent, aCollege);

    _getch(); //getch(); is deprecated, use _getch(); instead
}


