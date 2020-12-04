// Connor Cerisano
// 2020-03-17
// Project 3

#include <iostream> //cin,cout
#include <cmath> //perform more complex math operations
using namespace std;

class PrimeNumber
{
private:
	int number;
	//Functions to help with our overloaded prefix/postfix function
	//Note: defined outside of class
	bool isPrimeNumber(int number);
	int nextPrimeNumber(int number);
	int lastPrimeNumber(int number);

public:
	//Default Constructor
	PrimeNumber()
	{
		number = 1;
	}
	//Constructor that allows the caller to set the prime number
	PrimeNumber(int value)
	{
		number = value;
	}
	//Function that gets the prime number
	int getNumber()
	{
		return number;
	}
	//Overload prefix/postfix ++ and -- operators
	//Note: defined outside of class
	PrimeNumber operator ++(int);
	PrimeNumber operator --(int);
};

//isPrimeNumber function definition
//boolean value for whether number is prime or not
bool PrimeNumber::isPrimeNumber(int number)
{
	if (number < 2) return false;
	if (number == 2) return true;
	if (number % 2 == 0) return false;

	//Iterate odd numbers only!
	//Another way to return false:
	const int squareRoot = sqrt(number);
	for (int div = 3; div <= squareRoot; div += 2)
	{
		if (number % div == 0) return false;
	}
	return true;
}

//nextPrimeNumber function definition
//increments number
int PrimeNumber::nextPrimeNumber(int number) 
{
	int next = 0;
	//Loop until number is a prime number.
	//If the number is prime, return the next number
	while (true) {
		number++;
		if (isPrimeNumber(number)) 
		{
			next = number;
			break;
		}
	}
	return next;
}

//lastPrimeNumber function definition
//same as nextPrimeNumber, but decrements number
int PrimeNumber::lastPrimeNumber(int number)
{
	int next = 0;
	//Loop until number is a prime number.
	//If the number is prime, return the next number
	while (true) {
		number--;
		if (isPrimeNumber(number))
		{
			next = number;
			break;
		}
	}
	return next;
}

//Overloaded prefix/postfix ++ and -- operator functions
//Relies on nextPrimeNumber and lastPrimeNumber to function correctly
//which rely on isPrimeNumber to increment and decrement correctly
PrimeNumber PrimeNumber::operator ++(int)
{
	PrimeNumber pN;
	pN.number = nextPrimeNumber(number);
	return pN;
}
PrimeNumber PrimeNumber::operator --(int)
{
	PrimeNumber pN;
	pN.number = lastPrimeNumber(number);
	return pN;
}

//Main function
void main()
{
	//User Input
	int input = 0;
	cout << "Welcome! Enter a prime number: ";
	cin >> input;

	//Increment and decrement based on our input
	PrimeNumber p(input), increment, decrement;
	increment = p++;
	decrement = p--;

	//Display our results
	cout << "The closest largest prime number is: " << increment.getNumber() << endl;
	cout << "The closest smallest prime number is: " << decrement.getNumber() << endl;

	system("pause"); //Pause console so we can see results
}