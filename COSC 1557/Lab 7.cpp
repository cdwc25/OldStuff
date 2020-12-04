//Connor Cerisano (c0630428), 2019-10-28, Lab 7

#include <iostream>       // cin, cout, <<, >>, good(), ...
#include <string>           // string
#include <cassert>          // assert()
using namespace std;

//Function prototype of Apply()
double Apply(char operation, double op1, double op2);

int main()
{
	//Local variables for user input
	char operation;
	double op1, op2;

	cout << "\nWelcome to the 4-function calculator!\n"
		<< "\nPlease enter:\n"
		<< "\t+, to perform addition;\n"
		<< "\t-, to perform subtraction;\n"
		<< "\t*, to perform multiplication;\n"
		<< "\t/, to perform division;\n--> ";
	for (;;) //Error checking for entering operation type
	{
		cin >> operation;
		if (cin.fail() || operation != '+' && operation != '-' && operation != '*' && operation != '/') //NEGATED assert conditions with cin.fail() as a precaution
		{
			cout << "\nOops! You entered an unsupported value. Please try entering any operation listed above.\n";
			cin.clear(); //Make sure cin.fail() does not return true anymore.
		}
		else break; //If no error occurs, exit loop
	}

	cout << "\nNow enter your operands: \n";
	for (;;) //Error checking for entering operands
	{
		cin >> op1 >> op2;
		if (cin.fail() || cin.bad() || operation == '/' && op2 == 0) //NEGATED assert conditions, with cin.fail() as a precaution
		{
			cout << "\nOops! You entered an unsupported operand. Please try entering a valid operand!\n";
			cin.clear(); //Make sure cin.fail() does not return true anymore.
			cin.ignore(100, '\n'); //Extract and discard characters from input sequence (avoid getting stuck in an error loop!)
		}
		else break; //If no error occurs, exit loop
	}

	//Display our result(s) to the user
	double result = Apply(operation, op1, op2);
	cout << endl << op1 << operation << op2 << " = " << result << endl;
}

//Function definition for Apply() 
double Apply(char operation, double op1, double op2)
{
	if (operation == '+') return op1 + op2;
	else if (operation == '-') return op1 - op2;
	else if (operation == '*') return op1 * op2;
	else if (operation == '/') return op1 / op2;
}
