//Connor Cerisano, c0630428, 2-3, 1/17/2020

//Debug 2-3
#include <iostream> //iostream.h doesn't exist, use iostream instead
#include <conio.h>
using namespace std; //We need to use a namespace so that we can use cin and cout correctly

class TermPaper
{
	public: //We need to give our int variable a privacy level so we can use it in void main()
	int pages;
};

void main()
{
	TermPaper myHistoryPaper;
	double costToType;
	const double costPerPage = .46;
	myHistoryPaper.pages = 37;
	cout << "The paper is " << myHistoryPaper.pages << " pages long." << endl;
	costToType = myHistoryPaper.pages * costPerPage;
	cout << "The cost to type the paper is " << costToType << endl; //Got rid of an "is"
	_getch(); //_getch(); is used instead of getch();
}
