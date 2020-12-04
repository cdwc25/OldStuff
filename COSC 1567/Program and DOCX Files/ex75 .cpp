//ex7-7.cpp
#include<iostream>
#include<conio.h>
#include<string.h>
using namespace std;
class SalesOffice
{
	private: 
		char officeName[20];;
		double sales;
	public:
		SalesOffice(const char office[], const double salesAmt);
		double operator /(const SalesOffice &office);
		friend ostream & operator<<(ostream& out, const SalesOffice &anOffice);
};
SalesOffice::SalesOffice(const char office[], const double salesAmt)
{
	strcpy_s(officeName, office);
	sales = salesAmt;
}
double SalesOffice::operator /(const SalesOffice &office)
{
	double ratio;
	ratio = sales / office.sales;
	return ratio;
};
ostream &  operator<<(ostream& out, const SalesOffice &anOffice)
{
	out <<"The "<<anOffice.officeName
		<<" Office sold $"<<anOffice.sales<<endl;
	return out;
}

void main()
{
	SalesOffice north("North", 2415.75);
	SalesOffice south("South", 2812.44);
	double ratio;
	ratio = north/south;
	operator<<(cout, north);
	cout <<north;
	cout <<south;
	cout<<north<<south;
	operator <<(operator <<(cout, north), south);
	operator<<(cout, south);
	cout << "The North office has : "<<ratio*100
		<<" of the sales of South Office."
		<<endl;
	_getch();
}

