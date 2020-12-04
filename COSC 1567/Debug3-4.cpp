// Connor Cerisano, 0630428, 2020-02-03, Lab 3

// DEBUG 3-4
// creates Pig Latin
// example - user types "dog"
// output is "ogday"

//Library iostream.h doesn't exist, but iostream does!
#include <iostream>
#include <conio.h>

//We need a namespace to use cin and cout correctly
using namespace std;

void main()
{
    char word[20];

    //Added some spacing here, just to look good
    cout << "Enter a word \n";
    cin >> word;
    cout << "\nIn Pig Latin: \n";

    for (int x = 1; x < 20; x++) {
        //Changed while to if statement, put inside a for loop
        //Added more conditions, to make sure that empty values are not being evaluated
        if (word[x] != NULL && word[x] > 0 && word[x] < 127)
        {
            cout << word[x];
        }
    }

    cout << word[0] << "ay" << endl;

    _getch(); //getch(); is deprecated, use _getch(); instead
}


