// Connor Cerisano
// 2020-03-20
// COSC 1567: Programming in C++ Lab Test

#include <iostream> //cin, cout
#include <string.h> //.append()
using namespace std;

class CompSciCourse
{
private:
	int numberOfStudents = 0; //Integer to store the number of students, initialize to zero
	char courseCode[15]; //Character array to store the course code
	string* studentLastName = new string[numberOfStudents]; //Array of strings to store the last names of the students
	static int studentsEnrolled; //Static integer to store the total number of students enrolled across all instances of the class

public:
	//Function to return the total number of students enrolled across all instances of the class
	static int getStudentsEnrolled()
	{
		return studentsEnrolled;
	}
	//Function to output the last names of all students enrolled in the class
	string outputLastNames()
	{
		string result;
		//This for statement will go through our dynamic list of student names!
		for (int i = 0; i < numberOfStudents; ++i)
		{
			result.append(studentLastName[i]);
			result.append(", ");
		}
		//Remove comma at end of list, no new students are being added anymore
		result.erase((result.size()- 2), 1);
		//Return our appended output
		return result; 
	}
	//Function to enroll students
	void enrollStudent(string nameInput)
	{
		numberOfStudents++; //Increment the local enrollment number
		studentsEnrolled++; //Increment the enrollment number

		//INCREASE ARRAY SIZE, ADD TO ARRAY
		string* temp = new string[numberOfStudents]; //Create a NEW array with the increased size
		for (int i = 0; i < (numberOfStudents - 1); i++) //Copy the old elements to the new array
		{
			temp[i] = studentLastName[i];
		}
		temp[numberOfStudents - 1] = nameInput;
		delete[] studentLastName;
		studentLastName = temp;
	}
	//Function to unenroll a student
	void unEnrollStudent(string nameInput)
	{
		numberOfStudents--; //Decrement the local enrollment number
		studentsEnrolled--; //Decrement the enrollment number

		for (int i = 0; i < numberOfStudents - 1; i++) //Find if the name is in the array
		{
			if (studentLastName[i] == nameInput)
			{
				//If the array contains nameInput,
				//Remove the specified name from the array
				studentLastName[i] == "";
			}
			else 
			{
				//If the array does not contain nameInput, "fail"
				cout << "\nInvalid student name. Program will now exit to avoid further error.\n";
				exit(1); //exit with code 1
			}
		}
	}
	//Extra function, that works with user input to set custom course code
	void setCourseCode(const char cc[])
	{
		strcpy_s(courseCode, cc);
	}
	//Overloaded << operator, outputs the course code, number of enrolled students, total enrolled students, and names of all students
	friend ostream& operator<<(ostream& out, CompSciCourse& c)
	{
		out << "Course Code: " << c.courseCode << endl;
		out << "Number Of Students: " << c.numberOfStudents << endl;
		out << "Students Enrolled (in every course): " << c.studentsEnrolled << endl;
		out << "Student Names: " << c.outputLastNames() << endl << endl;
		return(out);
	}
	//Constructor with default parameters. Takes in character arrays instead of strings.
	CompSciCourse(int students = 0, const char cc[] = "defaultCourse")
	{
		numberOfStudents = students;
		strcpy_s(courseCode, cc);
	}
	//Destructor, outputs that the course has been cancelled
	~CompSciCourse()
	{
		cout << "\nThis course has been cancelled." << endl;
		delete [] studentLastName; //Delete array of pointers (only delete when you use "new")
	}
};

//Create and instantiate static variable
int CompSciCourse::studentsEnrolled = 0;

//Main function
void main()
{
	CompSciCourse classOne, classTwo; //Instantiate 2 instances of the class
	string studentName; //Variable to enroll students based off of name
	char courseName[15]; //Custom course code, used in extra function
	classTwo.enrollStudent("ExampleStudent"); //Enroll an example (default) student for classTwo

	cout << "Welcome! In this program, you will create a mock-up computer science class to test out different functions.\n\n";
	cout << "First, let's pick out a course name/code. Please enter a name: ";
	cin >> courseName; //Get the custom course code
	classOne.setCourseCode(courseName); //Set the custom course code

	cout << "Second, let's try enrolling two students.\n";
	for (int x = 0; x < 2; ++x)
	{
		cout << "\nEnter student " << x + 1 << "'s name: ";
		cin >> studentName; //Get the name of the student
		classOne.enrollStudent(studentName); //Enroll them

		//Display current status of all students enrolled and output all last names so far
		cout << "Current Students Enrolled (in every course): " << classOne.getStudentsEnrolled() << endl;
		cout << "Current Student Names: " << classOne.outputLastNames() << endl;
	}

	cout << "\nUnenrolled the second student!\n";
	classOne.unEnrollStudent(studentName); //Test out unenroll function

	//Display our final results
	cout << "\nCLASS ONE RESULTS" << endl;
	cout << classOne;
	cout << "CLASS TWO RESULTS" << endl;
	cout << classTwo;

	system("pause"); //Pause console so we can see results
}