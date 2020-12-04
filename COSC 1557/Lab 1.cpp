/*
//SOURCE 1
#include <iostream>
using namespace std;
int main()
{
	cout << "\nThis program inputs a base-10 integer"
		<< "\n\tand displays its value in bases 8 and 16\n";
	cout << "\nPlease enter an integer: ";
	int aNumber;
	cin >> aNumber;
	cout << "\n\nThe base-8 representation of " << aNumber << " is "
		<< oct << aNumber
		<< ",\n\tand the base-16 representation is "
		<< hex << aNumber
		<< "\n\n";
	system("pause");
	return 0;
}
*/

/*
//SOURCE 2
#include <iostream> //cin, cout <<,>>
using namespace std;
int main()
{
	const double FEET_PER_ATM = 33.0,
		LBS_PER_SQ_IN_PER_ATM = 14.7;
	cout << "\nScuba pressure calculator!!"
		<< "\n Enter the depth (feet): ";
	double depth;
	cin >> depth;
	double pressure = ((depth / FEET_PER_ATM) + 1)
		* LBS_PER_SQ_IN_PER_ATM;
	cout << "\nThe pressure at " << depth
		<< " feet is " << pressure
		<< " lbs/sq.in" << endl;
	system("pause");
}
*/

//SOURCE 3
#include <iostream>
using namespace std;
int main()
{
	cout << "Hello, I am Connor C."
		<< "\nI am 18, and my major is in Computer Science."
		<< "\nMy anticipated year of graduation is 2023. \n\n";

	system("pause");
}