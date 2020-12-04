//Connor Cerisano (c0630428)
//COSC 1557
//Proj 1: Functions
//Instructor: Haibin Zhu 
//2019-10-02

//Include Directives
#include <iostream>
#include <cmath>

using namespace std;

//Global Variables (can be accessed by any function)
const double PI = 3.14159;

//Function Prototypes
double CylinderSurfaceArea(double radius, double height);
double CylinderLateralArea(double radius, double height);
double CylinderVolume(double radius, double height);

//Main Function
int main() 
{
	double r, h; //User-inputted variables for the cylinder

	cout << "Welcome! This program computes the total surface area, lateral surface area, and volume of a right-circular cylinder \nwith radius r and height h." << endl;
	cout << endl << "Please enter some values for r and h." << endl;

	//Get our radius and height values from the user
	cin >> r;
	cin >> h;

	//Compute and display the results of our calculations 
	cout << endl << "The surface area of the cylinder is: " << CylinderSurfaceArea(r, h) << endl;
	cout << "The lateral surface area of the cylinder is: " << CylinderLateralArea(r, h) << endl;
	cout << "The volume of the cylinder is: " << CylinderVolume(r, h) << endl;

	//End the program
	cout << endl << "The program will now close." << endl;
	system("pause");
}

//----FUNCTION DEFINITIONS----
double CylinderSurfaceArea(double radius, double height) //Surface Area
{
	return 2 * PI * radius * (radius + height);
}

double CylinderLateralArea(double radius, double height) //Lateral Surface Area
{
	return 2 * PI * radius * height;
}

double CylinderVolume(double radius, double height) //Volume
{
	return PI * pow(radius, 2) * height;
}
