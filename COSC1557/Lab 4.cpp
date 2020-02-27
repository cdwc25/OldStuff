//Connor Cerisano, (0630428) 9/26/2019, Lab 4

//Include Directives
#include <iostream>
#include <cmath>
#include <cassert>

using namespace std;

//Function Prototypes
double root1(double a, double b, double c); //Function representing root 1 (addition)
double root2(double a, double b, double c); //Function representing root 2 (subtraction)

int main() //Main function
{
	//User Variables
	double a, b, c;
	cout << "Welcome! This program will determine the roots of a quadratic equation." << endl;
	cout << "Please input three different values to calculate." << endl;
	
	//User-Inputted Values
	cin >> a;
	cin >> b;
	cin >> c;

	//Error Checking (assert closes the program once a condition is met)
	assert(a != 0); //a should be equal to zero
	assert((pow(b, 2) - 4 * a*c) >= 0); //b^2-4ac should be negative

	//Display Results to User
	cout << "Root 1 is: " << root1(a, b, c) << " and Root 2 is: " << root2(a, b, c) << endl;
	system("pause");
}

//Function Definitions
double root1(double a, double b, double c)
{
	int calculation;
	//Perform the calculation step-by-step. Reuse variable "calculation".
	calculation = pow(b, 2) - 4 * a*c; //Math function pow() raises base x to the power of y.
	calculation = -b + sqrt(calculation); //Math function sqrt() takes the square root of any input.
	calculation = calculation / (2 * a); //Final division: by 2a
	return calculation; //Return final calculation
}

double root2(double a, double b, double c)
{
	int calculation;
	//Perform the calculation step-by-step.
	calculation = pow(b, 2) - 4 * a*c; //Calculate everything in the sqrt first
	calculation = -b - sqrt(calculation); //Subtraction takes place here instead of addition
	calculation = calculation / (2 * a); //Final division, by 2a
	return calculation; //Return final calculation
}

/*Question:
The roots of 2x^2+4x-96 = 0 are 6 and -8, according to my program.
The factored polynomial is: 2(x-6)(x+8).
*/
