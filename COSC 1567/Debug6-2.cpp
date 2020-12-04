// Connor Cerisano
// 2020-02-22
// Lab 5, Debug 6-2

//Debug 6-2

#include <iostream> //iostream.h doesn't exist, use iostream instead
#include <conio.h>

using namespace std; //We need a namespace so we can use cin and cout correctly

class BirthdayCake
{
private:
    int orderNumber;
    char cakeFlavor[20];
    char frostingFlavor[20];
    int numCandles;

public:
    //Added const to char
    BirthdayCake(int num, const char cake[] = "white", const char frost[] = "vanilla", int numCandles = 1);
    void displayBirthdayCake();
};

//No need to redefine our default arguments! Also added const here as well
BirthdayCake::BirthdayCake(int num, const char cake[], const char frost[], int candles)
{
    orderNumber = num;

    //strcpy_s works when we are dealing with char arrays!
    strcpy_s(cakeFlavor, cake);
    strcpy_s(frostingFlavor, frost);

    numCandles = candles;
}

void BirthdayCake::displayBirthdayCake()
{
    cout << "Order #" << orderNumber << " " << cakeFlavor << " cake with " <<
        frostingFlavor << " frosting and " << numCandles;
    if (numCandles == 1)
        cout << " candle";
    else cout << " candles";
    cout << endl;
}

void main()
{
    cout << "Cakes are white with vanilla frosting and 1 candle unless otherwise indicated" << endl;

    BirthdayCake a(111, "chocolate", "chocolate", 8);
    BirthdayCake b(222, "yellow", "chocolate");
    BirthdayCake c(333, "banana");
    BirthdayCake d(444);

    a.displayBirthdayCake();
    b.displayBirthdayCake();
    c.displayBirthdayCake();
    d.displayBirthdayCake();

    _getch(); //getch(); is deprecated, use _getch(); instead
}

