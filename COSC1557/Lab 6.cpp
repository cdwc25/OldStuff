//Connor Cerisano (c0630428), 2019-10-22, Lab 6

#include<iostream>
#include<string>
#include<cctype>
using namespace std;

//Function that receives 3 values, returns maximum of 3 values
double Max(double first, double second, double third)
{
	if (first > second)
		if (first > third)
			return first;
		else
			return third;
	else if (second > third)
		return second;
	else
		return third;
}

//Alphabetic String Check Function
bool alphabeticString(string word)
{
	for (int i = 0; i < word.length();i++)
	{
		char letter = word[i]; //Make a given position (i) in the string a character
		if (isalpha(letter)) //Check if current letter is an alphabetic letter
		{
			continue; //Go to next iteration of the for loop
		}
		else if (isalpha(letter) == 0) //Check if current letter is NOT an alphabetic letter
		{
			return false; //String is not "alphabetic"
			break; //Stop loop so we don't return true after
		}
	}
	return true; //If the for loop completes without error, then the string must be alphabetic!
}

//Main Function
int main() 
{
	double x, y, z; //User input for the 3-value function
	string word; //User input for the string check function

	cout << "Welcome! This program receives and returns values, playing with function behaviour.\n";
	cout << "To start, please enter 3 numbers. The console will then output the maximum of these 3 values.\n";
	cin >> x;
	cin >> y;
	cin >> z;
	for (;;) //Error checking for getting user input
	{
		if (cin.fail()) // Check if there was a recent issue with a cin
		{
			cout << "Oops! Try entering the 3 numbers again:\n";
			cin.clear(); //Make sure cin.fail() does not return true anymore.
			cin.ignore(100, '\n'); //Ignore 100 inputs, or until '\n' is found (enter)
			//Make the user re-input values
			cin >> x;
			cin >> y;
			cin >> z;
		}
		else break; //If cin.fail() is false, break the infinite loop and continue the program.
	}
	cout << "The maximum value is: " << Max(x, y, z) << endl; //Display maximum value

	cout << "\nNext we will check if a given string is alphabetic.\n";
	cout << "Please enter a string:\n";
	cin >> word;
	for (;;) //Make user re-input string until it is alphabetic
	{
		if (alphabeticString(word) == 1) //If string IS alphabetic
		{
			cout << "This string is alphabetic!\n\n";
			break; //End loop
		}
		else //If string IS NOT alphabetic
		{
			cout << "This string is NOT alphabetic.\n";
			cout << "\nPlease enter another string:\n";
			cin.clear(); //Clear previous input, just in case!
			cin >> word; //Make the user re-input value
		}
	}
	system("pause");
}