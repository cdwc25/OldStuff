// Connor Cerisano (c0630428), Started on 9/12/2019
#include <iostream>
using namespace std;
int main()
{
	//Create 2 new variables - they store integers. Names are x and y. Initially assigned the values 11 and 22,
	int x = 11, y = 22;

	//Create more new variables, give them initial values. Term: "Declaration". 
	double  i = 11.11, j = 22.22;
	
	//cout<< here is used to display the values of variables i,j,x and y to the console. 
	//Operations like addition are used on these variables to calculate i + j and x + y respectively.
	cout << '\n' << i << '+' << j << " = " << i + j << endl 
		<< x << '+' << y << " = " << x + y << endl;
	system("pause");
	system("CLS");

	//Experiment 1
	//This experiment is the same thing as our example above. i + j and x + y are shown independently
	//then calculated. The symbols '+' and '=' are purely for displaying to the user.
	cout << i << '+' << j << " = " << i + j << endl
		<< x << '+' << y << " = " << x + y << endl;
	system("pause");
	system("CLS");

	//Experiment 2
	//This experiment displays the following sentence in the console. To display
	//properly, quotations are used. endl; begins a new line on the console. 
	cout << "Hello, welcome to our lab 2 project" << endl;
	system("pause");
	system("CLS");

	//Experiment 3
	//This experiment subtracts, multiplies, then divides i and j then x and y.
	//Once again, the symbols in quotations are for display purposes while
	//the actual calculation is then made after. 
	//- is subtracting, * is multiplication while / is division.
	cout << i << '-' << j << " = " << i - j << endl
		<< x << '-' << y << " = " << x - y << endl;
	cout << i << '*' << j << " = " << i * j << endl
		<< x << '*' << y << " = " << x * y << endl;
	cout << i << '/' << j << " = " << i / j << endl
		<< x << '/' << y << " = " << x / y << endl;
	system("pause");
	system("CLS");

	//Experiment 4
	//This experiment compares the values of i and j. If i and j are the same,
	//1 is displayed representing TRUE. 0 is actually displayed here representing FALSE.
	//the values of i and j are not the same. This is a boolean comparison.
	cout << (i == j) << endl;
	system("pause");
	system("CLS");

	//Experiment 5
	//This experiment checks if x is less than or equal to 1 AND x is less than or equal to 100.
	//It then after checks if x is less than or equal to 1 OR x is less than or equal to 100.
	//Both are displayed as "1" because the conditions are true!
	cout << ((1 <= x) && (x <= 100)) << endl;
	cout << ((1 <= x) || (x <= 100)) << endl;
	system("pause");
	system("CLS");

	//Experiment 6
	//This experiment consists of multiple operations following BEDMAS rules.
	//It displays the result "6" because it calculates 1/2 times (3-4) times 5
	//plus (6 modulus 7 minus (8 minus 9) divided by 8).
	//The term "Modulus" refers to the remainder of one number divided by another.
	cout << 1 / 2 * (3 - 4) * 5 + (6 % 7 - (8 - 9) / 8) << endl;
	system("pause");
	system("CLS");

	//Question 1
	//The difference between these two lapses in order of operations.
	//In the first operation, i is divided by j first. Then multiplied by 2.
	//In the second operation, i is divided by whatever the result of j times 2 is.
	//The outputs are 1 and 0.25, and are different because of said order of operations.
	cout << '(' << i << '/' << j << ")* 2 = " << i / j * 2 << endl;
	cout << i << '/ (' << j << " * 2) = " << i / (j * 2) << endl;
	system("pause");
	system("CLS");

	//Question 2
	//Bool stands for boolean, and can be considered a binary value having only 2 possible
	//outcomes: TRUE or FALSE. TRUE is represented in binary with the value 1,
	//while FALSE is represented in binary with the value 0.
	bool trueorfalse = 1;
	cout << trueorfalse << endl;
	system("pause");
	system("CLS");

	//Question 3
	//This expression is giving the same result because 'true' is the same as '1'.
	//As explained above, true is considered 1 while false is considered 0, in binary respectively.
	//C++ introduces shortcuts that help translate things like 'true' into 1.
	trueorfalse = true;
	cout << trueorfalse << endl;
	system("pause");
	system("CLS");
}
