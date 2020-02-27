// Connor Cerisano
// 2020-02-22
// Lab 5, Debug 6-4

// Debug 6-4

#include <iostream> //iostream.h doesn't exist, use iostream instead
#include <conio.h>

using namespace std; //We need a namespace so we can use cin and cout correctly

class Dress
{
private:
    char material[20];
    int size;
    char style[10];
    double price;

public:
    //sz needs to be declared, and needs a default parameter! Also added const to chars
    Dress(const char mtrl[] = "cotton", int sz = 0, const char stl[] = "daytime");
    void displayDress();
};

Dress::Dress(const char mtrl[], int sz, const char stl[])
{
    strcpy_s(material, mtrl); //use strcpy_s instead
    size = sz; //Changed order here
    strcpy_s(style, stl); //use strcpy_s instead
    price = 29.99;
    if (strcmp(material, "silk") == 0)
        price += 20.00;
    if (strcmp(style, "evening") == 0)
        price += 40.00;
}

void Dress::displayDress()
{
    cout << "A size " << size << " dress made of " << material << " and suitable for " <<
        style << " wear costs $" << price << endl;
}

void main()
{
    cout << "Dress sale! $29.99. Only $20 more for sil. Only $40 more for evening designs." << endl;

    Dress dressA, dressB("wool"), dressC("silk", 14, "evening"),
        dressD("denim", 4, "casual"), dressE("silk", 8, "business");

    dressA.displayDress();
    dressB.displayDress();
    dressC.displayDress();
    dressD.displayDress();
    dressE.displayDress();

    _getch(); //getch(); is deprecated, use _getch(); instead
}