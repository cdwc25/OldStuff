//Connor Cerisano, (0630428) 10/12/2019, Lab 5

//Include Directives
#include <iostream>
#include <string>

using namespace std;

int main() //Main Function
{
	//Debug variables, used to reset strings back to input condition
	string fN, lN;

	//Welcome user to program
	cout << "Welcome. This program's purpose is to play with names!\n";

	//1,2: Enter first and last name, store in string variables
	string firstName, lastName;
	cout << "Please enter a first and last name:\n";
	cin >> firstName;
	cin >> lastName;
	fN = firstName; //Store original first name
	lN = lastName; //Store original last name

	//3: Compare first/last name, print out if firstName > lastName
	//Checks value of first character that doesn't match. Otherwise outputs 0 (if they are equal)
	cout << "\n(3):\n";
	cout << (firstName > lastName) << endl;
	cout << firstName.compare(lastName) << endl;

	//4: Enter middle initial as string variable
	string initial;
	cout << "\n(4):\n";
	cout << "Please enter a middle initial:\n";
	cin >> initial;

	//5: Put first and last name together into a full name, print full name
	cout << "\n(5):\n";
	cout << firstName + " " + lastName << endl;
	cout << (firstName += (" " + lastName)) << endl;
	firstName = fN; //Reset variable, since appending (using +=) modifies our variable
	lastName = lN; //Reset variable, since appending (using +=) modifies our variable
	cout << firstName.append(" " + lastName) << endl;
	firstName = fN; //Reset variable, since .append() modifies our variable
	lastName = lN; //Reset variable, since .append() modifies our variable

	//6: Insert middle initial at right position, print full name again
	//(fullName.size() is always positioned at the end of a string)
	string fullName = firstName + " " + lastName;
	cout << "\n(6):\n";
	cout << fullName.insert(fullName.size()," " + initial + ".") << endl;

	//7: Get initial from last name, print out
	//(Substrings are strings generated from another string)
	cout << "\n(7):\n";
	cout << fullName.substr(fullName.size() - 2, 2) << endl;

	//8: Enter a letter that belongs to your name, store as a char variable
	char letter;
	cout << "\n(8):\n";
	cout << "Please enter any letter that belongs somewhere in your full name:\n";
	cin >> letter;

	//9: Search position of letter in full name, print out position
	cout << "\n(9):\n";
	cout << fullName.find(letter) << endl;
	cout << fullName.find_first_of(letter) << endl;

	//10: Use the position to erase 3 characters from full name, print out full name again
	int position = fullName.find(letter);
	string deletedLetters = fullName.substr(position,3);
	cout << "\n(10):\n";
	cout << fullName.erase(position, 3) << endl;

	//11: Recover full name by inserting the deleted letters, print out recovered full name
	cout << "\n(11):\n";
	cout << fullName.insert(position, deletedLetters) << endl;

	system("pause"); //Pause program
}