//Connor Cerisano (c0630428), Lab 3, 2019-09-23
#include <iostream>
#include <cmath> //Allows us to perform math functions
#include <cctype> //Character handling functions
using namespace std;
int main()
{
	cout << "Welcome to my program!\n";
	cout << "We will be doing some math on numbers you give us!\n";
	cout << "------------------------------------------------" << endl;

	//All experiment code goes here!
	//-----Experiment 1-----
	int w, x, y, z;
	const double PI = 3.14159;
	const double TWO_PI = 2 * PI;
	int testInputAndOutput;
	//Tell the user to enter a number whenever asked.
	cout << "For practice, enter a number when prompted...\n";
	cout << "Enter an integer: ";
	//Use cin to prompt the user using our variable testInputAndOutput.
	cin >> testInputAndOutput;
	cout << "You passed! You entered the value: "
		//Display the value of testInputandOutput, then continue the program.
		<< testInputAndOutput << ". Continuing Program...\n\n";

	//-----Experiment 2-----
	double a, b, c;
	cout << "Input initial values for 3 different variables: a,b and c. \n";
	cout << "Enter integer a: ";
	cin >> a;
	cout << "Enter integer b: ";
	cin >> b;
	cout << "Enter integer c: ";
	cin >> c;
	//Operator Precedence
	cout << "\na - (b - c) is " << a - (b - c);
	cout << "\nand a-b-c is " << a - b - c;
	cout << "\n(a * b) / c is " << (a * b) / c;
	cout << "\nand a * (b / c) is " << a * (b / c);
	//Operator Associativity
	cout << "\n(a + b) + c is " << (a + b) + c;
	cout << "\nand a + (b + c) is " << a + (b + c);

	/*Question 1:
	(a*b)/c and a*(b/c) will be undefined only when c = 0.
	This is because you cannot divide by zero. It will return undefined.
	The console shows undefined as "-nan(ind)".
	*/

	//-----Experiment 3-----
	double base, exponent;
	cout << "\n\nInput 2 values that represent a base number and an exponent number.";
	cout << "\nEnter base number: ";
	cin >> base;
	cout << "Enter exponent number: ";
	cin >> exponent;
	cout << base << " to the power of " << exponent << " is " << pow(base, exponent) << endl;
	cout << "sin(PI) is " << sin(PI) << " and sin(3.14159) is " << sin(3.14159);
	cout << "\ncos(PI) is " << cos(PI) << " while cos(3.14159) is " << cos(3.14159);
	cout << "\nand cos(PI * 2) is " << cos(TWO_PI) << endl << endl;

	/*Question 2:
	In this program, there is NOT any difference between sin(PI) and sin(3.14159).
	This is because back in experiment 1, we gave the variable PI the value 3.14159.
	*/

	//-----Experiment 4-----
	x = 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9; //Assignment Statement
	cout << x << endl;
	w = x = y = z = 5; //Assignment Associativity
	cout << w << endl;
	x += 5; y -= 5; z *= 5; w /= 5; //Assignment Shortcuts
	x = 10;
	//Increment and Decrement Expressions
	cout << x++ << endl;
	cout << ++x << endl;
	cout << x-- << endl;
	cout << -x << endl;

	/*Question 3:
	We get an output of 5 for w because each variable is equal to each other, and z
	is the only variable given a value. This is demonstrating assignment associativity.
	x,y and z as a result of this also have a value of 5 and would have the same output.
	*/

	/*Question 4:
	The main difference between z*=5; and z=z*5; is that z*=5; does the math/assignment before
	z=z*5 would. You could say z*=5 serves as a shortcut of sorts, to simplify code!
	Either way, they both would end up with the same value of 25, assuming z is set back
	to 5 after z*=5 is performed.
    */

    /*Question 5:
	The difference between x++ and ++x lies in order of operations. They are both shortcuts that
	add 1 to x, but x++ can be expressed as "x + 1" while ++x is expressed "1 + x".
	Be careful, because x++ and x-- don't/wont display the updated value in the same expression.
    */

	system("pause");
} //end of main routine.
