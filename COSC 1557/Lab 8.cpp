//Connor Cerisano (c0630428), 2019-11-10, Lab 8

#include <iostream>       // cin, cout, <<, >>, good(), etc
using namespace std;

void Change(int& param1, int& param2, int param3); //Function prototype for Change()

int main()
{
	cout << "EXPERIMENT 1" << endl;
	int p1, p2, p3; //Local variables for user input

	cout << "Welcome! Please enter 3 integers:" << endl;
	for (;;) //Error checking for entering integers
	{
		//user input for p1, p2 and p3
		cin >> p1;
		cin >> p2;
		cin >> p3;
		if (cin.fail()) //If input is invalid
		{
			cout << "\nOops! You entered an unsupported value somewhere. Please try entering 3 valid integers.\n";
			cin.clear(); //Make sure cin.fail() does not return true anymore.
			cin.ignore(100, '\n'); //Extract and discard characters from input sequence
		}
		else break; //If no error occurs, exit loop
	}

	cout << "\nNow please enter another 3 integers:" << endl;
	for (;;) //Error checking for Change() function
	{
		Change(p1, p2, p3); //Execute our change function using variables p1,p2, and p3.
		if (cin.fail()) //If input is invalid
		{
			cout << "\nOops! You entered an unsupported value somewhere. Please try entering 3 valid integers.\n";
			cin.clear(); //Make sure cin.fail() does not return true anymore.
			cin.ignore(100, '\n'); //Extract and discard characters from input sequence
		}
		else break; //If no error occurs, exit loop
	}

	//output p1, p2, and p3
	cout << "\nP1: " << p1 << endl;
	cout << "P2: " << p2 << endl;
	cout << "P3: " << p3 << endl << endl;

	/* Experiment 1 Question:
	param1 and param2 are reference variables. If we change them, we actually change p1 and p2
	because that's what we are referencing to. param3 is not a reference variable, so p3 does
	not change after Change() is called. Only the copy of the value changes inside the function.

	If we delete the ampersand before param2, we get the same effect as param3. Change() does not
	change p2, only the copy of that value, param2. Once the function ends, we see the value of p2 unchanged. 
	param2 would change, but we can't access it outside of the Change() function.
	*/
	
	cout << "EXPERIMENT 2" << endl;
	int arg1; //Local variable to demonstrate scope
	arg1 = -1; //Set arg1 to a unique value, once again so we can demonstrate scope

	//... (output arg1 to see initial value)
	cout << arg1 << endl; 

	{ //Scope exists in blocks, identified with the symbols "{" and "}".
		char arg1 = 'A';
		//output arg1 (notice different data type and value inside this scope)
		cout << arg1 << endl;
	}

	//output arg1 (see if arg1's value has changed or not)
	cout << arg1 << endl;

	/* Experiment 2 Question:
	- The scope of an identifier refers to WHERE an identifier is bound to a particular meaning.
    - The scope of an identifier begins at its declaration, and ends at the end of the block {}.

	In this experiment, arg1 outputs as "-1", then "A", then finally "-1" again. This is because
	arg1 exists in 2 different blocks and therefore has 2 different scopes. (it is bound to a different 
	meaning in 2 different places.) The fact that these scopes are seperate and different, is what allows 
	arg1 to have a different data type and value with the same identifier.
	*/

	system("pause"); //Pause console so we can see our results
}

void Change(int& param1, int& param2, int param3) //Function definition for Change()
{
	//Get the user to input 3 parameters
	cin >> param1;
	cin >> param2;
	cin >> param3;
}