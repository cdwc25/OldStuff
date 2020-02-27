//Connor Cerisano (c0630428), 2019-10-24, Proj 2

#include<iostream>
#include<string>
using namespace std;
static int numberOfTestScores; //Global Variable; both functions use this
double scoreTotal; //Variable to add up all possible test scores

//Score Averaging Function. (Notice: No function prototype is needed)
double scoreAverage()
{
	return (scoreTotal / numberOfTestScores); //Return our scoreAverage calculation.
}

int main()
{
	double grade; //Local variable used to temporarily store a grade value.
	cout << "Welcome! This program recieves test scores, averages them, and ";
	cout << "displays the average with a pass/fail grade for that \n";
	cout << "average. Passing is 50 or higher while failing is below 50.\n\n";

	for (;;) //Error checking for getting the number of test scores
	{
		cout << "How many test scores do you have?\n";
		cin >> numberOfTestScores; //Recieve corresponding value from user
		if (cin.fail() || numberOfTestScores <= 0)
		{
			cout << "\nOops! You entered an unsupported value. Please try entering a whole number value above zero.\n";
			cin.clear(); //Make sure cin.fail() does not return true anymore.
			cin.ignore(100, '\n'); //Extract and discard characters from input sequence (avoid getting stuck in an error loop!)
		}
		else break; //If no error occurs, exit loop
	}

	for (int i = 0; i < numberOfTestScores; i++) //Repeat however many times for however many grades we have
	{
		for (;;) //Error checking for getting grade values
		{
			cout << "\nEnter Score " << i + 1 << ": ";
			cin >> grade; //Enter a grade value
			if (cin.fail() || cin.bad()) //If an error DOES occur
			{
				cout << "\nOops! You entered an invalid grade. Please try again!\n";
				cin.clear(); //Make sure cin.fail() does not return true anymore.
				cin.ignore(100, '\n'); //Extract and discard characters from input sequence (avoid getting stuck in an error loop!)
			}
			else //If an error DOES NOT occur
			{
				scoreTotal += grade; //Add value to our total
				break; //Exit error loop
			}
		}
	}

	//Display our average, tell user if the average is considered passing or failing
	cout << "\nYour average is: " << scoreAverage();
	if (scoreAverage() < 50) cout << "\nBelow 50 is a fail.... Never give up!\n\n";
	else cout << "\nAbove or equal to 50 is considered a pass in my books. Awesome, keep it up!\n\n";
	system("pause");
}