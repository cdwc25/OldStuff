// Connor Cerisano
// Lab 7-4
// 2020-03-13

//iostream.h doesn't exist, use iostream instead
#include <iostream>
#include <conio.h>
#include <string.h>

using namespace std; //Added a namespace so we can use cin and cout correctly

class Order
{
	//Made this function a friend :)
	friend Order yearEndTotal(Order summary, Order oneOrder);

private:
	char customerName[20];
	int orderQuantity;

public:
	//Moved the default constructor's definition inside the class
	Order()
	{
		strcpy_s(customerName, "Total"); //strcpy is deprecated, use strcpy_s instead
		orderQuantity = 0;
	}

	//Gave type void to these functions
	void setValues();
	void displayValues();
};

//Gave the functions setValues and displayValues proper access to the class Order
void Order::setValues()
{
	cout << "Enter customer name ";
	cin >> customerName;
	cout << "Enter quantity ordered: ";
	cin >> orderQuantity;
}

void Order::displayValues()
{
	//Added << where it was needed.
	cout << customerName << " ordered " << orderQuantity << " items." << endl;
}

Order yearEndTotal(Order summary, Order oneOrder)
{
	summary.orderQuantity += oneOrder.orderQuantity; //Added +
	return(summary);
}

void main()
{
	//Variables
	const int ORDERS = 10;
	Order anOrder[ORDERS];
	Order summary;
	int x;

	for (x = 0; x < ORDERS; ++x) //removed ;
	{
		anOrder[x].setValues();
	}

	for (x = 0; x < ORDERS; ++x)
	{
		summary = yearEndTotal(summary, anOrder[x]);
	}

	summary.displayValues();

	_getch(); //getch(); is deprecated, use _getch(); instead
}


