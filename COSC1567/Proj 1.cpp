//Connor Cerisano, 1/16/2020, Proj 1

#include <iostream> //cin,cout,etc
#include <cmath> //fabs()
#include <iomanip> //setprecision

using namespace std;

//Function Prototype
double babylonianAlgorithm(double n);

void main() 
{
	double n; //Create our double n, for user input and use in the algorithm

	cout << "Welcome! This program implements the Babylonian Algorithm to compute\n"
		<< "the square root of a positive number n. To start, please enter n:\n\n";

	cin >> n;

	//Output the answer as a double to two decimal places, in fixed notation
	cout << "\nThe Babylonian Algorithm outputs the square root of " << n << " to be "
		<< fixed << showpoint << setprecision(2) << "approximately " << babylonianAlgorithm(n) << ".\n\n";

	system("pause"); //Pause console so we can see results
}

//Function Definition
double babylonianAlgorithm(double n)
{
	double r, currentGuess, lastGuess;

	//Step 1: Make a guess at the answer (n/2 is going to be the default guess)
	currentGuess = n / 2;

	//Implementation of Step 4 (Go back to step 2/3 for as many iterations as necessary.)
	do {

		//Step 2: Compute r = n / guess
		r = n / currentGuess;

		//Update lastGuess so we can continue (avoid infinite loops of calculation!)
		lastGuess = currentGuess;

		//Step 3: Set guess = (guess + r) / 2
		currentGuess = (currentGuess + r) / 2;

		//DEBUG
		//cout << "(Error Percentage: " << (fabs(lastGuess - currentGuess) / lastGuess) << ")";

		//Only loop if the error percentage is within 1% of the previous guess
	} while (fabs(lastGuess - currentGuess) / lastGuess >= 0.01);
	
	//If the above loop's conditions are met, return our final guess
	return currentGuess;
}