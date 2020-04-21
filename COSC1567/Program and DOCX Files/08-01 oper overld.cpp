//08-01
//+ - ==  operators overlolad
#include <iostream>
#include <cstdlib>
#include <cmath>
#include <conio.h>
using namespace std;

//Class for amounts of money in U.S. currency.
class Money
{
public:
    Money( ); //constructor
    Money(double amount);
    Money(int theDollars, int theCents);
    Money(int theDollars);
    double getAmount( ) const;
    int getDollars( ) const;
    int getCents( ) const;
    void input( ); //Reads the dollar sign as well as the amount number.
    void output( ) const;
private:
    int dollars; //accessible only by member functions
    int cents; //Negative $x.y is represented as -x and -y

    int dollarsPart(double amount) const;
    int centsPart(double amount) const;
    int round(double number) const;
};

const Money operator +(const Money& amount1, const Money& amount2);

const Money operator -(const Money& amount1, const Money& amount2);

bool operator ==(const Money& amount1, const Money& amount2);

const Money operator -(const Money& amount);

int main( )
{
    Money yourAmount, myAmount(10, 9);
	
	cout << "Enter a +- amount of money with $ in front: "<<endl;
	cout << "($-x.y means -x $   and -y cents)";
    yourAmount.input( );

    cout << "Your amount is "; 
	//_getch();

    yourAmount.output( ); 
    cout << endl;
	_getch();
    cout << "My amount is "; 
    myAmount.output( ); 
    cout << endl;
	_getch();
    if (yourAmount == myAmount)
        cout << "We have the same amounts.\n";
    else
        cout << "One of us is richer.\n";

    Money ourAmount = yourAmount + myAmount;//adding two objects with overloaded + operator
    yourAmount.output( ); 
	cout << " + "; 
	myAmount.output( ); 
    cout << " equals "; ourAmount.output( ); cout << endl;

    Money diffAmount = yourAmount - myAmount;
    yourAmount.output( ); cout << " - "; myAmount.output( ); 
    cout << " equals "; diffAmount.output( ); cout << endl;
	_getch();
    return 0;
}

const Money operator +(const Money& amount1, const Money& amount2)
{
    int allCents1 = amount1.getCents( ) + amount1.getDollars( )*100;
    int allCents2 = amount2.getCents( ) + amount2.getDollars( )*100;
    int sumAllCents = allCents1 + allCents2;
    int absAllCents = abs(sumAllCents); //Money can be negative.
    int finalDollars = absAllCents/100;
    int finalCents = absAllCents%100;

    if (sumAllCents < 0)
    {
        finalDollars = -finalDollars;
        finalCents = -finalCents;
    }
	cout << "from operator +: finalFDollars , finalCents" << finalDollars << " ,  " << finalCents << endl;

	//return Money(finalDollars, finalCents);   //anonymous object ;constructor returning an object

	//equivalent solution with temp object
	Money temp;
	cout << "temp.Dollars:   " << temp.getDollars() << "   temp.Cents:   " << temp.getCents() << endl;
	temp = Money(finalDollars, finalCents);//constructor returning an object
	cout << "temp.getDollars:   " << temp.getDollars() << "   temp.getCents:   " << temp.getCents() << endl;
	cout << "temp.output: ";
	temp.output(); cout << endl;
	return temp;
}

//Uses cstdlib:
const Money operator -(const Money& amount1, const Money& amount2)
{
    int allCents1 = amount1.getCents( ) + amount1.getDollars( )*100;
    int allCents2 = amount2.getCents( ) + amount2.getDollars( )*100;
    int diffAllCents = allCents1 - allCents2;
    int absAllCents = abs(diffAllCents); 
    int finalDollars = absAllCents/100;
    int finalCents = absAllCents%100;

    if (diffAllCents < 0)
    {
        finalDollars = -finalDollars;
        finalCents = -finalCents;
    }

    return Money(finalDollars, finalCents);
}

bool operator ==(const Money& amount1, const Money& amount2)
{
    return ((amount1.getDollars( ) == amount2.getDollars( ))
           && (amount1.getCents( ) == amount2.getCents( )));
}

const Money operator -(const Money& amount)
{
    return Money(-amount.getDollars( ), -amount.getCents( ));
}

Money::Money( ): dollars(0), cents(0)
{/*Body intentionally empty.*/}

Money::Money(double amount)
              : dollars(dollarsPart(amount)), cents(centsPart(amount))
{/*Body intentionally empty*/}

Money::Money(int theDollars)
              : dollars(theDollars), cents(0)
{/*Body intentionally empty*/}

//Uses cstdlib:
Money::Money(int theDollars, int theCents)//constructor
{
    if ((theDollars < 0 && theCents > 0) || (theDollars > 0 && theCents < 0))
    {
        cout << "Inconsistent money data.\n";
		//_getch();
        exit(1);
    }
    dollars = theDollars;
    cents = theCents;
}

double Money::getAmount( ) const
{
    return (dollars + cents*0.01);
}

int Money::getDollars( ) const
{
    return dollars;
}

int Money::getCents( ) const
{
    return cents;
}

//Uses iostream and cstdlib:
void Money::output( ) const
{
    int absDollars = abs(dollars);
    int absCents = abs(cents);
    if (dollars < 0 || cents < 0)//accounts for dollars == 0 or cents == 0
        cout << "$-";
    else
        cout << '$';
    cout << absDollars;

    if (absCents >= 10)
        cout << '.' << absCents;
    else
        cout << '.' << '0' << absCents;
}

//Uses iostream and cstdlib:
void Money::input( )
{
    char dollarSign;
    cin >> dollarSign; //hopefully
    if (dollarSign != '$')
    {
        cout << "No dollar sign in Money input.\n";
		_getch();
        exit(1);
    }

    double amountAsDouble;
    cin >> amountAsDouble;
    dollars = dollarsPart(amountAsDouble);//private dollars and function
    cents = centsPart(amountAsDouble);//private cdnts and function
}

int Money::dollarsPart(double amount) const
{
    return static_cast<int>(amount);
}

int Money::centsPart(double amount) const
{
    double doubleCents = amount*100;
    int intCents = (round(fabs(doubleCents)))%100;//% can misbehave on negatives
    if (amount < 0)
        intCents = -intCents;
    return intCents;
}

int Money::round(double number) const
{
    return static_cast<int>(floor(number + 0.5));
}


