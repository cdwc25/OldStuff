//Connor Cerisano (c0630428), 2019-11-07, Proj 3

#include <iostream>       // cin, cout, <<, >>, good(), ...
using namespace std;

//Function prototype for Sort3()
void Sort3(int& int1, int& int2, int& int3);

//Function prototype for swap()
void swap(int& num1, int& num2);

void main()
{
	int x, y, z; //Local variables for user input

	cout << "Welcome to the program! Please enter 3 integers.\n";
	for (;;) //Error checking for entering integers
	{
		cin >> x;
		cin >> y;
		cin >> z;
		if (cin.fail()) //If input is invalid
		{
			cout << "\nOops! You entered an unsupported value somewhere. Please try entering 3 valid integers.\n";
			cin.clear(); //Make sure cin.fail() does not return true anymore.
			cin.ignore(100, '\n'); //Extract and discard characters from input sequence
		}
		else break; //If no error occurs, exit loop
	}

	//Sort values the user inputted.
	//Notice: Sort3() references to our local variables x, y and z. 
	//swap() references to two integers at a time inside Sort3(), which reference to 2 variables of the set x, y, and z.
	Sort3(x, y, z); 

	//Display our sorted values to the console
	cout << "\nThe values in ascending order are:\n";
	cout << x << ", ";
	cout << y << ", ";
	cout << z << endl;

	system("pause"); //Pause console so we can see results
}

//Function definition for swap()
void swap(int& num1, int& num2)
{
	int temp;
	temp = num1;
	num1 = num2;
	num2 = temp;
}

//Function definition for Sort3()
void Sort3(int& int1, int& int2, int& int3)
{
	for (;;) //Continue swapping forever, until loop is broken.
	{
		//Only break if values are in ascending order.
		//(if x is less than or equal to y AND y is less than or equal to z)
		if (int1 <= int2 && int2 <= int3) break;

		else //If values are not in ascending order, compare each integer and swap if needed.
		{
			if (int1 <= int2) swap(int1, int2); //If x is less than or equal to y, swap them so y is greater than x.
			if (int2 <= int3) swap(int2, int3); //If y is less than or equal to z, swap them so z is greater than y.
			if (int3 <= int1) swap(int3, int1); //If z is less than or equal to x, swap them so z is greater than x.
		}
	}
}
